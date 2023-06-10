import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razasheikhtest/appWidgets/app_button.dart';
import 'package:razasheikhtest/app_constants/app_colors.dart';
import 'package:razasheikhtest/modules/products/products_view_model/products_view_model.dart';
import 'package:razasheikhtest/modules/products/view/rating_starts.dart';
import 'package:razasheikhtest/utils/app_images.dart';
import 'package:razasheikhtest/utils/app_strings.dart';
import 'package:razasheikhtest/utils/padding_ext.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  RxBool isBottomUp = false.obs;
  ProductViewModel productViewModel =Get.find<ProductViewModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var arg = Get.arguments??{};
    productViewModel.getProductDetails(arg['id'].toString());
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SizedBox(
            height: height,
            child: Obx(() =>productViewModel.isLoadingDetails.value==true? SizedBox(
                height: MediaQuery.of(context).size.height*0.80,
                child: const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,))): Stack(
              alignment: Alignment.topCenter,
              children: [
                SizedBox(
                  height:isBottomUp.value==true?height * 0.50: height * 0.60,
                  child: Stack(
                    children: [
                      CachedNetworkImage(
                        width: width,
                        height: height * 0.60,
                        fit: BoxFit.fill,
                        placeholder: (context, url) => Center(
                            child: Image.asset(
                              AppImages.applicationLogo,
                              height: height * 0.25,
                              width: width * 0.90,
                            )),
                        imageUrl:
                        productViewModel.productDetailsModel.image.toString(),
                        errorWidget: (context, url, error) =>
                        //Return Error Image
                        Container(
                          alignment: Alignment.center,
                          // use alignment for Size to take effect
                          child: Image.asset(
                            AppImages.applicationLogo,
                            height: height * 0.25,
                            width: width * 0.90,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              child: topIconButton(Icons.arrow_back),
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            topIconButton(Icons.more_vert),
                          ],
                        ),
                      ),
                       Padding(
                        padding: const EdgeInsets.only(bottom: 20, left: 30),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "${productViewModel.productDetailsModel.price} AED",
                            style: const TextStyle(
                                color: AppColors.darkColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 24),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Card(
                      elevation: 6.0,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      margin: const EdgeInsets.all(0),
                      child: SizedBox(
                        height:isBottomUp.value==true? height*0.40: height * 0.30,
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child:SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  10.sizeBoxHeight,
                                  Center(
                                    child: InkWell(
                                      onTap: () {
                                        isBottomUp.value = !isBottomUp.value;
                                      },
                                      child: Image.asset(
                                        isBottomUp.value == true
                                            ? AppImages.arrowUpIcon
                                            : AppImages.arrowDownIcon,
                                        height: 20,
                                        width: 20,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20,horizontal: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.3),
                                                spreadRadius: 5,
                                                blurRadius: 7,
                                                offset: const Offset(0,
                                                    3), // changes position of shadow
                                              ),
                                            ],
                                            color: Colors.white,
                                            borderRadius:
                                            BorderRadius.circular(10),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Image.asset(
                                              AppImages.shareIcon,
                                            ),
                                          ),
                                        ),
                                        ApplicationButton(
                                            title: AppStrings.orderText,
                                            onPressed: () {},
                                            fillColor: false)
                                      ],
                                    ),
                                  ),
                                  const Text(
                                    AppStrings.productDescription,
                                    style: TextStyle(color: Colors.grey,fontStyle: FontStyle.italic,fontSize: 15),
                                  ),
                                  10.sizeBoxHeight,
                                   Text(
                                      productViewModel.productDetailsModel.description.toString(),
                                      style: const TextStyle(color: AppColors.darkColor,fontSize: 14)),
                                  10.sizeBoxHeight,
                                  if (isBottomUp.value) reviewWidget(),
                                  10.sizeBoxHeight,
                                ],
                              ),
                            )
                        ),
                      )
                  ),
                )
              ],
            ),)
          ),
        ),
      ),
    );
  }

  Widget reviewWidget() {
    return Container(
      height: MediaQuery.of(context).size.height*0.10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.reviewBackground,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
              "Reviews (${productViewModel.productDetailsModel.rating!.count})",
              style: const TextStyle(color: AppColors.darkColor),
            ),
            10.sizeBoxHeight,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text(
                     productViewModel.productDetailsModel.rating!.rate.toDouble().toString(),
                    style: const TextStyle(
                        color: AppColors.darkColor,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  RatingStar(
                    rating: productViewModel.productDetailsModel.rating!.rate.toDouble(),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget topIconButton(var icon) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
          child: Icon(
        icon,
        size: 22,
        color: AppColors.darkColor,
      )),
    );
  }
}

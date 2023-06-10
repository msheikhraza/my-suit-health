import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razasheikhtest/app_constants/app_colors.dart';
import 'package:razasheikhtest/modules/products/models/all_product_model.dart';
import 'package:razasheikhtest/modules/products/view/rating_starts.dart';
import 'package:razasheikhtest/routes/app_routes.dart';
import 'package:razasheikhtest/utils/app_images.dart';
import 'package:razasheikhtest/utils/padding_ext.dart';

class ProductCard extends StatelessWidget {
  AllProductsModel productsModel;
  ProductCard({required this.productsModel,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: (){
          Get.toNamed(Routes.productDetailScreen,arguments: {'id':productsModel.id});
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: width ,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  ClipRRect(
                    borderRadius:  BorderRadius.circular(20),
                    child: CachedNetworkImage(
                      width: width ,
                      height: height * 0.25,
                      fit: BoxFit.fill,
                      placeholder: (context, url) => Center(
                          child: Image.asset(
                            AppImages.applicationLogo,
                            height: height*0.25,
                            width: width*0.90,
                          )),
                      imageUrl: productsModel.image.toString(),
                      errorWidget: (context, url, error) =>
                      //Return Error Image
                      Container(
                        alignment: Alignment.center,
                        // use alignment for Size to take effect
                        child: Image.asset(
                          AppImages.applicationLogo,
                          height: height*0.25,
                          width: width*0.90,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                         Text(
                          "${ productsModel.price} AED",
                          style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),
                        ),
                        RatingStar(rating:  productsModel.rating!.rate.toDouble(),)
                      ],
                    ),
                  )
                ],
              ),
            ),
            20.sizeBoxHeight,
             Text( productsModel.title.toString(),style: const TextStyle(color: Colors.grey,fontStyle: FontStyle.italic),),
            10.sizeBoxHeight,
             Text(productsModel.description.toString(),style: const TextStyle(color: AppColors.darkColor,fontSize: 12,fontWeight: FontWeight.w200),),
            30.sizeBoxHeight,
            const Divider(height: 0.3,color: Colors.grey,thickness: 0.7,)
          ],
        ),
      ),
    );
  }
}

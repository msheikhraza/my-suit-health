import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razasheikhtest/app_constants/app_colors.dart';
import 'package:razasheikhtest/modules/products/products_view_model/products_view_model.dart';
import 'package:razasheikhtest/modules/products/view/product_item_card.dart';
import 'package:razasheikhtest/utils/app_strings.dart';

class AllProducts extends StatefulWidget {
  const AllProducts({Key? key}) : super(key: key);

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {

  ProductViewModel productViewModel =Get.find<ProductViewModel>(); 
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productViewModel.getAllProduct();
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(70.0), // here the desired height
            child: AppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              title: const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(AppStrings.homeAppBarText,style: TextStyle(color: AppColors.darkColor,fontSize: 22,fontWeight: FontWeight.w600),),
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Obx(() => Column(
              children: [
                productViewModel.isLoading.value==true? SizedBox(
                  height: MediaQuery.of(context).size.height*0.80,
                    child: const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,))): ListView.builder(
                    itemCount: productViewModel.allProductsList.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(16.0),
                    itemBuilder: (ctx, index) {
                      return  ProductCard(productsModel: productViewModel.allProductsList[index],);
                    }),

              ],
            ),)
          ),
        ),
      ),
    );
  }
}

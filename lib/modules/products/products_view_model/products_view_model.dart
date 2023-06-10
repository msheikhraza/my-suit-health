import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:razasheikhtest/modules/products/models/all_product_model.dart';
import 'package:razasheikhtest/modules/products/models/product_details_model.dart';
import 'package:razasheikhtest/modules/products/repository/product_repository_impl.dart';

class ProductViewModel extends GetxController{

  ProductRepositoryImpl productRepositoryImpl =ProductRepositoryImpl();
  List<AllProductsModel> allProductsList = [];
  RxBool isLoading = true.obs;
  RxBool isLoadingDetails = true.obs;
  ProductDetailsModel productDetailsModel= ProductDetailsModel();
  getAllProduct()async{
    isLoading.value = true;
    try {
      var response = await productRepositoryImpl.fetchAllProducts();
      if (response.statusCode==200) {
        var val = jsonDecode(response.body);
        allProductsList.clear();
        allProductsList = val.map<AllProductsModel>((item) => AllProductsModel.fromJson(item)).toList();
        isLoading.value = false;
        update();
      } else {
      }
    } catch (error) {
      if (error is TimeoutException) {
      }
      if (error is SocketException) {
      }
    }
  }
  getProductDetails(String id)async{
    isLoadingDetails.value = true;
    try {
      var response = await productRepositoryImpl.fetchProductDetails(id);
      if (response.statusCode==200) {
        var val = jsonDecode(response.body);
        productDetailsModel=ProductDetailsModel.fromJson(val);
        isLoadingDetails.value = false;
        update();
      } else {
      }
    } catch (error) {
      if (error is TimeoutException) {
      }
      if (error is SocketException) {
      }
    }
  }

}
import 'dart:convert';
import 'package:razasheikhtest/app_constants/app_constants.dart';
import 'package:razasheikhtest/httpservice/http_service.dart';
import 'package:razasheikhtest/modules/products/repository/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository{
  HttpService httpService = HttpService();

  @override
  Future<dynamic> fetchAllProducts()async {
    final url = '${AppConstants.baseUrl}products';
    var response = await httpService.baseApi(url, 'get');
    return response;
    }


  @override
  Future<dynamic> fetchProductDetails(String id)async {
    final url = '${AppConstants.baseUrl}products/$id';
    var response = await httpService.baseApi(url, 'get');
    return response;
  }
}
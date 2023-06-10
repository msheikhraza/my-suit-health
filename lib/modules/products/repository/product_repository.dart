

abstract class ProductRepository{
  Future<dynamic> fetchAllProducts();
  Future<dynamic> fetchProductDetails(String id);

}
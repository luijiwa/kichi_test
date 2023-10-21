import 'package:dio/dio.dart';
import 'package:lichi_test/domain/entity/list_product.dart';

class ApiService {
  final _dio = Dio();

  Future<List<AProduct>> fetchProducts(String url, Object data) async {
    Response response = await _dio.post(url, data: data);
    if (response.statusCode == 200) {
      final apiData = response.data['api_data'];
      final List<dynamic> aProduct = apiData['aProduct'];

      final List<AProduct> productList =
          aProduct.map((json) => AProduct.fromJson(json)).toList();
      return productList;
    } else {
      throw Exception('Ошибка при загрузке списка товаров');
    }
  }

  Future<AProduct> fetchOneProduct(String url, Object data) async {
    Response response = await _dio.post(url, data: data);
    if (response.statusCode == 200) {
      final apiData = response.data['api_data'];
      final aProduct = apiData['aData'];

      final AProduct productDetails = AProduct.fromJson(aProduct);
      return productDetails;
    } else {
      throw Exception('Ошибка при загрузке данных товара');
    }
  }
}

import 'package:dio/dio.dart';
import 'package:lichi_test/entity/list_product.dart';

class ApiService {
  final _dio = Dio();
  String url = 'https://api.lichi.com/category/get_category_product_list';

  Future<List<AProduct>> fetchProducts() async {
    Response response = await _dio.post(url, data: {
      'shop': 2,
      'lang': 1,
      'category': 'dresses',
      'limit': 12,
      'pages': 1,
    });
    if (response.statusCode == 200) {
      final apiData = response.data['api_data'];
      final List<dynamic> aProduct = apiData['aProduct'];

      final List<AProduct> productList =
          aProduct.map((json) => AProduct.fromJson(json)).toList();
      return productList;
    } else {
      throw Exception('Ошибка при загрузке новостей');
    }
  }
}

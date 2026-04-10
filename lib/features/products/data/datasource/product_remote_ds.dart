import 'package:dio/dio.dart';
import 'package:task_two/core/error/app_error.dart';
import 'package:task_two/features/products/data/models/product_model.dart';

abstract interface class ProductRemoteDs {
  Future<List<ProductModel>> getProducts();
}

class ProductRemoteDsImpl implements ProductRemoteDs {
  final Dio dio;

  ProductRemoteDsImpl({required this.dio});

  @override
  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await dio.get('/products');
      final List result = response.data;
      return result.map((x) => ProductModel.fromJson(x)).toList();
    } on DioException catch (e) {
      throw AppError(dioErrorMessage(e));
    } catch (e) {
      rethrow;
    }
  }
}

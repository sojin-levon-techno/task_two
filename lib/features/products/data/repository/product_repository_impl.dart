import 'package:fpdart/fpdart.dart';
import 'package:task_two/core/error/app_error.dart';
import 'package:task_two/features/products/data/datasource/product_remote_ds.dart';
import 'package:task_two/features/products/data/models/product_model.dart';
import 'package:task_two/features/products/domain/entity/products.dart';
import 'package:task_two/features/products/domain/repository/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDs remoteDs;

  ProductRepositoryImpl({required this.remoteDs});
  @override
  Future<Either<AppError, List<Products>>> getProducts() async {
    try {
      final model = await remoteDs.getProducts();
      final entities = model.map((x) => x.toEntity()).toList();
      return right(entities);
    } catch (e) {
      return left(AppError(e.toString()));
    }
  }
}

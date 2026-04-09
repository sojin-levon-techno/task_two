import 'package:fpdart/fpdart.dart';
import 'package:task_two/core/error/app_error.dart';
import 'package:task_two/features/products/domain/entity/products.dart';

abstract interface class ProductRepository {
  Future<Either<AppError, List<Products>>> getProducts();
}

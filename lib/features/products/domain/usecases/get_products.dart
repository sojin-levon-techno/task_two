import 'package:fpdart/fpdart.dart';
import 'package:task_two/core/error/app_error.dart';
import 'package:task_two/features/products/domain/entity/products.dart';
import 'package:task_two/features/products/domain/repository/product_repository.dart';

class GetProducts {
  final ProductRepository repository;
  GetProducts({required this.repository});

  Future<Either<AppError, List<Products>>> call() => repository.getProducts();
}

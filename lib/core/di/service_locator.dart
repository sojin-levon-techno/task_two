import 'package:get_it/get_it.dart';
import 'package:task_two/core/network/dio_client.dart';
import 'package:task_two/features/products/data/datasource/product_remote_ds.dart';
import 'package:task_two/features/products/data/repository/product_repository_impl.dart';
import 'package:task_two/features/products/domain/repository/product_repository.dart';
import 'package:task_two/features/products/domain/usecases/get_products.dart';
import 'package:task_two/features/products/presentation/bloc/product_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(() => DioClient().dio);

  sl.registerLazySingleton<ProductRemoteDs>(() => ProductRemoteDsImpl(dio: sl()));

  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(remoteDs: sl()),
  );

  sl.registerLazySingleton(() => GetProducts(repository: sl()));

  sl.registerFactory(() => ProductBloc(sl()));
}

import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_two/features/products/domain/entity/products.dart';
import 'package:task_two/features/products/domain/usecases/get_products.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProducts getProducts;
  ProductBloc(this.getProducts) : super(ProductInitial()) {
    on<FetchProductsEvent>(_fetchProductsEvent);
  }

  FutureOr<void> _fetchProductsEvent(
    FetchProductsEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(ProductLoading());
    final result = await getProducts();
    result.fold(
      (l) => ProductFailure(error: l.message),
      (r) => ProductSuccess(products: r),
    );
  }
}

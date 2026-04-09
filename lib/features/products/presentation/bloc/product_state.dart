part of 'product_bloc.dart';

sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

final class ProductInitial extends ProductState {}

final class ProductLoading extends ProductState {}

final class ProductSuccess extends ProductState {
  final List<Products> products;

  const ProductSuccess({required this.products});

  @override
  List<Object> get props => [];
}

final class ProductFailure extends ProductState {
  final String error;

  const ProductFailure({required this.error});

  @override
  List<Object> get props => [];
}

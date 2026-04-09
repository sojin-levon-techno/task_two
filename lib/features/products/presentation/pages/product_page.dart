import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/product_bloc.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  void initState() {
    super.initState();
    _fetch();
  }

  void _fetch() {
    context.read<ProductBloc>().add(FetchProductsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product page")),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is ProductSuccess) {
            final result = state.products;
            return ListView.builder(
              itemCount: result.length,
              itemBuilder: (context, index) {
                final prods = result[index];
                return ListTile(title: Text(prods.title));
              },
            );
          }
          if (state is ProductFailure) {
            return Center(child: Text(state.error));
          }
          return Text("Nothing");
        },
      ),
    );
  }
}

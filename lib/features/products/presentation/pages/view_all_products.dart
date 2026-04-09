import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:task_two/features/products/presentation/widgets/product_cards.dart';

import '../../domain/entity/products.dart';

class ViewAllProducts extends StatelessWidget {
  final List<Products> product;
  const ViewAllProducts({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GridView.builder(
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.65,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: product.length,
        itemBuilder: (context, index) {
          return ProductCard(product: product[index], onTap: () {})
              .animate()
              .fade(duration: 500.ms, delay: (index * 100).ms)
              .slideY(
                begin: 1,
                end: 0,
                duration: 600.ms,
                curve: Curves.easeOut,
              );
        },
      ),
    );
  }
}

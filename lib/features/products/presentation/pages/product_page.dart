// presentation/pages/product_page.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_two/core/extensions/text_style.dart';
import 'package:task_two/core/pallete/colors.dart';
import 'package:task_two/features/products/presentation/pages/view_all_products.dart';
import 'package:task_two/features/products/presentation/widgets/carousel_widget.dart';
import 'package:task_two/features/products/presentation/widgets/scaffold_widget.dart';
import 'package:task_two/features/products/presentation/widgets/search_bar_widget.dart';

import '../bloc/product_bloc.dart';
import '../widgets/product_cards.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(FetchProductsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      appBar: AppBar(
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_bag_outlined, size: 30),
                onPressed: () {},
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: const Text(
                    '3',
                    style: TextStyle(color: Colors.white, fontSize: 8),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
        title: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            backgroundColor: AppColors.kWhite,
            backgroundImage: NetworkImage("https://i.pravatar.cc/1080?img=12"),
          ),
          title: Text(
            "Hey Sojin!",
            style: context.bodyLarge.copyWith(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            "How's it going",
            style: context.labelMedium.copyWith(),
          ),
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  backgroundColor: AppColors.kBlue,
                  color: AppColors.kWhite,
                ),
              );
            }

            if (state is ProductSuccess) {
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SearchBarWithFilter(),
                    const BannerWidget(),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Discover",
                            style: context.bodyLarge.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // context.push(
                              //   page: ViewAllProducts(product: state.products),
                              // );

                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (_) =>
                                      ViewAllProducts(product: state.products),
                                ),
                              );
                            },
                            child: Text(
                              "View all",
                              style: context.bodyLarge.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.kBlue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.65,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                          ),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return ProductCard(
                              product: state.products[index],
                              // onTap: () {},
                            )
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
                  ],
                ),
              );
            }

            if (state is ProductFailure) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.error),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        context.read<ProductBloc>().add(FetchProductsEvent());
                      },
                      child: const Text("Retry"),
                    ),
                  ],
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

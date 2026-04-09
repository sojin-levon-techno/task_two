import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_two/core/di/service_locator.dart';
import 'package:task_two/features/products/presentation/bloc/product_bloc.dart';
import 'package:task_two/features/products/presentation/pages/product_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ProductPage(),
      ),
      create: (_) => sl<ProductBloc>(),
    );
  }
}

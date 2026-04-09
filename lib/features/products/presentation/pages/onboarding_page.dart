import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_two/core/extensions/text_style.dart';
import 'package:task_two/features/products/presentation/pages/product_page.dart';
import '../../../../core/pallete/colors.dart';
import '../widgets/onboarding_content.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingModel> _pages = [
    OnboardingModel(
      icon: Icons.shopping_bag_outlined,
      title: 'Shop Thousands of Products',
      description: 'Discover millions of products at best prices',
    ),
    OnboardingModel(
      icon: Icons.local_shipping_outlined,
      title: 'Fast Delivery',
      description: 'Get your products delivered within 24 hours',
    ),
    OnboardingModel(
      icon: Icons.security_outlined,
      title: 'Secure Payments',
      description: '100% secure payment methods',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackground,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) => setState(() => _currentPage = index),
                itemCount: _pages.length,
                itemBuilder: (context, index) =>
                    OnboardingContent(model: _pages[index]),
              ),
            ),
            _buildBottomSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomSection() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(_pages.length, (index) => _buildDot(index)),
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: _handleNext,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.kBlue,
                foregroundColor: AppColors.kWhite,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                _currentPage == _pages.length - 1 ? 'Get Started' : 'Next',
                style: context.bodyLarge.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.kWhite,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: _currentPage == index ? 24 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: _currentPage == index ? AppColors.kBlue : Colors.grey,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  void _handleNext() {
    if (_currentPage == _pages.length - 1) {
      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(builder: (_) => ProductPage()),
      );
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
}

class OnboardingModel {
  final IconData icon;
  final String title;
  final String description;

  OnboardingModel({
    required this.icon,
    required this.title,
    required this.description,
  });
}

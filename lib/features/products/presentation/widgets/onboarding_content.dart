import 'package:flutter/material.dart';
import 'package:task_two/core/extensions/text_style.dart';

import '../../../../core/pallete/colors.dart';
import '../pages/onboarding_page.dart';

class OnboardingContent extends StatelessWidget {
  final OnboardingModel model;

  const OnboardingContent({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(model.icon, size: 120, color: AppColors.kBlue),
          const SizedBox(height: 32),
          Text(
            model.title,
            style: context.titleLarge.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            model.description,
            style: context.bodySmall.copyWith(),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

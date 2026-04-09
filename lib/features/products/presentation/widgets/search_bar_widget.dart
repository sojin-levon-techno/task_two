import 'package:flutter/material.dart';
import '../../../../core/pallete/colors.dart';

class SearchBarWithFilter extends StatelessWidget {
  const SearchBarWithFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.grey.withOpacity(0.1),
                //     blurRadius: 4,
                //     offset: const Offset(0, 2),
                //   ),
                // ],
              ),
              child: TextField(
                readOnly: true,
                decoration: InputDecoration(
                  hintText: 'Search products...',
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                    size: 20,
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              color: AppColors.kBlue,
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.filter_list,
                color: Colors.white,
                size: 20,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // حساب عدد placeholders بحيث يملأ العرض بشكل جيد
    final itemWidth = 80.0 + 10.0; // عرض كل عنصر + margin
    final itemCount =
        (screenWidth / itemWidth).ceil() + 1; // +1 عشان يكون فيه scroll

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(itemCount, (index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Colors.white,
              ),
              width: 80,
              height: 60,
            ),
          );
        }),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppShimmer extends StatelessWidget {
  const AppShimmer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: child,
    );
  }
}

/// شيمر لشكل كروت المنتجات في الهوم
class ProductGridShimmer extends StatelessWidget {
  const ProductGridShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = width >= 600 ? 3 : 2;
    final childAspectRatio = width >= 600 ? 0.9 : 0.78;
    final itemCount = crossAxisCount * 4; // صفين تقريبًا

    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 12,
        mainAxisSpacing: 10,
        childAspectRatio: childAspectRatio,
      ),
      delegate: SliverChildBuilderDelegate((context, index) {
        return const AppShimmer(
          child: Card(
            elevation: 0,
            margin: EdgeInsets.zero,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: SizedBox(height: 12),
                  ),
                  SizedBox(height: 4),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: SizedBox(height: 10),
                  ),
                ],
              ),
            ),
          ),
        );
      }, childCount: itemCount),
    );
  }
}

/// شيمر لصفحة البروفايل أثناء التحميل
class ProfileShimmer extends StatelessWidget {
  const ProfileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const AppShimmer(
              child: CircleAvatar(radius: 60, backgroundColor: Colors.white),
            ),
            const SizedBox(height: 24),
            _buildLine(),
            const SizedBox(height: 16),
            _buildLine(),
            const SizedBox(height: 16),
            _buildLine(widthFactor: 0.8),
            const SizedBox(height: 24),
            _buildButton(),
            const SizedBox(height: 16),
            _buildButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildLine({double widthFactor = 1}) {
    return FractionallySizedBox(
      widthFactor: widthFactor,
      child: const AppShimmer(
        child: SizedBox(
          height: 18,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton() {
    return const AppShimmer(
      child: SizedBox(
        height: 48,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
        ),
      ),
    );
  }
}

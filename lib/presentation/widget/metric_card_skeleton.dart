import 'package:flutter/material.dart';

class MetricCardSkeleton extends StatelessWidget {
  const MetricCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey.shade300,
                ),
                Container(
                  width: 24,
                  height: 24,
                  color: Colors.grey.shade300,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              width: 120,
              height: 16,
              color: Colors.grey.shade300,
            ),
            const SizedBox(height: 8),
            Container(
              width: 200,
              height: 24,
              color: Colors.grey.shade300,
            ),
          ],
        ),
      ),
    );
  }
}

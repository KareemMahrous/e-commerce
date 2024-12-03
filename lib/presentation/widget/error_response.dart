import 'package:flutter/material.dart';
import '../../core/core.dart';
import 'widget.dart';

class ErrorResponse extends StatelessWidget {
  const ErrorResponse({
    super.key,
    this.onTap,
  });
  final VoidCallback? onTap;
  final String message = AppStrings.errorFetchingData;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error, size: 48, color: Colors.red),
          const SizedBox(height: 12),
          const DefaultText(AppStrings.errorFetchingData),
          DefaultText(
            message,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.red),
          ),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: onTap,
            child: const DefaultText(AppStrings.retry),
          ),
        ],
      ),
    );
  }
}

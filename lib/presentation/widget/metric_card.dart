import 'package:flutter/material.dart';

import '../../core/constants/app_size.dart';
import '../../core/core.dart';
import 'widget.dart';

class MetricCard extends StatelessWidget {
  final IconData iconData;
  final String title;
  final String data;
  final String percentage;
  final String description;
  final bool isPositive;
  final Color color;
  final String? toolTipMessage;

  const MetricCard({
    super.key,
    required this.iconData,
    required this.title,
    required this.data,
    required this.percentage,
    required this.color,
    this.description = "",
    this.isPositive = true,
    this.toolTipMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: toolTipMessage ?? title,
      child: Card(
        color: color.withOpacity(0.1),
        child: Padding(
          padding: AppSize.cardPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: color,
                    child: Icon(
                      iconData,
                      color: AppColors.white,
                    ),
                  ),
                  const Tooltip(
                    message: AppStrings.moreOptions,
                    child: Icon(Icons.more_vert),
                  )
                ],
              ),
              const SizedBox(height: 12),
              // Title
              DefaultText(
                title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 4),
              // Description
              DefaultText(
                description,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.grey,
                    ),
              ),
              const SizedBox(height: 8),
              // Metrics Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DefaultText(
                    data,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Row(
                    children: [
                      Text(
                        percentage,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: isPositive
                                  ? AppColors.greenColor
                                  : AppColors.redColor,
                            ),
                      ),
                      if (percentage.isNotEmpty)
                        Icon(
                          isPositive
                              ? Icons.arrow_upward
                              : Icons.arrow_downward,
                          color: isPositive
                              ? AppColors.greenColor
                              : AppColors.redColor,
                          size: 16,
                        ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MetricWebCard extends StatelessWidget {
  final IconData iconData;
  final String title;
  final String data;
  final String percentage;
  final String description;
  final bool isPositive;
  final Color color;
  final String? toolTipMessage;

  const MetricWebCard({
    super.key,
    required this.iconData,
    required this.title,
    required this.data,
    required this.percentage,
    required this.color,
    this.description = "",
    this.isPositive = true,
    this.toolTipMessage,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 295,
      child: Card(
        margin: AppSize.webCardMargin,
        color: color.withOpacity(0.1),
        child: Padding(
          padding: AppSize.cardPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon Row with dynamic width based on parent width
              SizedBox(
                width: null, // Bounded width using parent width
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: color,
                      child: Icon(
                        iconData,
                        color: AppColors.white,
                      ),
                    ),
                    const Tooltip(
                      message: AppStrings.moreOptions,
                      child: Icon(Icons.more_vert),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              // Title
              DefaultText(
                title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 4),
              // Description
              DefaultText(
                description,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.grey,
                    ),
              ),
              const SizedBox(height: 8),
              // Metrics Row with dynamic width based on parent width
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DefaultText(
                    data,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Row(
                    children: [
                      Text(
                        percentage,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: isPositive
                                  ? AppColors.greenColor
                                  : AppColors.redColor,
                            ),
                      ),
                      if (percentage.isNotEmpty)
                        Icon(
                          isPositive
                              ? Icons.arrow_upward
                              : Icons.arrow_downward,
                          color: isPositive
                              ? AppColors.greenColor
                              : AppColors.redColor,
                          size: 16,
                        ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

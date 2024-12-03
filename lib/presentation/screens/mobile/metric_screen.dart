import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../core/core.dart';
import '../../bloc/bloc.dart';
import '../../widget/error_response.dart';
import '../../widget/metric_card.dart';
import '../../widget/metric_card_skeleton.dart';

class MetricScreen extends StatelessWidget {
  const MetricScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) {
          return switch (state) {
            OrderLoaded(
              :final totalCount,
              :final averagePrice,
              :final numberOfReturns
            ) =>
              ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  MetricCard(
                    title: AppStrings.totalCount,
                    data: '$totalCount',
                    percentage: AppStrings.hundredPercent,
                    iconData: Icons.shopping_cart,
                    color: AppColors.orangeColor,
                    description:
                        AppStrings.representsTheTotalNumberOfOrdersPlaced,
                  ),
                  MetricCard(
                    title: AppStrings.averagePrice,
                    data: "\$${NumberFormat("#,##0.00").format(averagePrice)}",
                    percentage: "",
                    iconData: Icons.attach_money_rounded,
                    color: AppColors.blue,
                    description: AppStrings.averagePriceDescription,
                  ),
                  MetricCard(
                    title: AppStrings.numberOfReturns,
                    data: '$numberOfReturns',
                    percentage: "-${numberOfReturns / totalCount * 100}%",
                    iconData: Icons.refresh,
                    color: AppColors.redColor,
                    isPositive: false,
                    description: AppStrings.orderReturnsDescription,
                  ),
                ],
              ),
            OrderError _ => ErrorResponse(
                onTap: () => context.read<OrderBloc>().add(GetOrders())),
            OrderInitial _ => const Skeletonizer(
                enabled: true,
                child: MetricCardSkeleton(),
              )
          };
        },
      ),
    );
  }
}

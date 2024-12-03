import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/core.dart';
import '../../bloc/bloc.dart';
import '../../widget/widget.dart';

class GraphScreen extends StatefulWidget {
  const GraphScreen({super.key});

  @override
  State<GraphScreen> createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
  bool isAverage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: BlocBuilder<OrderBloc, OrderState>(
          builder: (context, state) {
            return switch (state) {
              OrderLoaded(:final orders) => SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Graph Title
                      Center(
                        child: DefaultText(
                          isAverage
                              ? AppStrings.monthlyOrdersAverage
                              : AppStrings.monthlyOrders,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.lightSecondaryColor),
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Description
                      DefaultText(
                        AppStrings.monthlyOrdersDescription,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: AppColors.lightSecondaryColor
                                  .withOpacity(0.5),
                            ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),

                      // Average/Main Toggle Button
                      Center(
                        child: Tooltip(
                          message:
                              "${AppStrings.show} ${isAverage ? AppStrings.main : AppStrings.average}",
                          child: DefaultButton(
                            width: context.w * 120 / 320,
                            height: 36,
                            radius: 20,
                            text: isAverage
                                ? AppStrings.main
                                : AppStrings.average,
                            textColor: AppColors.lightPrimaryColor,
                            buttonColor: AppColors.lightSecondaryColor,
                            onPressed: () {
                              setState(() {
                                isAverage = !isAverage;
                              });
                            },
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Graph
                      AspectRatio(
                        aspectRatio: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            right: 18,
                            left: 12,
                            top: 24,
                            bottom: 12,
                          ),
                          child: LineChart(
                              isAverage ? avgData(orders) : mainData(orders)),
                        ),
                      ),
                    ],
                  ),
                ),
              OrderError _ => ErrorResponse(
                  onTap: () => context.read<OrderBloc>().add(GetOrders()),
                ),
              _ => const Center(child: CircularProgressIndicator.adaptive()),
            };
          },
        ),
      ),
    );
  }
}

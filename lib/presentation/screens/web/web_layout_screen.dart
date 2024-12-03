import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../app/app.dart';
import '../../../core/core.dart';
import '../../bloc/bloc.dart';
import '../../widget/widget.dart';

class WebLayoutScreen extends StatefulWidget {
  const WebLayoutScreen({super.key});

  @override
  State<WebLayoutScreen> createState() => _WebLayoutScreenState();
}

class _WebLayoutScreenState extends State<WebLayoutScreen> {
  bool isAverage = true;
  String selectedItem = AppStrings.dashboard;

  List<MenuItemModel> menuItems = [
    MenuItemModel(title: AppStrings.dashboard, icon: Icons.dashboard),
    MenuItemModel(title: AppStrings.settings, icon: Icons.settings),
    MenuItemModel(title: AppStrings.logout, icon: Icons.logout),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: context.w < 799
          ? Drawer(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  DrawerHeader(
                      decoration: const BoxDecoration(
                        color: AppColors.lightPrimaryColor,
                      ),
                      child: Center(
                        child: DefaultText(
                          AppConfig.appName,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      )),
                  Expanded(
                    child: ListView.builder(
                      itemCount: menuItems.length,
                      itemBuilder: (context, index) {
                        final item = menuItems[index];
                        bool isSelected = item.title == selectedItem;

                        return Tooltip(
                          message: item.title,
                          child: ListTile(
                            tileColor: isSelected
                                ? AppColors.lightSecondaryColor
                                : AppColors.lightOnSecondaryColor,
                            title: DefaultText(
                              item.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    fontWeight: isSelected
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                    color: isSelected
                                        ? AppColors.lightOnSecondaryColor
                                        : AppColors.lightSecondaryColor,
                                  ),
                            ),
                            leading: Icon(
                              item.icon,
                              color: isSelected
                                  ? AppColors.lightOnSecondaryColor
                                  : AppColors.lightSecondaryColor,
                            ),
                            onTap: () {
                              setState(() {
                                selectedItem = item.title;
                              });
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          : null,
      backgroundColor: AppColors.lightSurfaceColor,
      body: Row(
        children: [
          // Drawer as Sidebar
          if (context.w > 799)
            Container(
              width: context.w * 0.2,
              color: AppColors.lightPrimaryColor,
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  DefaultText(
                    AppConfig.appName,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  SizedBox(width: context.w * 0.1, child: const Divider()),
                  Expanded(
                    child: ListView.builder(
                      itemCount: menuItems.length,
                      itemBuilder: (context, index) {
                        final item = menuItems[index];
                        bool isSelected = item.title == selectedItem;

                        return Tooltip(
                          message: item.title,
                          child: Container(
                            color: isSelected
                                ? AppColors.lightSecondaryColor
                                : Colors.transparent,
                            child: ListTile(
                              title: DefaultText(
                                item.title,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      fontWeight: isSelected
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                      color: isSelected
                                          ? AppColors.lightOnSecondaryColor
                                          : AppColors.lightSecondaryColor,
                                    ),
                              ),
                              leading: Icon(
                                item.icon,
                                color: isSelected
                                    ? AppColors.lightOnSecondaryColor
                                    : AppColors.lightSecondaryColor,
                              ),
                              onTap: () {
                                setState(() {
                                  selectedItem = item.title;
                                });
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          if (context.w > 799) const VerticalDivider(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: BlocBuilder<OrderBloc, OrderState>(
                builder: (context, state) {
                  return ListView(
                    children: [
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (context.w < 799)
                            IconButton(
                              icon: const Icon(Icons.menu),
                              onPressed: () {
                                Scaffold.of(context).openDrawer();
                              },
                            ),
                          Flexible(
                            child: DefaultText(
                              AppStrings.dashboard,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                          const Flexible(
                            child: Tooltip(
                              message: AppStrings.profileTooltip,
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: AppColors.lightSecondaryColor,
                                child: Icon(
                                  Icons.person,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Divider(
                          color:
                              AppColors.lightSecondaryColor.withOpacity(0.1)),
                      const SizedBox(height: 32),
                      switch (state) {
                        OrderLoaded(
                          :final totalCount,
                          :final averagePrice,
                          :final numberOfReturns
                        ) =>
                          SizedBox(
                            height: 175,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                MetricWebCard(
                                  title: AppStrings.totalCount,
                                  data: '$totalCount',
                                  percentage: AppStrings.hundredPercent,
                                  iconData: Icons.shopping_cart,
                                  color: AppColors.orangeColor,
                                  description: AppStrings
                                      .representsTheTotalNumberOfOrdersPlaced,
                                ),
                                MetricWebCard(
                                  title: AppStrings.averagePrice,
                                  data:
                                      "\$${NumberFormat("#,##0.00").format(averagePrice)}",
                                  percentage: "",
                                  iconData: Icons.attach_money_rounded,
                                  color: AppColors.blue,
                                  description:
                                      AppStrings.averagePriceDescription,
                                ),
                                MetricWebCard(
                                  title: AppStrings.numberOfReturns,
                                  data: '$numberOfReturns',
                                  percentage:
                                      "-${numberOfReturns / totalCount * 100}%",
                                  iconData: Icons.refresh,
                                  color: AppColors.redColor,
                                  isPositive: false,
                                  description:
                                      AppStrings.orderReturnsDescription,
                                ),
                              ],
                            ),
                          ),
                        OrderError _ => ErrorResponse(
                            onTap: () =>
                                context.read<OrderBloc>().add(GetOrders())),
                        OrderInitial _ => Skeletonizer(
                            enabled: true,
                            child: SizedBox(
                              height: 175,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: const [
                                  MetricCardSkeleton(),
                                ],
                              ),
                            ))
                      },
                      const SizedBox(height: 20),
                      switch (state) {
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
                                            color:
                                                AppColors.lightSecondaryColor),
                                  ),
                                ),
                                const SizedBox(height: 8),

                                // Description
                                DefaultText(
                                  AppStrings.monthlyOrdersDescription,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
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
                                      buttonColor:
                                          AppColors.lightSecondaryColor,
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
                                    child: LineChart(isAverage
                                        ? avgData(orders)
                                        : mainData(orders)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        OrderError _ => ErrorResponse(
                            onTap: () =>
                                context.read<OrderBloc>().add(GetOrders()),
                          ),
                        _ => const Center(
                            child: CircularProgressIndicator.adaptive()),
                      }
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

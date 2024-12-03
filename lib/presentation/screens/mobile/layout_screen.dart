import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/app.dart';
import '../../../core/core.dart';
import '../../widget/widget.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key, required this.child});
  final Widget child;

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int currentIndex = 0;

  List<MenuItemModel> menuItems = [
    MenuItemModel(title: AppStrings.settings, icon: Icons.settings),
    MenuItemModel(title: AppStrings.logout, icon: Icons.logout),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: const DefaultText(AppStrings.dashboard),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => scaffoldKey.currentState!.openDrawer(),
        ),
      ),
      drawer: Drawer(
          child: Column(
        children: [
          DrawerHeader(
            child: Column(
              children: [
                Tooltip(
                  message: AppStrings.profileTooltip,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.lightSecondaryColor,
                    ),
                    child: const Icon(
                      Icons.person,
                      color: AppColors.white,
                      size: 80,
                    ),
                  ),
                ),
                const Spacer(),
                DefaultText(
                  AppStrings.name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                DefaultText(
                  AppStrings.email,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          Container(color: AppColors.lightSecondaryColor, height: 20),
          Tooltip(
            message: AppStrings.metricTooltip,
            child: ListTile(
              tileColor: AppColors.lightSecondaryColor,
              leading: const Icon(Icons.add_chart_outlined,
                  color: AppColors.lightOnSecondaryColor),
              title: DefaultText(AppStrings.metrics,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: AppColors.lightOnSecondaryColor)),
              onTap: () => {
                context.pop(),
                context.goNamed(Routes.orders),
                setState(() => currentIndex = 0)
              },
            ),
          ),
          Tooltip(
            message: AppStrings.statisicsTooltip,
            child: ListTile(
              tileColor: AppColors.lightSecondaryColor,
              leading: const Icon(Icons.pie_chart,
                  color: AppColors.lightOnSecondaryColor),
              title: DefaultText(AppStrings.statisics,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: AppColors.lightOnSecondaryColor)),
              onTap: () => {
                context.pop(),
                context.goNamed(Routes.graph),
                setState(() => currentIndex = 1)
              },
            ),
          ),
          Container(
              color: AppColors.lightSecondaryColor,
              child: const Divider(
                color: AppColors.lightOnSecondaryColor,
              )),
          Expanded(
            child: Container(
              color: AppColors.lightSecondaryColor,
              child: ListView.builder(
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  final item = menuItems[index];
                  return Tooltip(
                    message: item.title,
                    child: ListTile(
                      title: DefaultText(
                        item.title,
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: AppColors.lightOnSecondaryColor,
                                ),
                      ),
                      leading: Icon(
                        item.icon,
                        color: AppColors.lightOnSecondaryColor,
                      ),
                      onTap: () {},
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: AppColors.lightSecondaryColor,
            ),
          ),
        ],
      )),
      backgroundColor: AppColors.lightSurfaceColor,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => index == currentIndex
            ? null
            : index == 0
                ? {
                    context.goNamed(Routes.orders),
                    setState(() => currentIndex = 0)
                  }
                : {
                    context.goNamed(Routes.graph),
                    setState(() => currentIndex = 1)
                  },
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.add_chart),
            label: AppStrings.metrics,
            tooltip: AppStrings.metricTooltip,
            icon: Icon(Icons.add_chart_outlined),
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.pie_chart),
            label: AppStrings.statisics,
            tooltip: AppStrings.statisicsTooltip,
            icon: Icon(Icons.pie_chart_outline_rounded),
          ),
        ],
      ),
      body: widget.child,
    );
  }
}

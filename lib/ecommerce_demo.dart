import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/routing/routing.dart';
import 'core/core.dart';
import 'core/theme/app_theme.dart';
import 'di_container.dart';
import 'presentation/bloc/bloc.dart';

class EcommerceDemo extends StatelessWidget {
  const EcommerceDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeBloc(),
        ),
        BlocProvider(
          create: (context) => OrderBloc(repo: getIt())..add(GetOrders()),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            routerConfig: kIsWeb ? webRoutes : appRoutes,
            theme: AppTheme.lightTheme.copyWith(
                textTheme: Theme.of(context)
                    .textTheme
                    .apply(bodyColor: AppColors.lightOnBackgroundColor)),
            // darkTheme: AppTheme.darkTheme.copyWith(
            //     textTheme: Theme.of(context)
            //         .textTheme
            //         .apply(bodyColor: AppColors.darkOnBackgroundColor)),
            themeMode: (state as ThemeChanged).themeMode,
            debugShowCheckedModeBanner: false,
            title: AppConfig.appName,

            /// Sets the default locale for the application.
            locale: const Locale('en', 'US'),
            localizationsDelegates: AppLang.localizationsDelegates,
            supportedLocales: AppLang.supportedLocales,
          );
        },
      ),
    );
  }
}

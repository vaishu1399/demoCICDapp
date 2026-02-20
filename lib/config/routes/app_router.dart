import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:democicdapp/features/home/presentation/pages/home_page.dart';
import 'package:democicdapp/features/home/presentation/pages/feature_detail_page.dart';
import 'package:democicdapp/features/settings/presentation/pages/settings_page.dart';
import 'package:democicdapp/features/settings/presentation/pages/setting_detail_page.dart';

part 'app_router.gr.dart';

/// Main application router using AutoRoute for type-safe navigation.
@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    /// Home tab - main entry point
    AutoRoute(page: HomeRoute.page, path: '/home', initial: true),

    /// Feature detail page
    AutoRoute(page: FeatureDetailRoute.page, path: '/feature/:id'),

    /// Settings page
    AutoRoute(page: SettingsRoute.page, path: '/settings'),

    /// Setting detail page
    AutoRoute(page: SettingDetailRoute.page, path: '/setting/:id'),
  ];

  @override
  RouteType get defaultRouteType => const RouteType.material();
}

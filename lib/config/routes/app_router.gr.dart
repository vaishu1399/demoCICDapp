// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [FeatureDetailPage]
class FeatureDetailRoute extends PageRouteInfo<FeatureDetailRouteArgs> {
  FeatureDetailRoute({
    Key? key,
    required String id,
    required String title,
    required String description,
    List<PageRouteInfo>? children,
  }) : super(
         FeatureDetailRoute.name,
         args: FeatureDetailRouteArgs(
           key: key,
           id: id,
           title: title,
           description: description,
         ),
         rawPathParams: {'id': id},
         initialChildren: children,
       );

  static const String name = 'FeatureDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<FeatureDetailRouteArgs>(
        orElse: () => FeatureDetailRouteArgs(
          id: pathParams.getString('id'),
          title: '',
          description: '',
        ),
      );
      return FeatureDetailPage(
        key: args.key,
        id: args.id,
        title: args.title,
        description: args.description,
      );
    },
  );
}

class FeatureDetailRouteArgs {
  const FeatureDetailRouteArgs({
    this.key,
    required this.id,
    required this.title,
    required this.description,
  });

  final Key? key;

  final String id;

  final String title;

  final String description;

  @override
  String toString() {
    return 'FeatureDetailRouteArgs{key: $key, id: $id, title: $title, description: $description}';
  }
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomePage();
    },
  );
}

/// generated route for
/// [SettingDetailPage]
class SettingDetailRoute extends PageRouteInfo<SettingDetailRouteArgs> {
  SettingDetailRoute({
    Key? key,
    required String id,
    required String title,
    required String description,
    List<PageRouteInfo>? children,
  }) : super(
         SettingDetailRoute.name,
         args: SettingDetailRouteArgs(
           key: key,
           id: id,
           title: title,
           description: description,
         ),
         rawPathParams: {'id': id},
         initialChildren: children,
       );

  static const String name = 'SettingDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<SettingDetailRouteArgs>(
        orElse: () => SettingDetailRouteArgs(
          id: pathParams.getString('id'),
          title: '',
          description: '',
        ),
      );
      return SettingDetailPage(
        key: args.key,
        id: args.id,
        title: args.title,
        description: args.description,
      );
    },
  );
}

class SettingDetailRouteArgs {
  const SettingDetailRouteArgs({
    this.key,
    required this.id,
    required this.title,
    required this.description,
  });

  final Key? key;

  final String id;

  final String title;

  final String description;

  @override
  String toString() {
    return 'SettingDetailRouteArgs{key: $key, id: $id, title: $title, description: $description}';
  }
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SettingsPage();
    },
  );
}

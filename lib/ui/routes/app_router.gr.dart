// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../screens/archive.dart' as _i6;
import '../screens/bloggers.dart' as _i5;
import '../screens/press_tour.dart' as _i4;
import '../screens/press_tours.dart' as _i3;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args =
              data.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
          return _i3.Home(key: args.key);
        }),
    PressToursScreenRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.PressToursScreen();
        }),
    PressTourScreenRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i4.PressTourScreen();
        }),
    BloggersScreenRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i5.BloggersScreen();
        }),
    ArchiveScreenRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i6.ArchiveScreen();
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(HomeRoute.name, path: '/'),
        _i1.RouteConfig(PressToursScreenRoute.name,
            path: '/press-tours-screen'),
        _i1.RouteConfig(PressTourScreenRoute.name, path: '/press-tour-screen'),
        _i1.RouteConfig(BloggersScreenRoute.name, path: '/bloggers-screen'),
        _i1.RouteConfig(ArchiveScreenRoute.name, path: '/archive-screen')
      ];
}

class HomeRoute extends _i1.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({_i2.Key? key})
      : super(name, path: '/', args: HomeRouteArgs(key: key));

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final _i2.Key? key;
}

class PressToursScreenRoute extends _i1.PageRouteInfo {
  const PressToursScreenRoute() : super(name, path: '/press-tours-screen');

  static const String name = 'PressToursScreenRoute';
}

class PressTourScreenRoute extends _i1.PageRouteInfo {
  const PressTourScreenRoute() : super(name, path: '/press-tour-screen');

  static const String name = 'PressTourScreenRoute';
}

class BloggersScreenRoute extends _i1.PageRouteInfo {
  const BloggersScreenRoute() : super(name, path: '/bloggers-screen');

  static const String name = 'BloggersScreenRoute';
}

class ArchiveScreenRoute extends _i1.PageRouteInfo {
  const ArchiveScreenRoute() : super(name, path: '/archive-screen');

  static const String name = 'ArchiveScreenRoute';
}

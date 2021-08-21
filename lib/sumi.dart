import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sumi/ui/routes/app_router.gr.dart';
import 'package:sumi/ui/theme/theme.dart';

class Sumi extends StatelessWidget {
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'SUMI',
      routerDelegate: AutoRouterDelegate(
        _appRouter,
        navigatorObservers: () => [
          AutoRouteObserver(),
        ],
      ),
      theme: ligthTheme,
      routeInformationParser: _appRouter.defaultRouteParser(),
      builder: (_, router) {
        return router!;
      },
    );
  }
}

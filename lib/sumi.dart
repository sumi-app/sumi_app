import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sumi/ui/routes/app_router.gr.dart';

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
      routeInformationParser: _appRouter.defaultRouteParser(),
      builder: (_, router) {
        return router!;
      },
    );

    // MaterialApp(
    //   title: 'Sumi',
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    //   home: HomeNavigator(),
    // );
  }
}

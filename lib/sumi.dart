import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumi/bloc/bloggers/bloc.dart';
import 'package:sumi/bloc/bloggers/bloggers_bloc.dart';
import 'package:sumi/bloc/review/bloc.dart';
import 'package:sumi/ui/routes/app_router.gr.dart';
import 'package:sumi/ui/theme/theme.dart';

class Sumi extends StatelessWidget {
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BloggersBloc>(
          create: (_) {
            return BloggersBloc()..add(LoadBlogegrs());
          },
        ),
        BlocProvider<ReviewBloc>(create: (_) {
          return ReviewBloc()..add(LoadReviews());
        }),
      ],
      child: MaterialApp.router(
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
      ),
    );
  }
}

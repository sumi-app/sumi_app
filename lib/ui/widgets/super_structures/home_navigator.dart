import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sumi/ui/routes/app_router.gr.dart';

class HomeNavigator extends StatelessWidget {
  const HomeNavigator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            onPressed: () {
              AutoRouter.of(context).push(PressToursScreenRoute());
            },
            child: Text('Прес туры'),
          ),
          TextButton(
            onPressed: () {
              AutoRouter.of(context).push(PressTourScreenRoute());
            },
            child: Text('Прес тур (1)'),
          ),
          TextButton(
            onPressed: () {
              AutoRouter.of(context).push(BloggersScreenRoute());
            },
            child: Text('Блогеры'),
          ),
        ],
      ),
    );
  }
}

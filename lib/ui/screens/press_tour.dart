import 'package:flutter/material.dart';

class PressTourScreen extends StatelessWidget {
  const PressTourScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("https://a.d-cd.net/4aAAAgDCG-A-960.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        )
      ],
    ));
  }
}

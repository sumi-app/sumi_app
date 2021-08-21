import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:sumi/ui/screens/archive.dart';
import 'package:sumi/ui/routes/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _controller = PageController();
  var _slectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: [
          PressToursScreen(),
          ArchiveScreen(),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(
        iconSize: 30.0,
        scaleFactor: 0.1,
        selectedColor: theme.primaryColor,
        strokeColor: theme.primaryColor,
        unSelectedColor: Colors.grey,
        backgroundColor: Colors.white,
        items: [
          CustomNavigationBarItem(
            icon: Icon(Icons.alt_route_sharp),
            title: Text(
              'Маршруты',
              style: _style(0, theme),
            ),
          ),
          CustomNavigationBarItem(
            icon: Icon(Icons.people),
            title: Text(
              'Блогеры',
              style: _style(1, theme),
            ),
          ),
        ],
        currentIndex: _slectedIndex,
        onTap: (i) {
          setState(() => _slectedIndex = i);
          _controller.jumpToPage(i);
        },
      ),
    );
  }

  TextStyle _style(int index, ThemeData theme) {
    return TextStyle(
      color: index == _slectedIndex ? theme.primaryColor : theme.hintColor,
      fontSize: 12,
    );
  }
}

class PressToursScreen extends StatelessWidget {
  const PressToursScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        centerTitle: true,
        title: Text(
          'Маршруты',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w200,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        color: Colors.grey[100],
        child: ListView(
          padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
          children: [PlaceCard(), PlaceCard()],
        ),
      ),
    );
  }
}

class PlaceCard extends StatelessWidget {
  const PlaceCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 30.0,
              offset: Offset(0.0, 4))
        ],
      ),
      child: Material(
        child: InkWell(
          onTap: () {
            AutoRouter.of(context).push(PressTourScreenRoute());
          },
          child: Container(
            child: Column(
              children: [
                Image.network(
                  "https://a.d-cd.net/4aAAAgDCG-A-960.jpg",
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: Text(
                            'Самара',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          child: SizedBox(
                            width: 310,
                            child: Text(
                              'Сама́ра — город в Среднем Поволжье России, центр Поволжского экономического района и Самарской области',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Оценка 4/5',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.lightBlueAccent,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Icon(Icons.star_border_outlined,
                              color: Colors.lightBlueAccent),
                          Icon(Icons.star_border_outlined,
                              color: Colors.lightBlueAccent),
                          Icon(Icons.star_border_outlined,
                              color: Colors.lightBlueAccent),
                          Icon(Icons.star_border_outlined,
                              color: Colors.lightBlueAccent),
                          Icon(Icons.star_border_outlined,
                              color: Colors.lightBlueAccent)
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

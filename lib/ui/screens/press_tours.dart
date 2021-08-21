import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:sumi/ui/screens/archive.dart';

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
          children: [PlaceCard(), PlaceCard(), PlaceCard(), PlaceCard()],
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
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.grey, blurRadius: 30.0, offset: Offset(0.0, 4))
        ],
      ),
      child: Material(
        child: InkWell(
          onTap: () {},
          child: Container(
            child: Column(
              children: [
                Image.network(
                  "https://a.d-cd.net/4aAAAgDCG-A-960.jpg",
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        'Самара',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
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
                      padding: EdgeInsets.all(5),
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

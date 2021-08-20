import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BloggersScreen extends StatelessWidget {
  const BloggersScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                leading: IconButton(
                    icon: Icon(Icons.arrow_back_ios), onPressed: () {}),
                centerTitle: true,
                title: Text(
                  'Блогеры',
                  style: TextStyle(
                    fontFamily: 'Bitter',
                    fontSize: 24,
                    fontWeight: FontWeight.w200,
                    color: Colors.black,
                  ),
                ),
                bottom: TabBar(
                  tabs: [
                    Tab(text: 'Блогеры'),
                    Tab(text: 'Приглашены'),
                  ],
                ),
              ),
              body: TabBarView(
                children: [FirstScreen(), SecondScreen()],
              ),
            )));
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: [BlogCard(),BlogCard(),BlogCard(),BlogCard(),],
        )));
  }
}



class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: [BlogCard()],
        )));
  }
}

class BlogCard extends StatelessWidget {
  const BlogCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top:20),
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  "https://picsum.photos/250?image=9",
                  width: 62,
                  height: 62,
                )),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Text(
                        'Птушкин',
                        style: TextStyle(
                          fontFamily: "Rubik",
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Text(
                      '4.900к Подписчиков',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      'Путешествия',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: Colors.lightBlue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.only(right: 10),
                child: SvgPicture.asset('assets/icons/letter.svg'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

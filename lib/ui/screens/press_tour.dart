import 'package:flutter/material.dart';

class PressTourScreen extends StatelessWidget {
  const PressTourScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopPressTourBar(),
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.all(20),
                      child: Text(
                        'Описание',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Сама́ра — город в Среднем Поволжье России, центр Поволжского экономического района и Самарской области, образует городской округ Самара. Город трудовой и боевой славы. Город трудовой доблести. Население — 1 144 759 чел., восьмой по численности населения город России.',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey,
                          ),
                        )),
                    Padding(padding: EdgeInsets.only(bottom: 10)),
                    Divider(),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                      child: Text(
                        'Посты:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    PostCard(),
                    PostCard(),
                    PostCard(),
                    PostCard(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class PostCard extends StatelessWidget {
  const PostCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 10),
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: InkWell(
            onTap: () {},
            child: Row(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        "https://picsum.photos/250?image=9",
                        width: 62,
                        height: 62,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
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
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Divider()
      ],
    );
  }
}

class TopPressTourBar extends StatelessWidget {
  const TopPressTourBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      //alignment: Alignment.topCenter,
      children: [
        Container(
          height: 240,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage("https://a.d-cd.net/4aAAAgDCG-A-960.jpg"),
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            )),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 30, 10, 0),
                  child: Text(
                    'Самара'.toUpperCase(),
                    style: TextStyle(
                      fontSize: 64,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 10, 3),
                  child: Text(
                    'Участвуют 28',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 65, 10, 3),
                  child: Text(
                    'Оценка',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 3, 3),
                  child: Text(
                    '4/5',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 5),
                  child: Row(
                    children: [
                      Icon(Icons.star_border_outlined,
                          size: 15, color: Colors.white),
                      Icon(Icons.star_border_outlined,
                          size: 15, color: Colors.white),
                      Icon(Icons.star_border_outlined,
                          size: 15, color: Colors.white),
                      Icon(Icons.star_border_outlined,
                          size: 15, color: Colors.white),
                      Icon(Icons.star_border_outlined,
                          size: 15, color: Colors.white)
                    ],
                  ),
                )
              ],
            ),
          ],
        )
      ],
    );
  }
}

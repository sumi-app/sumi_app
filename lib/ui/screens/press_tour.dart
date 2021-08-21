import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumi/bloc/review/bloc.dart';
import 'package:sumi/ui/routes/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:sumi/ui/widgets/post_crad.dart';

class PressTourScreen extends StatelessWidget {
  const PressTourScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                  BlocBuilder<ReviewBloc, ReviewsState>(
                    builder: (context, state) {
                      if (state is ReviewsLoaded) {
                        return Column(
                          children: state.reviews
                              .map((e) => PostCard(
                                    review: e,
                                  ))
                              .toList(),
                        );
                      }
                      return LinearProgressIndicator();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TopPressTourBar extends StatelessWidget {
  const TopPressTourBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.bottomRight,
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
        Container(
          color: Colors.black.withOpacity(0.3),
          width: size.width,
          height: 240,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                    Container(
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
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 65, 10, 3),
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
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: EdgeInsets.all(6.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
              child: Text(
                "Пригласить",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                    color: Theme.of(context).primaryColor),
              ),
              onPressed: () {
                AutoRouter.of(context).push(BloggersScreenRoute());
              },
            ),
          ),
        ),
      ],
    );
  }
}

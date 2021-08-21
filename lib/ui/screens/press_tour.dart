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
          children: [
            Stack(
              //alignment: Alignment.topCenter,
              children: [
                Container(
                  height: 240,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://a.d-cd.net/4aAAAgDCG-A-960.jpg"),
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
            ),
            Container(
              child: Text(
                '4/5',
                style: TextStyle(
                  fontSize: 44,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}

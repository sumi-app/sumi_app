import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sumi/bloc/bloggers/bloc.dart';
import 'package:sumi_api/sumi_api.dart';

class BloggersScreen extends StatefulWidget {
  const BloggersScreen({
    Key? key,
  }) : super(key: key);

  @override
  _BloggersScreenState createState() => _BloggersScreenState();
}

class _BloggersScreenState extends State<BloggersScreen> {
  var _selectionMode = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButton: _selectionMode
            ? FloatingActionButton(
                elevation: 0,
                onPressed: () {},
                child: SvgPicture.asset(
                  'assets/icons/letter.svg',
                  height: 60,
                  width: 60,
                ),
              )
            : null,
        appBar: AppBar(
          leading:
              IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () {}),
          centerTitle: true,
          title: Text(
            'Блогеры',
            style: TextStyle(
              fontSize: 20,
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
          children: [
            FirstScreen(
              onSelected: (bool selected) {
                setState(() {
                  _selectionMode = selected;
                });
              },
            ),
            SecondScreen(),
          ],
        ),
      ),
    );
  }
}

class FirstScreen extends StatefulWidget {
  final Function(bool selected) onSelected;

  const FirstScreen({Key? key, required this.onSelected}) : super(key: key);
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  bool isSelected = false;
  List choseall = [
    GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(right: 10),
        child: SvgPicture.asset(
          'assets/icons/letter.svg',
          height: 40,
          width: 40,
        ),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Фильтр',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    child: Text(
                      'Выбрать всех',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  Checkbox(
                    checkColor: Theme.of(context).primaryColor,
                    activeColor: Colors.white,
                    value: isSelected,
                    onChanged: (value) {
                      widget.onSelected(value ?? false);
                      setState(() {
                        isSelected = value ?? false;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          BlocBuilder<BloggersBloc, BloggersState>(
            builder: (context, state) {
              if (state is BloggersLoaded) {
                return Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    itemCount: state.bloggers.length,
                    itemBuilder: (ctx, i) {
                      final blogger = state.bloggers[i];
                      return BlogCard(
                        isSelectingMode: isSelected,
                        blogger: blogger,
                      );
                    },
                  ),
                );
              }
              return CircularProgressIndicator();
            },
          ),
        ],
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        children: [],
      ),
    );
  }
}

class BlogCard extends StatefulWidget {
  const BlogCard({
    Key? key,
    this.isSelectingMode = false,
    this.onChanged,
    required this.blogger,
  }) : super(key: key);

  final ApiBlogger blogger;
  final bool isSelectingMode;
  final Function(bool)? onChanged;

  @override
  _BlogCardState createState() => _BlogCardState();
}

bool cardSelector = true;

class _BlogCardState extends State<BlogCard> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.only(bottom: 10),
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
                Transform(
                  transform: Matrix4.translationValues(10, 10, 0),
                  child: ClipOval(
                    child: Image.network(
                      "https://cdn.pixabay.com/photo/2021/06/15/12/17/instagram-6338401_960_720.png",
                      height: 25,
                      width: 25,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Text(
                        widget.blogger.name,
                        style: TextStyle(
                          fontFamily: "Rubik",
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Text(
                      '${widget.blogger.count} Подписчиков',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      '@${widget.blogger.login}',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: theme.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (!widget.isSelectingMode)
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.only(right: 10),
                  child: SvgPicture.asset(
                    'assets/icons/letter.svg',
                    height: 40,
                    width: 40,
                  ),
                ),
              ),
            if (widget.isSelectingMode)
              Checkbox(
                  checkColor: Theme.of(context).primaryColor,
                  activeColor: Colors.white,
                  value: cardSelector,
                  onChanged: (v) {
                    if (widget.onChanged != null) {
                      widget.onChanged!(v ?? false);
                    }
                    ;
                    setState(() {
                      cardSelector = v ?? false;
                    });
                  })
          ],
        ),
      ),
    );
  }
}

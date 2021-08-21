import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumi/bloc/blogger/bloc.dart';
import 'package:sumi/services/url_launcer/service.dart';
import 'package:sumi_api/sumi_api.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    Key? key,
    required this.review,
  }) : super(key: key);

  final ApiReview review;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BloggerBloc>(
          create: (_) {
            return BloggerBloc()..add(LoadBlogger(review.bloggerId));
          },
        ),
      ],
      child: _Loader(review: review),
    );
  }
}

class _Loader extends StatelessWidget {
  const _Loader({
    Key? key,
    required this.review,
  }) : super(key: key);

  final ApiReview review;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 10),
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: InkWell(
            onTap: () {
              U.open(review.postLink);
            },
            child: Row(
              children: [
                BlocBuilder<BloggerBloc, BloggerState>(
                    builder: (context, state) {
                  if (state is BloggerLoaded) {
                    final b = state.blogger;
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        b.avatar,
                        width: 62,
                        height: 62,
                      ),
                    );
                  }
                  return SizedBox(
                    height: 62,
                    width: 62,
                  );
                }),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 5),
                          child: BlocBuilder<BloggerBloc, BloggerState>(
                              builder: (context, state) {
                            if (state is BloggerLoaded) {
                              final b = state.blogger;
                              return Text(
                                b.login,
                                style: TextStyle(
                                  fontFamily: "Rubik",
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              );
                            }
                            return SizedBox(
                              height: 18,
                              width: 50,
                            );
                          }),
                        ),
                        BlocBuilder<BloggerBloc, BloggerState>(
                            builder: (context, state) {
                          if (state is BloggerLoaded) {
                            final b = state.blogger;
                            return Text(
                              '${b.count} Подписчиков',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                color: Colors.grey,
                              ),
                            );
                          }
                          return SizedBox(
                            height: 14,
                            width: 50,
                          );
                        }),
                        GestureDetector(
                          onTap: () {
                            U.open(review.postLink);
                          },
                          child: Text(
                            'Открыть',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
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

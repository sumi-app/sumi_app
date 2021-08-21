import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumi/bloc/blogger/bloc.dart';

class BloggerBloc extends Bloc<BloggerEvent, BloggerState> {
  BloggerBloc() : super(BloggerLoading());

  @override
  Stream<BloggerState> mapEventToState(BloggerEvent event) async* {
    if (event is LoadBlogger) {
      yield* _mapLoadBloggerToState(event);
    }
  }

  Stream<BloggerState> _mapLoadBloggerToState(LoadBlogger event) async* {
    if (event.withLoading) {
      yield BloggerLoading();
    }
    try {} catch (e) {}
  }
}

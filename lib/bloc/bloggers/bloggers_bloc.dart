import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumi/bloc/bloggers/bloc.dart';
import 'package:sumi/utils/utils.dart';

class BloggersBloc extends Bloc<BloggersEvent, BloggersState> {
  BloggersBloc() : super(BloggersLoading());

  @override
  Stream<BloggersState> mapEventToState(BloggersEvent event) async* {
    if (event is LoadBlogegrs) {
      yield* _mapLoadBloggersToState(event);
    }
    if (event is SelectBloggers) {
      await _selectBloggers(event);
    }
  }

  Future<void> _selectBloggers(SelectBloggers event) async {
    await ApiProvider.sdk.blogger.select(event.ids);
  }

  Stream<BloggersState> _mapLoadBloggersToState(LoadBlogegrs event) async* {
    yield BloggersLoading();
    try {
      final bloggers = await ApiProvider.sdk.blogger.get();
      yield BloggersLoaded(bloggers);
    } catch (e) {
      yield BloggersLoadingFailure();
    }
  }
}

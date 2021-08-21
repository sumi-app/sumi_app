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
    add(LoadBlogegrs(withLoading: false));
  }

  Stream<BloggersState> _mapLoadBloggersToState(LoadBlogegrs event) async* {
    if (event.withLoading) {
      yield BloggersLoading();
    }
    try {
      final unselectedBloggers =
          await ApiProvider.sdk.blogger.get(isSelected: false);
      final selectedBloggers =
          await ApiProvider.sdk.blogger.get(isSelected: true);
      yield BloggersLoaded(
        selectedBloggers: selectedBloggers,
        unselectBloggers: unselectedBloggers,
      );
    } catch (e) {
      yield BloggersLoadingFailure();
    }
  }
}

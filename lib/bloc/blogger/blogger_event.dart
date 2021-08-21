import 'package:equatable/equatable.dart';

class BloggerEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadBlogger extends BloggerEvent {
  LoadBlogger({this.withLoading = true});
  final bool withLoading;

  @override
  List<Object?> get props => super.props..add(withLoading);
}

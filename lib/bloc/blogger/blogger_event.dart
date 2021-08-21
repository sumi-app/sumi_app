import 'package:equatable/equatable.dart';

class BloggerEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadBlogger extends BloggerEvent {
  LoadBlogger(this.id, {this.withLoading = true});
  final bool withLoading;
  final int id;

  @override
  List<Object?> get props => super.props..addAll([id, withLoading]);
}

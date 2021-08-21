import 'package:equatable/equatable.dart';

class BloggersEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadBlogegrs extends BloggersEvent {
  LoadBlogegrs({this.withLoading = true});
  final bool withLoading;

  @override
  List<Object?> get props => super.props..add(withLoading);
}

class SelectBloggers extends BloggersEvent {
  SelectBloggers(this.ids);
  final List<int> ids;

  @override
  List<Object?> get props => super.props..add(ids);
}

class SetupBloggers extends BloggersEvent {
  SetupBloggers(this.ids);
  final List<int> ids;

  @override
  List<Object?> get props => super.props..add(ids);
}

class SelectSetupedBloggers extends BloggersEvent {}

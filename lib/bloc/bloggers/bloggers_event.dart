import 'package:equatable/equatable.dart';

class BloggersEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadBlogegrs extends BloggersEvent {}

class SelectBloggers extends BloggersEvent {
  SelectBloggers(this.ids);
  final List<int> ids;

  @override
  List<Object?> get props => super.props..add(ids);
}

import 'package:equatable/equatable.dart';
import 'package:sumi_api/sumi_api.dart';

class BloggersState extends Equatable {
  @override
  List<Object?> get props => [];
}

class BloggersLoading extends BloggersState {}

class BloggersLoadingFailure extends BloggersState {}

class BloggersLoaded extends BloggersState {
  BloggersLoaded(this.bloggers);
  final List<ApiBlogger> bloggers;

  @override
  List<Object?> get props => super.props..add(bloggers);
}

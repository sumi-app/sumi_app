import 'package:equatable/equatable.dart';
import 'package:sumi_api/sumi_api.dart';

class BloggerState extends Equatable {
  @override
  List<Object?> get props => [];
}

class BloggerLoading extends BloggerState {}

class BloggerLoadingFailure extends BloggerState {}

class BloggerLoaded extends BloggerState {
  BloggerLoaded({
    required this.blogger,
  });
  final ApiBlogger blogger;

  @override
  List<Object?> get props => super.props..add(blogger);
}

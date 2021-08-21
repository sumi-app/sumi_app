import 'package:equatable/equatable.dart';

class ReviewsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ReviewLoading extends ReviewsState {}

class ReviewLoadingFailure extends ReviewsState {}

// class BloggersLoaded extends ReviewsState {
//   BloggersLoaded({
//     required this.unselectBloggers,
//     required this.selectedBloggers,
//   });
//   final List<ApiBlogger> unselectBloggers;
//   final List<ApiBlogger> selectedBloggers;

//   @override
//   List<Object?> get props => super.props
//     ..addAll([
//       unselectBloggers,
//       selectedBloggers,
//     ]);
// }

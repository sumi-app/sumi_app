import 'package:equatable/equatable.dart';
import 'package:sumi_api/sumi_api.dart';

class ReviewsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ReviewsLoading extends ReviewsState {}

class ReviewsLoadingFailure extends ReviewsState {}

class ReviewsLoaded extends ReviewsState {
  ReviewsLoaded({
    required this.reviews,
  });
  final List<ApiReview> reviews;

  @override
  List<Object?> get props => super.props..add(reviews);
}

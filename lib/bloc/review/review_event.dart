import 'package:equatable/equatable.dart';

class ReviewsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadReviews extends ReviewsEvent {
  LoadReviews({this.withLoading = true});
  final bool withLoading;

  @override
  List<Object?> get props => super.props..add(withLoading);
}

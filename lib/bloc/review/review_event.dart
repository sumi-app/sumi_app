import 'package:equatable/equatable.dart';

class ReviewEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadReviews extends ReviewEvent {
  LoadReviews({this.withLoading = true});
  final bool withLoading;

  @override
  List<Object?> get props => super.props..add(withLoading);
}

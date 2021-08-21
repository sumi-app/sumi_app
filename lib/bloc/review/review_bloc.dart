import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumi/bloc/review/bloc.dart';
import 'package:sumi/utils/utils.dart';

class ReviewBloc extends Bloc<ReviewsEvent, ReviewsState> {
  ReviewBloc() : super(ReviewsLoading());

  @override
  Stream<ReviewsState> mapEventToState(ReviewsEvent event) async* {
    if (event is LoadReviews) {
      yield* _mapLoadReviewsToState(event);
    }
  }

  Stream<ReviewsState> _mapLoadReviewsToState(LoadReviews event) async* {
    if (event.withLoading) {
      yield ReviewsLoading();
    }
    try {
      final reviews = await ApiProvider.sdk.review.get();
      yield ReviewsLoaded(reviews: reviews);
    } catch (e) {
      yield ReviewsLoadingFailure();
    }
  }
}

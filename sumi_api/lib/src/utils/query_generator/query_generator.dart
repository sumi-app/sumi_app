abstract class QueryGenerator {
  static Map<String, dynamic> generatePagination(
    // ignore: avoid_positional_boolean_parameters
    bool pagination,
    int page,
    int countForPage,
  ) {
    final queryParameters = <String, dynamic>{};

    if (pagination) {
      queryParameters.addAll(
        {
          'pagination': pagination,
          'page': page,
          'countForPage': countForPage,
        },
      );
    }
    return queryParameters;
  }

  static Map<String, dynamic> generateSearch({
    String? searchQuery,
    List<int>? authorIds,
    List<int>? themeIds,
  }) {
    final queryParameters = {
      'searchQuery': searchQuery,
      'authorIds': authorIds,
      'themeIds': themeIds,
    }..removeWhere((_, v) => v == null);
    return queryParameters;
  }

  static Map<String, dynamic> generateSearchWithPagination({
    String? searchQuery,
    List<int>? authorIds,
    List<int>? themeIds,
    required bool pagination,
    required int page,
    required int countForPage,
  }) {
    final searchQueryParameters = generateSearch(
      searchQuery: searchQuery,
      authorIds: authorIds,
      themeIds: themeIds,
    );
    final paginationQueryParameters = QueryGenerator.generatePagination(
      pagination,
      page,
      countForPage,
    );

    final queryParametersWithPagination = searchQueryParameters
      ..addAll(paginationQueryParameters);

    return queryParametersWithPagination;
  }
}

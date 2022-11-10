//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class RankingApi {
  RankingApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// 予選ランキングを返す。
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] eventId (required):
  ///
  /// * [bool] latest:
  ///   Return latest ranking if true.
  Future<Response> getRankingWithHttpInfo(String eventId, { bool? latest, }) async {
    // ignore: prefer_const_declarations
    final path = r'/{eventId}/ranking'
      .replaceAll('{eventId}', eventId);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (latest != null) {
      queryParams.addAll(_queryParams('', 'latest', latest));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// 予選ランキングを返す。
  ///
  /// Parameters:
  ///
  /// * [String] eventId (required):
  ///
  /// * [bool] latest:
  ///   Return latest ranking if true.
  Future<Ranking?> getRanking(String eventId, { bool? latest, }) async {
    final response = await getRankingWithHttpInfo(eventId,  latest: latest, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Ranking',) as Ranking;
    
    }
    return null;
  }
}

//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class ResultApi {
  ResultApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// リザルト一覧を返す。リザルトと言いつつ終了していない未来のマッチも返す。ゲスト・管理アプリ両方から使う。team_idを指定するとそのチームのみの結果が返ってくる。
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] eventId (required):
  ///
  /// * [int] teamId:
  ///   team id
  ///
  /// * [String] X_SPLATHON_API_TOKEN:
  Future<Response> getResultWithHttpInfo(String eventId, { int? teamId, String? X_SPLATHON_API_TOKEN, }) async {
    // ignore: prefer_const_declarations
    final path = r'/{eventId}/results'
      .replaceAll('{eventId}', eventId);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (teamId != null) {
      queryParams.addAll(_queryParams('', 'team_id', teamId));
    }

    if (X_SPLATHON_API_TOKEN != null) {
      headerParams[r'X-SPLATHON-API-TOKEN'] = parameterToString(X_SPLATHON_API_TOKEN);
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

  /// リザルト一覧を返す。リザルトと言いつつ終了していない未来のマッチも返す。ゲスト・管理アプリ両方から使う。team_idを指定するとそのチームのみの結果が返ってくる。
  ///
  /// Parameters:
  ///
  /// * [String] eventId (required):
  ///
  /// * [int] teamId:
  ///   team id
  ///
  /// * [String] X_SPLATHON_API_TOKEN:
  Future<Results?> getResult(String eventId, { int? teamId, String? X_SPLATHON_API_TOKEN, }) async {
    final response = await getResultWithHttpInfo(eventId,  teamId: teamId, X_SPLATHON_API_TOKEN: X_SPLATHON_API_TOKEN, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Results',) as Results;
    
    }
    return null;
  }
}

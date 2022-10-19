//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class MatchApi {
  MatchApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// マッチの詳細を返す。スコアボードとかで使える。
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] eventId (required):
  ///
  /// * [int] matchId (required):
  ///   match id
  Future<Response> getMatchWithHttpInfo(int eventId, int matchId,) async {
    // ignore: prefer_const_declarations
    final path = r'/v{eventId}/matches/{matchId}'
      .replaceAll('{eventId}', eventId.toString())
      .replaceAll('{matchId}', matchId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

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

  /// マッチの詳細を返す。スコアボードとかで使える。
  ///
  /// Parameters:
  ///
  /// * [int] eventId (required):
  ///
  /// * [int] matchId (required):
  ///   match id
  Future<Match?> getMatch(int eventId, int matchId,) async {
    final response = await getMatchWithHttpInfo(eventId, matchId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Match',) as Match;
    
    }
    return null;
  }

  /// 次の試合を返す。team_id を指定した場合そのチームの、なければログインしている参加者のチームの 次のマッチをあれば返す。 team_idを指定せず参加者がチームに属して無い場合などはエラー。
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] eventId (required):
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  ///
  /// * [int] teamId:
  ///   team id
  Future<Response> getNextMatchWithHttpInfo(int eventId, String X_SPLATHON_API_TOKEN, { int? teamId, }) async {
    // ignore: prefer_const_declarations
    final path = r'/v{eventId}/next-match'
      .replaceAll('{eventId}', eventId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (teamId != null) {
      queryParams.addAll(_queryParams('', 'team_id', teamId));
    }

    headerParams[r'X-SPLATHON-API-TOKEN'] = parameterToString(X_SPLATHON_API_TOKEN);

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

  /// 次の試合を返す。team_id を指定した場合そのチームの、なければログインしている参加者のチームの 次のマッチをあれば返す。 team_idを指定せず参加者がチームに属して無い場合などはエラー。
  ///
  /// Parameters:
  ///
  /// * [int] eventId (required):
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  ///
  /// * [int] teamId:
  ///   team id
  Future<GetNextMatchResponse?> getNextMatch(int eventId, String X_SPLATHON_API_TOKEN, { int? teamId, }) async {
    final response = await getNextMatchWithHttpInfo(eventId, X_SPLATHON_API_TOKEN,  teamId: teamId, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'GetNextMatchResponse',) as GetNextMatchResponse;
    
    }
    return null;
  }

  /// Update a battle data in the match.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] eventId (required):
  ///
  /// * [int] matchId (required):
  ///   match id
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  ///
  /// * [Battle] battle (required):
  Future<Response> updateBattleWithHttpInfo(int eventId, int matchId, String X_SPLATHON_API_TOKEN, Battle battle,) async {
    // ignore: prefer_const_declarations
    final path = r'/v{eventId}/matches/{matchId}'
      .replaceAll('{eventId}', eventId.toString())
      .replaceAll('{matchId}', matchId.toString());

    // ignore: prefer_final_locals
    Object? postBody = battle;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    headerParams[r'X-SPLATHON-API-TOKEN'] = parameterToString(X_SPLATHON_API_TOKEN);

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Update a battle data in the match.
  ///
  /// Parameters:
  ///
  /// * [int] eventId (required):
  ///
  /// * [int] matchId (required):
  ///   match id
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  ///
  /// * [Battle] battle (required):
  Future<void> updateBattle(int eventId, int matchId, String X_SPLATHON_API_TOKEN, Battle battle,) async {
    final response = await updateBattleWithHttpInfo(eventId, matchId, X_SPLATHON_API_TOKEN, battle,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }
}

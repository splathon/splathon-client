//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class AdminApi {
  AdminApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'POST /v{eventId}/tournament/' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] eventId (required):
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  ///
  /// * [AddTournamentRoundRequest] request (required):
  Future<Response> addTournamentRoundWithHttpInfo(int eventId, String X_SPLATHON_API_TOKEN, AddTournamentRoundRequest request,) async {
    // ignore: prefer_const_declarations
    final path = r'/v{eventId}/tournament/'
      .replaceAll('{eventId}', eventId.toString());

    // ignore: prefer_final_locals
    Object? postBody = request;

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

  /// Parameters:
  ///
  /// * [int] eventId (required):
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  ///
  /// * [AddTournamentRoundRequest] request (required):
  Future<void> addTournamentRound(int eventId, String X_SPLATHON_API_TOKEN, AddTournamentRoundRequest request,) async {
    final response = await addTournamentRoundWithHttpInfo(eventId, X_SPLATHON_API_TOKEN, request,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// 参加登録API
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] eventId (required):
  ///
  /// * [String] splathonReceptionCode (required):
  ///   ReceptionResponse.splathon.code と同じもの(たぶん内部SlackID).
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  Future<Response> completeReceptionWithHttpInfo(int eventId, String splathonReceptionCode, String X_SPLATHON_API_TOKEN,) async {
    // ignore: prefer_const_declarations
    final path = r'/v{eventId}/reception/{splathonReceptionCode}/complete'
      .replaceAll('{eventId}', eventId.toString())
      .replaceAll('{splathonReceptionCode}', splathonReceptionCode);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    headerParams[r'X-SPLATHON-API-TOKEN'] = parameterToString(X_SPLATHON_API_TOKEN);

    const contentTypes = <String>[];


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

  /// 参加登録API
  ///
  /// Parameters:
  ///
  /// * [int] eventId (required):
  ///
  /// * [String] splathonReceptionCode (required):
  ///   ReceptionResponse.splathon.code と同じもの(たぶん内部SlackID).
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  Future<void> completeReception(int eventId, String splathonReceptionCode, String X_SPLATHON_API_TOKEN,) async {
    final response = await completeReceptionWithHttpInfo(eventId, splathonReceptionCode, X_SPLATHON_API_TOKEN,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'POST /v{eventId}/qualifier' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] eventId (required):
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  Future<Response> createNewQualifierWithHttpInfo(int eventId, String X_SPLATHON_API_TOKEN,) async {
    // ignore: prefer_const_declarations
    final path = r'/v{eventId}/qualifier'
      .replaceAll('{eventId}', eventId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    headerParams[r'X-SPLATHON-API-TOKEN'] = parameterToString(X_SPLATHON_API_TOKEN);

    const contentTypes = <String>[];


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

  /// Parameters:
  ///
  /// * [int] eventId (required):
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  Future<void> createNewQualifier(int eventId, String X_SPLATHON_API_TOKEN,) async {
    final response = await createNewQualifierWithHttpInfo(eventId, X_SPLATHON_API_TOKEN,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'DELETE /v{eventId}/notices/{noticeId}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] eventId (required):
  ///
  /// * [int] noticeId (required):
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  Future<Response> deleteNoticeWithHttpInfo(int eventId, int noticeId, String X_SPLATHON_API_TOKEN,) async {
    // ignore: prefer_const_declarations
    final path = r'/v{eventId}/notices/{noticeId}'
      .replaceAll('{eventId}', eventId.toString())
      .replaceAll('{noticeId}', noticeId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    headerParams[r'X-SPLATHON-API-TOKEN'] = parameterToString(X_SPLATHON_API_TOKEN);

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] eventId (required):
  ///
  /// * [int] noticeId (required):
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  Future<void> deleteNotice(int eventId, int noticeId, String X_SPLATHON_API_TOKEN,) async {
    final response = await deleteNoticeWithHttpInfo(eventId, noticeId, X_SPLATHON_API_TOKEN,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'POST /v{eventId}/delete-qualifier' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] eventId (required):
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  ///
  /// * [DeleteQualifierRequest] request:
  Future<Response> deleteQualifierWithHttpInfo(int eventId, String X_SPLATHON_API_TOKEN, { DeleteQualifierRequest? request, }) async {
    // ignore: prefer_const_declarations
    final path = r'/v{eventId}/delete-qualifier'
      .replaceAll('{eventId}', eventId.toString());

    // ignore: prefer_final_locals
    Object? postBody = request;

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

  /// Parameters:
  ///
  /// * [int] eventId (required):
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  ///
  /// * [DeleteQualifierRequest] request:
  Future<void> deleteQualifier(int eventId, String X_SPLATHON_API_TOKEN, { DeleteQualifierRequest? request, }) async {
    final response = await deleteQualifierWithHttpInfo(eventId, X_SPLATHON_API_TOKEN,  request: request, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// 参加者情報取得API
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] eventId (required):
  ///
  /// * [String] splathonReceptionCode (required):
  ///   ReceptionResponse.splathon.code と同じもの(たぶん内部SlackID).
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  Future<Response> getParticipantsDataForReceptionWithHttpInfo(int eventId, String splathonReceptionCode, String X_SPLATHON_API_TOKEN,) async {
    // ignore: prefer_const_declarations
    final path = r'/v{eventId}/reception/{splathonReceptionCode}'
      .replaceAll('{eventId}', eventId.toString())
      .replaceAll('{splathonReceptionCode}', splathonReceptionCode);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

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

  /// 参加者情報取得API
  ///
  /// Parameters:
  ///
  /// * [int] eventId (required):
  ///
  /// * [String] splathonReceptionCode (required):
  ///   ReceptionResponse.splathon.code と同じもの(たぶん内部SlackID).
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  Future<ReceptionPartcipantsDataResponse?> getParticipantsDataForReception(int eventId, String splathonReceptionCode, String X_SPLATHON_API_TOKEN,) async {
    final response = await getParticipantsDataForReceptionWithHttpInfo(eventId, splathonReceptionCode, X_SPLATHON_API_TOKEN,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ReceptionPartcipantsDataResponse',) as ReceptionPartcipantsDataResponse;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /v{eventId}/release-qualifier' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] eventId (required):
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  Future<Response> getReleaseQualifierWithHttpInfo(int eventId, String X_SPLATHON_API_TOKEN,) async {
    // ignore: prefer_const_declarations
    final path = r'/v{eventId}/release-qualifier'
      .replaceAll('{eventId}', eventId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

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

  /// Parameters:
  ///
  /// * [int] eventId (required):
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  Future<int?> getReleaseQualifier(int eventId, String X_SPLATHON_API_TOKEN,) async {
    final response = await getReleaseQualifierWithHttpInfo(eventId, X_SPLATHON_API_TOKEN,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'int',) as int;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /v{eventId}/list-reception' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] eventId (required):
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  Future<Response> listReceptionWithHttpInfo(int eventId, String X_SPLATHON_API_TOKEN,) async {
    // ignore: prefer_const_declarations
    final path = r'/v{eventId}/list-reception'
      .replaceAll('{eventId}', eventId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

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

  /// Parameters:
  ///
  /// * [int] eventId (required):
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  Future<ListReceptionResponse?> listReception(int eventId, String X_SPLATHON_API_TOKEN,) async {
    final response = await listReceptionWithHttpInfo(eventId, X_SPLATHON_API_TOKEN,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ListReceptionResponse',) as ListReceptionResponse;
    
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

  /// Performs an HTTP 'PUT /v{eventId}/matches/{matchId}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] eventId (required):
  ///
  /// * [int] matchId (required):
  ///   match id
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  ///
  /// * [NewMatchRequest] match (required):
  Future<Response> updateMatchWithHttpInfo(int eventId, int matchId, String X_SPLATHON_API_TOKEN, NewMatchRequest match,) async {
    // ignore: prefer_const_declarations
    final path = r'/v{eventId}/matches/{matchId}'
      .replaceAll('{eventId}', eventId.toString())
      .replaceAll('{matchId}', matchId.toString());

    // ignore: prefer_final_locals
    Object? postBody = match;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    headerParams[r'X-SPLATHON-API-TOKEN'] = parameterToString(X_SPLATHON_API_TOKEN);

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] eventId (required):
  ///
  /// * [int] matchId (required):
  ///   match id
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  ///
  /// * [NewMatchRequest] match (required):
  Future<void> updateMatch(int eventId, int matchId, String X_SPLATHON_API_TOKEN, NewMatchRequest match,) async {
    final response = await updateMatchWithHttpInfo(eventId, matchId, X_SPLATHON_API_TOKEN, match,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'POST /v{eventId}/update-reception' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] eventId (required):
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  ///
  /// * [UpdateReceptionRequest] request (required):
  Future<Response> updateReceptionWithHttpInfo(int eventId, String X_SPLATHON_API_TOKEN, UpdateReceptionRequest request,) async {
    // ignore: prefer_const_declarations
    final path = r'/v{eventId}/update-reception'
      .replaceAll('{eventId}', eventId.toString());

    // ignore: prefer_final_locals
    Object? postBody = request;

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

  /// Parameters:
  ///
  /// * [int] eventId (required):
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  ///
  /// * [UpdateReceptionRequest] request (required):
  Future<void> updateReception(int eventId, String X_SPLATHON_API_TOKEN, UpdateReceptionRequest request,) async {
    final response = await updateReceptionWithHttpInfo(eventId, X_SPLATHON_API_TOKEN, request,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'PUT /v{eventId}/release-qualifier' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] eventId (required):
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  ///
  /// * [UpdateReleaseQualifierRequest] request:
  Future<Response> updateReleaseQualifierWithHttpInfo(int eventId, String X_SPLATHON_API_TOKEN, { UpdateReleaseQualifierRequest? request, }) async {
    // ignore: prefer_const_declarations
    final path = r'/v{eventId}/release-qualifier'
      .replaceAll('{eventId}', eventId.toString());

    // ignore: prefer_final_locals
    Object? postBody = request;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    headerParams[r'X-SPLATHON-API-TOKEN'] = parameterToString(X_SPLATHON_API_TOKEN);

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] eventId (required):
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  ///
  /// * [UpdateReleaseQualifierRequest] request:
  Future<void> updateReleaseQualifier(int eventId, String X_SPLATHON_API_TOKEN, { UpdateReleaseQualifierRequest? request, }) async {
    final response = await updateReleaseQualifierWithHttpInfo(eventId, X_SPLATHON_API_TOKEN,  request: request, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Update event schedule data
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] eventId (required):
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  ///
  /// * [Schedule] request (required):
  Future<Response> updateScheduleWithHttpInfo(int eventId, String X_SPLATHON_API_TOKEN, Schedule request,) async {
    // ignore: prefer_const_declarations
    final path = r'/v{eventId}/schedule'
      .replaceAll('{eventId}', eventId.toString());

    // ignore: prefer_final_locals
    Object? postBody = request;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    headerParams[r'X-SPLATHON-API-TOKEN'] = parameterToString(X_SPLATHON_API_TOKEN);

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Update event schedule data
  ///
  /// Parameters:
  ///
  /// * [int] eventId (required):
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  ///
  /// * [Schedule] request (required):
  Future<void> updateSchedule(int eventId, String X_SPLATHON_API_TOKEN, Schedule request,) async {
    final response = await updateScheduleWithHttpInfo(eventId, X_SPLATHON_API_TOKEN, request,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Insert or update notices. Update if Notice.id is specified.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] eventId (required):
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  ///
  /// * [Notice] notice (required):
  Future<Response> writeNoticeWithHttpInfo(int eventId, String X_SPLATHON_API_TOKEN, Notice notice,) async {
    // ignore: prefer_const_declarations
    final path = r'/v{eventId}/notices'
      .replaceAll('{eventId}', eventId.toString());

    // ignore: prefer_final_locals
    Object? postBody = notice;

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

  /// Insert or update notices. Update if Notice.id is specified.
  ///
  /// Parameters:
  ///
  /// * [int] eventId (required):
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  ///
  /// * [Notice] notice (required):
  Future<void> writeNotice(int eventId, String X_SPLATHON_API_TOKEN, Notice notice,) async {
    final response = await writeNoticeWithHttpInfo(eventId, X_SPLATHON_API_TOKEN, notice,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }
}

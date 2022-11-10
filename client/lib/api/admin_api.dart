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

  /// Performs an HTTP 'POST /{eventId}/tournament/' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] eventId (required):
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  ///
  /// * [AddTournamentRoundRequest] request (required):
  Future<Response> addTournamentRoundWithHttpInfo(String eventId, String X_SPLATHON_API_TOKEN, AddTournamentRoundRequest request,) async {
    // ignore: prefer_const_declarations
    final path = r'/{eventId}/tournament/'
      .replaceAll('{eventId}', eventId);

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
  /// * [String] eventId (required):
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  ///
  /// * [AddTournamentRoundRequest] request (required):
  Future<void> addTournamentRound(String eventId, String X_SPLATHON_API_TOKEN, AddTournamentRoundRequest request,) async {
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
  /// * [String] eventId (required):
  ///
  /// * [String] splathonReceptionCode (required):
  ///   ReceptionResponse.splathon.code と同じもの(たぶん内部SlackID).
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  Future<Response> completeReceptionWithHttpInfo(String eventId, String splathonReceptionCode, String X_SPLATHON_API_TOKEN,) async {
    // ignore: prefer_const_declarations
    final path = r'/{eventId}/reception/{splathonReceptionCode}/complete'
      .replaceAll('{eventId}', eventId)
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
  /// * [String] eventId (required):
  ///
  /// * [String] splathonReceptionCode (required):
  ///   ReceptionResponse.splathon.code と同じもの(たぶん内部SlackID).
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  Future<void> completeReception(String eventId, String splathonReceptionCode, String X_SPLATHON_API_TOKEN,) async {
    final response = await completeReceptionWithHttpInfo(eventId, splathonReceptionCode, X_SPLATHON_API_TOKEN,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Create event data
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  ///
  /// * [Event] request (required):
  Future<Response> createEventWithHttpInfo(String X_SPLATHON_API_TOKEN, Event request,) async {
    // ignore: prefer_const_declarations
    final path = r'/create-event';

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

  /// Create event data
  ///
  /// Parameters:
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  ///
  /// * [Event] request (required):
  Future<void> createEvent(String X_SPLATHON_API_TOKEN, Event request,) async {
    final response = await createEventWithHttpInfo(X_SPLATHON_API_TOKEN, request,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'POST /{eventId}/qualifier' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] eventId (required):
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  Future<Response> createNewQualifierWithHttpInfo(String eventId, String X_SPLATHON_API_TOKEN,) async {
    // ignore: prefer_const_declarations
    final path = r'/{eventId}/qualifier'
      .replaceAll('{eventId}', eventId);

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
  /// * [String] eventId (required):
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  Future<void> createNewQualifier(String eventId, String X_SPLATHON_API_TOKEN,) async {
    final response = await createNewQualifierWithHttpInfo(eventId, X_SPLATHON_API_TOKEN,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'DELETE /{eventId}/event' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] eventId (required):
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  Future<Response> deleteEventWithHttpInfo(String eventId, String X_SPLATHON_API_TOKEN,) async {
    // ignore: prefer_const_declarations
    final path = r'/{eventId}/event'
      .replaceAll('{eventId}', eventId);

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
  /// * [String] eventId (required):
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  Future<void> deleteEvent(String eventId, String X_SPLATHON_API_TOKEN,) async {
    final response = await deleteEventWithHttpInfo(eventId, X_SPLATHON_API_TOKEN,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'DELETE /{eventId}/notices/{noticeId}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] eventId (required):
  ///
  /// * [int] noticeId (required):
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  Future<Response> deleteNoticeWithHttpInfo(String eventId, int noticeId, String X_SPLATHON_API_TOKEN,) async {
    // ignore: prefer_const_declarations
    final path = r'/{eventId}/notices/{noticeId}'
      .replaceAll('{eventId}', eventId)
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
  /// * [String] eventId (required):
  ///
  /// * [int] noticeId (required):
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  Future<void> deleteNotice(String eventId, int noticeId, String X_SPLATHON_API_TOKEN,) async {
    final response = await deleteNoticeWithHttpInfo(eventId, noticeId, X_SPLATHON_API_TOKEN,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'POST /{eventId}/delete-qualifier' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] eventId (required):
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  ///
  /// * [DeleteQualifierRequest] request:
  Future<Response> deleteQualifierWithHttpInfo(String eventId, String X_SPLATHON_API_TOKEN, { DeleteQualifierRequest? request, }) async {
    // ignore: prefer_const_declarations
    final path = r'/{eventId}/delete-qualifier'
      .replaceAll('{eventId}', eventId);

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
  /// * [String] eventId (required):
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  ///
  /// * [DeleteQualifierRequest] request:
  Future<void> deleteQualifier(String eventId, String X_SPLATHON_API_TOKEN, { DeleteQualifierRequest? request, }) async {
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
  /// * [String] eventId (required):
  ///
  /// * [String] splathonReceptionCode (required):
  ///   ReceptionResponse.splathon.code と同じもの(たぶん内部SlackID).
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  Future<Response> getParticipantsDataForReceptionWithHttpInfo(String eventId, String splathonReceptionCode, String X_SPLATHON_API_TOKEN,) async {
    // ignore: prefer_const_declarations
    final path = r'/{eventId}/reception/{splathonReceptionCode}'
      .replaceAll('{eventId}', eventId)
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
  /// * [String] eventId (required):
  ///
  /// * [String] splathonReceptionCode (required):
  ///   ReceptionResponse.splathon.code と同じもの(たぶん内部SlackID).
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  Future<ReceptionPartcipantsDataResponse?> getParticipantsDataForReception(String eventId, String splathonReceptionCode, String X_SPLATHON_API_TOKEN,) async {
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

  /// Performs an HTTP 'GET /{eventId}/release-qualifier' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] eventId (required):
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  Future<Response> getReleaseQualifierWithHttpInfo(String eventId, String X_SPLATHON_API_TOKEN,) async {
    // ignore: prefer_const_declarations
    final path = r'/{eventId}/release-qualifier'
      .replaceAll('{eventId}', eventId);

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
  /// * [String] eventId (required):
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  Future<int?> getReleaseQualifier(String eventId, String X_SPLATHON_API_TOKEN,) async {
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

  /// Performs an HTTP 'GET /{eventId}/list-reception' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] eventId (required):
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  Future<Response> listReceptionWithHttpInfo(String eventId, String X_SPLATHON_API_TOKEN,) async {
    // ignore: prefer_const_declarations
    final path = r'/{eventId}/list-reception'
      .replaceAll('{eventId}', eventId);

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
  /// * [String] eventId (required):
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  Future<ListReceptionResponse?> listReception(String eventId, String X_SPLATHON_API_TOKEN,) async {
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
  /// * [String] eventId (required):
  ///
  /// * [int] matchId (required):
  ///   match id
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  ///
  /// * [Battle] battle (required):
  Future<Response> updateBattleWithHttpInfo(String eventId, int matchId, String X_SPLATHON_API_TOKEN, Battle battle,) async {
    // ignore: prefer_const_declarations
    final path = r'/{eventId}/matches/{matchId}'
      .replaceAll('{eventId}', eventId)
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
  /// * [String] eventId (required):
  ///
  /// * [int] matchId (required):
  ///   match id
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  ///
  /// * [Battle] battle (required):
  Future<void> updateBattle(String eventId, int matchId, String X_SPLATHON_API_TOKEN, Battle battle,) async {
    final response = await updateBattleWithHttpInfo(eventId, matchId, X_SPLATHON_API_TOKEN, battle,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Update event data
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] eventId (required):
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  ///
  /// * [Event] request (required):
  Future<Response> updateEventWithHttpInfo(String eventId, String X_SPLATHON_API_TOKEN, Event request,) async {
    // ignore: prefer_const_declarations
    final path = r'/{eventId}/event'
      .replaceAll('{eventId}', eventId);

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

  /// Update event data
  ///
  /// Parameters:
  ///
  /// * [String] eventId (required):
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  ///
  /// * [Event] request (required):
  Future<void> updateEvent(String eventId, String X_SPLATHON_API_TOKEN, Event request,) async {
    final response = await updateEventWithHttpInfo(eventId, X_SPLATHON_API_TOKEN, request,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'PUT /{eventId}/matches/{matchId}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] eventId (required):
  ///
  /// * [int] matchId (required):
  ///   match id
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  ///
  /// * [NewMatchRequest] match (required):
  Future<Response> updateMatchWithHttpInfo(String eventId, int matchId, String X_SPLATHON_API_TOKEN, NewMatchRequest match,) async {
    // ignore: prefer_const_declarations
    final path = r'/{eventId}/matches/{matchId}'
      .replaceAll('{eventId}', eventId)
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
  /// * [String] eventId (required):
  ///
  /// * [int] matchId (required):
  ///   match id
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  ///
  /// * [NewMatchRequest] match (required):
  Future<void> updateMatch(String eventId, int matchId, String X_SPLATHON_API_TOKEN, NewMatchRequest match,) async {
    final response = await updateMatchWithHttpInfo(eventId, matchId, X_SPLATHON_API_TOKEN, match,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'POST /{eventId}/update-reception' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] eventId (required):
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  ///
  /// * [UpdateReceptionRequest] request (required):
  Future<Response> updateReceptionWithHttpInfo(String eventId, String X_SPLATHON_API_TOKEN, UpdateReceptionRequest request,) async {
    // ignore: prefer_const_declarations
    final path = r'/{eventId}/update-reception'
      .replaceAll('{eventId}', eventId);

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
  /// * [String] eventId (required):
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  ///
  /// * [UpdateReceptionRequest] request (required):
  Future<void> updateReception(String eventId, String X_SPLATHON_API_TOKEN, UpdateReceptionRequest request,) async {
    final response = await updateReceptionWithHttpInfo(eventId, X_SPLATHON_API_TOKEN, request,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'PUT /{eventId}/release-qualifier' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] eventId (required):
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  ///
  /// * [UpdateReleaseQualifierRequest] request:
  Future<Response> updateReleaseQualifierWithHttpInfo(String eventId, String X_SPLATHON_API_TOKEN, { UpdateReleaseQualifierRequest? request, }) async {
    // ignore: prefer_const_declarations
    final path = r'/{eventId}/release-qualifier'
      .replaceAll('{eventId}', eventId);

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
  /// * [String] eventId (required):
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  ///
  /// * [UpdateReleaseQualifierRequest] request:
  Future<void> updateReleaseQualifier(String eventId, String X_SPLATHON_API_TOKEN, { UpdateReleaseQualifierRequest? request, }) async {
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
  /// * [String] eventId (required):
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  ///
  /// * [Schedule] request (required):
  Future<Response> updateScheduleWithHttpInfo(String eventId, String X_SPLATHON_API_TOKEN, Schedule request,) async {
    // ignore: prefer_const_declarations
    final path = r'/{eventId}/schedule'
      .replaceAll('{eventId}', eventId);

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
  /// * [String] eventId (required):
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  ///
  /// * [Schedule] request (required):
  Future<void> updateSchedule(String eventId, String X_SPLATHON_API_TOKEN, Schedule request,) async {
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
  /// * [String] eventId (required):
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  ///
  /// * [Notice] notice (required):
  Future<Response> writeNoticeWithHttpInfo(String eventId, String X_SPLATHON_API_TOKEN, Notice notice,) async {
    // ignore: prefer_const_declarations
    final path = r'/{eventId}/notices'
      .replaceAll('{eventId}', eventId);

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
  /// * [String] eventId (required):
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  ///
  /// * [Notice] notice (required):
  Future<void> writeNotice(String eventId, String X_SPLATHON_API_TOKEN, Notice notice,) async {
    final response = await writeNoticeWithHttpInfo(eventId, X_SPLATHON_API_TOKEN, notice,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }
}

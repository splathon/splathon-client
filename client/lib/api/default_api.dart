//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class DefaultApi {
  DefaultApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Return event data
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] eventId (required):
  Future<Response> getEventWithHttpInfo(String eventId,) async {
    // ignore: prefer_const_declarations
    final path = r'/{eventId}/event'
      .replaceAll('{eventId}', eventId);

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

  /// Return event data
  ///
  /// Parameters:
  ///
  /// * [String] eventId (required):
  Future<Event?> getEvent(String eventId,) async {
    final response = await getEventWithHttpInfo(eventId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Event',) as Event;
    
    }
    return null;
  }

  /// Return event schedule data
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] eventId (required):
  Future<Response> getScheduleWithHttpInfo(String eventId,) async {
    // ignore: prefer_const_declarations
    final path = r'/{eventId}/schedule'
      .replaceAll('{eventId}', eventId);

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

  /// Return event schedule data
  ///
  /// Parameters:
  ///
  /// * [String] eventId (required):
  Future<Schedule?> getSchedule(String eventId,) async {
    final response = await getScheduleWithHttpInfo(eventId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Schedule',) as Schedule;
    
    }
    return null;
  }

  /// Return detail team data
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] eventId (required):
  ///
  /// * [int] teamId (required):
  ///   team id
  Future<Response> getTeamDetailWithHttpInfo(String eventId, int teamId,) async {
    // ignore: prefer_const_declarations
    final path = r'/{eventId}/teams/{team_id}'
      .replaceAll('{eventId}', eventId)
      .replaceAll('{team_id}', teamId.toString());

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

  /// Return detail team data
  ///
  /// Parameters:
  ///
  /// * [String] eventId (required):
  ///
  /// * [int] teamId (required):
  ///   team id
  Future<Team?> getTeamDetail(String eventId, int teamId,) async {
    final response = await getTeamDetailWithHttpInfo(eventId, teamId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Team',) as Team;
    
    }
    return null;
  }

  /// Return event list data
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> listEventsWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/events';

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

  /// Return event list data
  Future<Events?> listEvents() async {
    final response = await listEventsWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Events',) as Events;
    
    }
    return null;
  }

  /// Return notices
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] eventId (required):
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  Future<Response> listNoticesWithHttpInfo(String eventId, String X_SPLATHON_API_TOKEN,) async {
    // ignore: prefer_const_declarations
    final path = r'/{eventId}/notices'
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

  /// Return notices
  ///
  /// Parameters:
  ///
  /// * [String] eventId (required):
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  Future<ListNoticesResponse?> listNotices(String eventId, String X_SPLATHON_API_TOKEN,) async {
    final response = await listNoticesWithHttpInfo(eventId, X_SPLATHON_API_TOKEN,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ListNoticesResponse',) as ListNoticesResponse;
    
    }
    return null;
  }

  /// Return team list
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] eventId (required):
  Future<Response> listTeamsWithHttpInfo(String eventId,) async {
    // ignore: prefer_const_declarations
    final path = r'/{eventId}/teams'
      .replaceAll('{eventId}', eventId);

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

  /// Return team list
  ///
  /// Parameters:
  ///
  /// * [String] eventId (required):
  Future<Teams?> listTeams(String eventId,) async {
    final response = await listTeamsWithHttpInfo(eventId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Teams',) as Teams;
    
    }
    return null;
  }

  /// Performs an HTTP 'POST /{eventId}/login' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] eventId (required):
  ///
  /// * [LoginRequest] request (required):
  Future<Response> loginWithHttpInfo(String eventId, LoginRequest request,) async {
    // ignore: prefer_const_declarations
    final path = r'/{eventId}/login'
      .replaceAll('{eventId}', eventId);

    // ignore: prefer_final_locals
    Object? postBody = request;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

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
  /// * [LoginRequest] request (required):
  Future<LoginResponse?> login(String eventId, LoginRequest request,) async {
    final response = await loginWithHttpInfo(eventId, request,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'LoginResponse',) as LoginResponse;
    
    }
    return null;
  }
}

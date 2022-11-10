//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class ReceptionApi {
  ReceptionApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

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

  /// Performs an HTTP 'GET /{eventId}/reception' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] eventId (required):
  ///
  /// * [String] X_SPLATHON_API_TOKEN (required):
  Future<Response> getReceptionWithHttpInfo(String eventId, String X_SPLATHON_API_TOKEN,) async {
    // ignore: prefer_const_declarations
    final path = r'/{eventId}/reception'
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
  Future<ReceptionResponse?> getReception(String eventId, String X_SPLATHON_API_TOKEN,) async {
    final response = await getReceptionWithHttpInfo(eventId, X_SPLATHON_API_TOKEN,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ReceptionResponse',) as ReceptionResponse;
    
    }
    return null;
  }
}

part of openapi.api;



class ReceptionApi {
  final ApiClient apiClient;

  ReceptionApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  /// 
  ///
  /// 参加登録API
  Future completeReception(int eventId, String splathonReceptionCode, String X_SPLATHON_API_TOKEN) async {
    Object postBody;

    // verify required params are set
    if(eventId == null) {
     throw new ApiException(400, "Missing required param: eventId");
    }
    if(splathonReceptionCode == null) {
     throw new ApiException(400, "Missing required param: splathonReceptionCode");
    }
    if(X_SPLATHON_API_TOKEN == null) {
     throw new ApiException(400, "Missing required param: X_SPLATHON_API_TOKEN");
    }

    // create path and map variables
    String path = "/v{eventId}/reception/{splathonReceptionCode}/complete".replaceAll("{format}","json").replaceAll("{" + "eventId" + "}", eventId.toString()).replaceAll("{" + "splathonReceptionCode" + "}", splathonReceptionCode.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
    headerParams["X-SPLATHON-API-TOKEN"] = X_SPLATHON_API_TOKEN;

    List<String> contentTypes = [];

    String contentType = contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = [];

    if(contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      MultipartRequest mp = new MultipartRequest(null, null);
      if(hasFields)
        postBody = mp;
    }
    else {
    }

    var response = await apiClient.invokeAPI(path,
                                             'POST',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             contentType,
                                             authNames);

    if(response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if(response.body != null) {
    } else {
      return;
    }
  }
  /// 
  ///
  /// 参加者情報取得API
  Future<ReceptionPartcipantsDataResponse> getParticipantsDataForReception(int eventId, String splathonReceptionCode, String X_SPLATHON_API_TOKEN) async {
    Object postBody;

    // verify required params are set
    if(eventId == null) {
     throw new ApiException(400, "Missing required param: eventId");
    }
    if(splathonReceptionCode == null) {
     throw new ApiException(400, "Missing required param: splathonReceptionCode");
    }
    if(X_SPLATHON_API_TOKEN == null) {
     throw new ApiException(400, "Missing required param: X_SPLATHON_API_TOKEN");
    }

    // create path and map variables
    String path = "/v{eventId}/reception/{splathonReceptionCode}".replaceAll("{format}","json").replaceAll("{" + "eventId" + "}", eventId.toString()).replaceAll("{" + "splathonReceptionCode" + "}", splathonReceptionCode.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
    headerParams["X-SPLATHON-API-TOKEN"] = X_SPLATHON_API_TOKEN;

    List<String> contentTypes = [];

    String contentType = contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = [];

    if(contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      MultipartRequest mp = new MultipartRequest(null, null);
      if(hasFields)
        postBody = mp;
    }
    else {
    }

    var response = await apiClient.invokeAPI(path,
                                             'GET',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             contentType,
                                             authNames);

    if(response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if(response.body != null) {
      return apiClient.deserialize(response.body, 'ReceptionPartcipantsDataResponse') as ReceptionPartcipantsDataResponse;
    } else {
      return null;
    }
  }
  /// 
  ///
  /// 
  Future<ReceptionResponse> getReception(int eventId, String X_SPLATHON_API_TOKEN) async {
    Object postBody;

    // verify required params are set
    if(eventId == null) {
     throw new ApiException(400, "Missing required param: eventId");
    }
    if(X_SPLATHON_API_TOKEN == null) {
     throw new ApiException(400, "Missing required param: X_SPLATHON_API_TOKEN");
    }

    // create path and map variables
    String path = "/v{eventId}/reception".replaceAll("{format}","json").replaceAll("{" + "eventId" + "}", eventId.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
    headerParams["X-SPLATHON-API-TOKEN"] = X_SPLATHON_API_TOKEN;

    List<String> contentTypes = [];

    String contentType = contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = [];

    if(contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      MultipartRequest mp = new MultipartRequest(null, null);
      if(hasFields)
        postBody = mp;
    }
    else {
    }

    var response = await apiClient.invokeAPI(path,
                                             'GET',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             contentType,
                                             authNames);

    if(response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if(response.body != null) {
      return apiClient.deserialize(response.body, 'ReceptionResponse') as ReceptionResponse;
    } else {
      return null;
    }
  }
}

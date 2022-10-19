part of openapi.api;



class AdminApi {
  final ApiClient apiClient;

  AdminApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  /// 
  ///
  /// 
  Future addTournamentRound(int eventId, String X_SPLATHON_API_TOKEN, AddTournamentRoundRequest addTournamentRoundRequest) async {
    Object postBody = addTournamentRoundRequest;

    // verify required params are set
    if(eventId == null) {
     throw new ApiException(400, "Missing required param: eventId");
    }
    if(X_SPLATHON_API_TOKEN == null) {
     throw new ApiException(400, "Missing required param: X_SPLATHON_API_TOKEN");
    }
    if(addTournamentRoundRequest == null) {
     throw new ApiException(400, "Missing required param: addTournamentRoundRequest");
    }

    // create path and map variables
    String path = "/v{eventId}/tournament/".replaceAll("{format}","json").replaceAll("{" + "eventId" + "}", eventId.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
    headerParams["X-SPLATHON-API-TOKEN"] = X_SPLATHON_API_TOKEN;

    List<String> contentTypes = ["application/json"];

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
  /// 
  Future createNewQualifier(int eventId, String X_SPLATHON_API_TOKEN) async {
    Object postBody;

    // verify required params are set
    if(eventId == null) {
     throw new ApiException(400, "Missing required param: eventId");
    }
    if(X_SPLATHON_API_TOKEN == null) {
     throw new ApiException(400, "Missing required param: X_SPLATHON_API_TOKEN");
    }

    // create path and map variables
    String path = "/v{eventId}/qualifier".replaceAll("{format}","json").replaceAll("{" + "eventId" + "}", eventId.toString());

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
  /// 
  Future deleteNotice(int eventId, int noticeId, String X_SPLATHON_API_TOKEN) async {
    Object postBody;

    // verify required params are set
    if(eventId == null) {
     throw new ApiException(400, "Missing required param: eventId");
    }
    if(noticeId == null) {
     throw new ApiException(400, "Missing required param: noticeId");
    }
    if(X_SPLATHON_API_TOKEN == null) {
     throw new ApiException(400, "Missing required param: X_SPLATHON_API_TOKEN");
    }

    // create path and map variables
    String path = "/v{eventId}/notices/{noticeId}".replaceAll("{format}","json").replaceAll("{" + "eventId" + "}", eventId.toString()).replaceAll("{" + "noticeId" + "}", noticeId.toString());

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
                                             'DELETE',
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
  Future<int> getReleaseQualifier(int eventId, String X_SPLATHON_API_TOKEN) async {
    Object postBody;

    // verify required params are set
    if(eventId == null) {
     throw new ApiException(400, "Missing required param: eventId");
    }
    if(X_SPLATHON_API_TOKEN == null) {
     throw new ApiException(400, "Missing required param: X_SPLATHON_API_TOKEN");
    }

    // create path and map variables
    String path = "/v{eventId}/release-qualifier".replaceAll("{format}","json").replaceAll("{" + "eventId" + "}", eventId.toString());

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
      return apiClient.deserialize(response.body, 'int') as int;
    } else {
      return null;
    }
  }
  /// 
  ///
  /// 
  Future<ListReceptionResponse> listReception(int eventId, String X_SPLATHON_API_TOKEN) async {
    Object postBody;

    // verify required params are set
    if(eventId == null) {
     throw new ApiException(400, "Missing required param: eventId");
    }
    if(X_SPLATHON_API_TOKEN == null) {
     throw new ApiException(400, "Missing required param: X_SPLATHON_API_TOKEN");
    }

    // create path and map variables
    String path = "/v{eventId}/list-reception".replaceAll("{format}","json").replaceAll("{" + "eventId" + "}", eventId.toString());

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
      return apiClient.deserialize(response.body, 'ListReceptionResponse') as ListReceptionResponse;
    } else {
      return null;
    }
  }
  /// 
  ///
  /// Update a battle data in the match.
  Future updateBattle(int eventId, int matchId, String X_SPLATHON_API_TOKEN, Battle battle) async {
    Object postBody = battle;

    // verify required params are set
    if(eventId == null) {
     throw new ApiException(400, "Missing required param: eventId");
    }
    if(matchId == null) {
     throw new ApiException(400, "Missing required param: matchId");
    }
    if(X_SPLATHON_API_TOKEN == null) {
     throw new ApiException(400, "Missing required param: X_SPLATHON_API_TOKEN");
    }
    if(battle == null) {
     throw new ApiException(400, "Missing required param: battle");
    }

    // create path and map variables
    String path = "/v{eventId}/matches/{matchId}".replaceAll("{format}","json").replaceAll("{" + "eventId" + "}", eventId.toString()).replaceAll("{" + "matchId" + "}", matchId.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
    headerParams["X-SPLATHON-API-TOKEN"] = X_SPLATHON_API_TOKEN;

    List<String> contentTypes = ["application/json"];

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
  /// 
  Future updateMatch(int eventId, int matchId, String X_SPLATHON_API_TOKEN, NewMatchRequest newMatchRequest) async {
    Object postBody = newMatchRequest;

    // verify required params are set
    if(eventId == null) {
     throw new ApiException(400, "Missing required param: eventId");
    }
    if(matchId == null) {
     throw new ApiException(400, "Missing required param: matchId");
    }
    if(X_SPLATHON_API_TOKEN == null) {
     throw new ApiException(400, "Missing required param: X_SPLATHON_API_TOKEN");
    }
    if(newMatchRequest == null) {
     throw new ApiException(400, "Missing required param: newMatchRequest");
    }

    // create path and map variables
    String path = "/v{eventId}/matches/{matchId}".replaceAll("{format}","json").replaceAll("{" + "eventId" + "}", eventId.toString()).replaceAll("{" + "matchId" + "}", matchId.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
    headerParams["X-SPLATHON-API-TOKEN"] = X_SPLATHON_API_TOKEN;

    List<String> contentTypes = ["application/json"];

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
                                             'PUT',
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
  /// 
  Future updateReception(int eventId, String X_SPLATHON_API_TOKEN, UpdateReceptionRequest updateReceptionRequest) async {
    Object postBody = updateReceptionRequest;

    // verify required params are set
    if(eventId == null) {
     throw new ApiException(400, "Missing required param: eventId");
    }
    if(X_SPLATHON_API_TOKEN == null) {
     throw new ApiException(400, "Missing required param: X_SPLATHON_API_TOKEN");
    }
    if(updateReceptionRequest == null) {
     throw new ApiException(400, "Missing required param: updateReceptionRequest");
    }

    // create path and map variables
    String path = "/v{eventId}/update-reception".replaceAll("{format}","json").replaceAll("{" + "eventId" + "}", eventId.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
    headerParams["X-SPLATHON-API-TOKEN"] = X_SPLATHON_API_TOKEN;

    List<String> contentTypes = ["application/json"];

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
  /// 
  Future updateReleaseQualifier(int eventId, String X_SPLATHON_API_TOKEN, { UpdateReleaseQualifierRequest updateReleaseQualifierRequest }) async {
    Object postBody = updateReleaseQualifierRequest;

    // verify required params are set
    if(eventId == null) {
     throw new ApiException(400, "Missing required param: eventId");
    }
    if(X_SPLATHON_API_TOKEN == null) {
     throw new ApiException(400, "Missing required param: X_SPLATHON_API_TOKEN");
    }

    // create path and map variables
    String path = "/v{eventId}/release-qualifier".replaceAll("{format}","json").replaceAll("{" + "eventId" + "}", eventId.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
    headerParams["X-SPLATHON-API-TOKEN"] = X_SPLATHON_API_TOKEN;

    List<String> contentTypes = ["application/json"];

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
                                             'PUT',
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
  /// Insert or update notices. Update if Notice.id is specified.
  Future writeNotice(int eventId, String X_SPLATHON_API_TOKEN, Notice notice) async {
    Object postBody = notice;

    // verify required params are set
    if(eventId == null) {
     throw new ApiException(400, "Missing required param: eventId");
    }
    if(X_SPLATHON_API_TOKEN == null) {
     throw new ApiException(400, "Missing required param: X_SPLATHON_API_TOKEN");
    }
    if(notice == null) {
     throw new ApiException(400, "Missing required param: notice");
    }

    // create path and map variables
    String path = "/v{eventId}/notices".replaceAll("{format}","json").replaceAll("{" + "eventId" + "}", eventId.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
    headerParams["X-SPLATHON-API-TOKEN"] = X_SPLATHON_API_TOKEN;

    List<String> contentTypes = ["application/json"];

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
}

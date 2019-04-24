part of openapi.api;



class MatchApi {
  final ApiClient apiClient;

  MatchApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  /// 
  ///
  /// マッチの詳細を返す。スコアボードとかで使える。
  Future<Match> getMatch(int eventId, int matchId) async {
    Object postBody;

    // verify required params are set
    if(eventId == null) {
     throw new ApiException(400, "Missing required param: eventId");
    }
    if(matchId == null) {
     throw new ApiException(400, "Missing required param: matchId");
    }

    // create path and map variables
    String path = "/v{eventId}/matches/{matchId}".replaceAll("{format}","json").replaceAll("{" + "eventId" + "}", eventId.toString()).replaceAll("{" + "matchId" + "}", matchId.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};

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
      return apiClient.deserialize(response.body, 'Match') as Match;
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
}

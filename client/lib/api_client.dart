part of openapi.api;

class QueryParam {
  String name;
  String value;

  QueryParam(this.name, this.value);
}

class ApiClient {

  String basePath;
  var client = Client();

  Map<String, String> _defaultHeaderMap = {};
  Map<String, Authentication> _authentications = {};

  final _regList = RegExp(r'^List<(.*)>$');
  final _regMap = RegExp(r'^Map<String,(.*)>$');

  ApiClient({this.basePath: "https://splathon-api.appspot.com/splathon"}) {
    // Setup authentications (key: authentication name, value: authentication).
  }

  void addDefaultHeader(String key, String value) {
     _defaultHeaderMap[key] = value;
  }

  dynamic _deserialize(dynamic value, String targetType) {
    try {
      switch (targetType) {
        case 'String':
          return '$value';
        case 'int':
          return value is int ? value : int.parse('$value');
        case 'bool':
          return value is bool ? value : '$value'.toLowerCase() == 'true';
        case 'double':
          return value is double ? value : double.parse('$value');
        case 'AddTournamentRoundRequest':
          return AddTournamentRoundRequest.fromJson(value);
        case 'Battle':
          return Battle.fromJson(value);
        case 'Error':
          return Error.fromJson(value);
        case 'Event':
          return Event.fromJson(value);
        case 'GetNextMatchResponse':
          return GetNextMatchResponse.fromJson(value);
        case 'ListNoticesResponse':
          return ListNoticesResponse.fromJson(value);
        case 'ListReceptionResponse':
          return ListReceptionResponse.fromJson(value);
        case 'LoginRequest':
          return LoginRequest.fromJson(value);
        case 'LoginResponse':
          return LoginResponse.fromJson(value);
        case 'Match':
          return Match.fromJson(value);
        case 'Member':
          return Member.fromJson(value);
        case 'MemberDetail':
          return MemberDetail.fromJson(value);
        case 'NewMatchRequest':
          return NewMatchRequest.fromJson(value);
        case 'NextMatch':
          return NextMatch.fromJson(value);
        case 'NextMatchRoom':
          return NextMatchRoom.fromJson(value);
        case 'Notice':
          return Notice.fromJson(value);
        case 'ParticipantReception':
          return ParticipantReception.fromJson(value);
        case 'Rank':
          return Rank.fromJson(value);
        case 'Ranking':
          return Ranking.fromJson(value);
        case 'Reception':
          return Reception.fromJson(value);
        case 'ReceptionCode':
          return ReceptionCode.fromJson(value);
        case 'ReceptionPartcipantsDataResponse':
          return ReceptionPartcipantsDataResponse.fromJson(value);
        case 'ReceptionResponse':
          return ReceptionResponse.fromJson(value);
        case 'Results':
          return Results.fromJson(value);
        case 'Room':
          return Room.fromJson(value);
        case 'Round':
          return Round.fromJson(value);
        case 'Rule':
          return Rule.fromJson(value);
        case 'Schedule':
          return Schedule.fromJson(value);
        case 'ScheduleEntry':
          return ScheduleEntry.fromJson(value);
        case 'Stage':
          return Stage.fromJson(value);
        case 'SupportedRoom':
          return SupportedRoom.fromJson(value);
        case 'Team':
          return Team.fromJson(value);
        case 'Teams':
          return Teams.fromJson(value);
        case 'UpdateReceptionRequest':
          return UpdateReceptionRequest.fromJson(value);
        case 'UpdateReleaseQualifierRequest':
          return UpdateReleaseQualifierRequest.fromJson(value);
        default:
          {
            Core.Match match;
            if (value is List &&
                (match = _regList.firstMatch(targetType)) != null) {
              var newTargetType = match[1];
              return value.map((v) => _deserialize(v, newTargetType)).toList();
            } else if (value is Map &&
                (match = _regMap.firstMatch(targetType)) != null) {
              var newTargetType = match[1];
              return Map.fromIterables(value.keys,
                  value.values.map((v) => _deserialize(v, newTargetType)));
            }
          }
      }
    } on Exception catch (e, stack) {
      throw ApiException.withInner(500, 'Exception during deserialization.', e, stack);
    }
    throw ApiException(500, 'Could not find a suitable class for deserialization');
  }

  dynamic deserialize(String json, String targetType) {
    // Remove all spaces.  Necessary for reg expressions as well.
    targetType = targetType.replaceAll(' ', '');

    if (targetType == 'String') return json;

    var decodedJson = jsonDecode(json);
    return _deserialize(decodedJson, targetType);
  }

  String serialize(Object obj) {
    String serialized = '';
    if (obj == null) {
      serialized = '';
    } else {
      serialized = json.encode(obj);
    }
    return serialized;
  }

  // We don't use a Map<String, String> for queryParams.
  // If collectionFormat is 'multi' a key might appear multiple times.
  Future<Response> invokeAPI(String path,
                             String method,
                             Iterable<QueryParam> queryParams,
                             Object body,
                             Map<String, String> headerParams,
                             Map<String, String> formParams,
                             String contentType,
                             List<String> authNames) async {

    _updateParamsForAuth(authNames, queryParams, headerParams);

    var ps = queryParams.where((p) => p.value != null).map((p) => '${p.name}=${p.value}');
    String queryString = ps.isNotEmpty ?
                         '?' + ps.join('&') :
                         '';

    String url = basePath + path + queryString;

    headerParams.addAll(_defaultHeaderMap);
    headerParams['Content-Type'] = contentType;

    if(body is MultipartRequest) {
      var request = MultipartRequest(method, Uri.parse(url));
      request.fields.addAll(body.fields);
      request.files.addAll(body.files);
      request.headers.addAll(body.headers);
      request.headers.addAll(headerParams);
      var response = await client.send(request);
      return Response.fromStream(response);
    } else {
      var msgBody = contentType == "application/x-www-form-urlencoded" ? formParams : serialize(body);
      switch(method) {
        case "POST":
          return client.post(url, headers: headerParams, body: msgBody);
        case "PUT":
          return client.put(url, headers: headerParams, body: msgBody);
        case "DELETE":
          return client.delete(url, headers: headerParams);
        case "PATCH":
          return client.patch(url, headers: headerParams, body: msgBody);
        default:
          return client.get(url, headers: headerParams);
      }
    }
  }

  /// Update query and header parameters based on authentication settings.
  /// @param authNames The authentications to apply
  void _updateParamsForAuth(List<String> authNames, List<QueryParam> queryParams, Map<String, String> headerParams) {
    authNames.forEach((authName) {
      Authentication auth = _authentications[authName];
      if (auth == null) throw ArgumentError("Authentication undefined: " + authName);
      auth.applyToParams(queryParams, headerParams);
    });
  }

  void setAccessToken(String accessToken) {
    _authentications.forEach((key, auth) {
      if (auth is OAuth) {
        auth.setAccessToken(accessToken);
      }
    });
  }
}

# openapi.api.MatchApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://splathon-api-dev.appspot.com/splathon*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getMatch**](MatchApi.md#getmatch) | **GET** /{eventId}/matches/{matchId} | 
[**getNextMatch**](MatchApi.md#getnextmatch) | **GET** /{eventId}/next-match | 
[**updateBattle**](MatchApi.md#updatebattle) | **POST** /{eventId}/matches/{matchId} | 


# **getMatch**
> Match getMatch(eventId, matchId)



マッチの詳細を返す。スコアボードとかで使える。

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = MatchApi();
final eventId = eventId_example; // String | 
final matchId = 789; // int | match id

try {
    final result = api_instance.getMatch(eventId, matchId);
    print(result);
} catch (e) {
    print('Exception when calling MatchApi->getMatch: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **String**|  | 
 **matchId** | **int**| match id | 

### Return type

[**Match**](Match.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getNextMatch**
> GetNextMatchResponse getNextMatch(eventId, X_SPLATHON_API_TOKEN, teamId)



次の試合を返す。team_id を指定した場合そのチームの、なければログインしている参加者のチームの 次のマッチをあれば返す。 team_idを指定せず参加者がチームに属して無い場合などはエラー。

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = MatchApi();
final eventId = eventId_example; // String | 
final X_SPLATHON_API_TOKEN = X_SPLATHON_API_TOKEN_example; // String | 
final teamId = 789; // int | team id

try {
    final result = api_instance.getNextMatch(eventId, X_SPLATHON_API_TOKEN, teamId);
    print(result);
} catch (e) {
    print('Exception when calling MatchApi->getNextMatch: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **String**|  | 
 **X_SPLATHON_API_TOKEN** | **String**|  | 
 **teamId** | **int**| team id | [optional] 

### Return type

[**GetNextMatchResponse**](GetNextMatchResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateBattle**
> updateBattle(eventId, matchId, X_SPLATHON_API_TOKEN, battle)



Update a battle data in the match.

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = MatchApi();
final eventId = eventId_example; // String | 
final matchId = 789; // int | match id
final X_SPLATHON_API_TOKEN = X_SPLATHON_API_TOKEN_example; // String | 
final battle = Battle(); // Battle | 

try {
    api_instance.updateBattle(eventId, matchId, X_SPLATHON_API_TOKEN, battle);
} catch (e) {
    print('Exception when calling MatchApi->updateBattle: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **String**|  | 
 **matchId** | **int**| match id | 
 **X_SPLATHON_API_TOKEN** | **String**|  | 
 **battle** | [**Battle**](Battle.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


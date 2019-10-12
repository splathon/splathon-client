# openapi.api.AdminApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://splathon-api-us.appspot.com/splathon*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addTournamentRound**](AdminApi.md#addTournamentRound) | **POST** /v{eventId}/tournament/ | 
[**completeReception**](AdminApi.md#completeReception) | **POST** /v{eventId}/reception/{splathonReceptionCode}/complete | 
[**createNewQualifier**](AdminApi.md#createNewQualifier) | **POST** /v{eventId}/qualifier | 
[**deleteNotice**](AdminApi.md#deleteNotice) | **DELETE** /v{eventId}/notices/{noticeId} | 
[**getParticipantsDataForReception**](AdminApi.md#getParticipantsDataForReception) | **GET** /v{eventId}/reception/{splathonReceptionCode} | 
[**getReleaseQualifier**](AdminApi.md#getReleaseQualifier) | **GET** /v{eventId}/release-qualifier | 
[**listReception**](AdminApi.md#listReception) | **GET** /v{eventId}/list-reception | 
[**updateBattle**](AdminApi.md#updateBattle) | **POST** /v{eventId}/matches/{matchId} | 
[**updateMatch**](AdminApi.md#updateMatch) | **PUT** /v{eventId}/matches/{matchId} | 
[**updateReception**](AdminApi.md#updateReception) | **POST** /v{eventId}/update-reception | 
[**updateReleaseQualifier**](AdminApi.md#updateReleaseQualifier) | **PUT** /v{eventId}/release-qualifier | 
[**writeNotice**](AdminApi.md#writeNotice) | **POST** /v{eventId}/notices | 


# **addTournamentRound**
> addTournamentRound(eventId, X_SPLATHON_API_TOKEN, addTournamentRoundRequest)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new AdminApi();
var eventId = 789; // int | 
var X_SPLATHON_API_TOKEN = X_SPLATHON_API_TOKEN_example; // String | 
var addTournamentRoundRequest = new AddTournamentRoundRequest(); // AddTournamentRoundRequest | 

try { 
    api_instance.addTournamentRound(eventId, X_SPLATHON_API_TOKEN, addTournamentRoundRequest);
} catch (e) {
    print("Exception when calling AdminApi->addTournamentRound: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **int**|  | [default to null]
 **X_SPLATHON_API_TOKEN** | **String**|  | [default to null]
 **addTournamentRoundRequest** | [**AddTournamentRoundRequest**](AddTournamentRoundRequest.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **completeReception**
> completeReception(eventId, splathonReceptionCode, X_SPLATHON_API_TOKEN)



参加登録API

### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new AdminApi();
var eventId = 789; // int | 
var splathonReceptionCode = splathonReceptionCode_example; // String | ReceptionResponse.splathon.code と同じもの(たぶん内部SlackID).
var X_SPLATHON_API_TOKEN = X_SPLATHON_API_TOKEN_example; // String | 

try { 
    api_instance.completeReception(eventId, splathonReceptionCode, X_SPLATHON_API_TOKEN);
} catch (e) {
    print("Exception when calling AdminApi->completeReception: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **int**|  | [default to null]
 **splathonReceptionCode** | **String**| ReceptionResponse.splathon.code と同じもの(たぶん内部SlackID). | [default to null]
 **X_SPLATHON_API_TOKEN** | **String**|  | [default to null]

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createNewQualifier**
> createNewQualifier(eventId, X_SPLATHON_API_TOKEN)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new AdminApi();
var eventId = 789; // int | 
var X_SPLATHON_API_TOKEN = X_SPLATHON_API_TOKEN_example; // String | 

try { 
    api_instance.createNewQualifier(eventId, X_SPLATHON_API_TOKEN);
} catch (e) {
    print("Exception when calling AdminApi->createNewQualifier: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **int**|  | [default to null]
 **X_SPLATHON_API_TOKEN** | **String**|  | [default to null]

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteNotice**
> deleteNotice(eventId, noticeId, X_SPLATHON_API_TOKEN)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new AdminApi();
var eventId = 789; // int | 
var noticeId = 789; // int | 
var X_SPLATHON_API_TOKEN = X_SPLATHON_API_TOKEN_example; // String | 

try { 
    api_instance.deleteNotice(eventId, noticeId, X_SPLATHON_API_TOKEN);
} catch (e) {
    print("Exception when calling AdminApi->deleteNotice: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **int**|  | [default to null]
 **noticeId** | **int**|  | [default to null]
 **X_SPLATHON_API_TOKEN** | **String**|  | [default to null]

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getParticipantsDataForReception**
> ReceptionPartcipantsDataResponse getParticipantsDataForReception(eventId, splathonReceptionCode, X_SPLATHON_API_TOKEN)



参加者情報取得API

### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new AdminApi();
var eventId = 789; // int | 
var splathonReceptionCode = splathonReceptionCode_example; // String | ReceptionResponse.splathon.code と同じもの(たぶん内部SlackID).
var X_SPLATHON_API_TOKEN = X_SPLATHON_API_TOKEN_example; // String | 

try { 
    var result = api_instance.getParticipantsDataForReception(eventId, splathonReceptionCode, X_SPLATHON_API_TOKEN);
    print(result);
} catch (e) {
    print("Exception when calling AdminApi->getParticipantsDataForReception: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **int**|  | [default to null]
 **splathonReceptionCode** | **String**| ReceptionResponse.splathon.code と同じもの(たぶん内部SlackID). | [default to null]
 **X_SPLATHON_API_TOKEN** | **String**|  | [default to null]

### Return type

[**ReceptionPartcipantsDataResponse**](ReceptionPartcipantsDataResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getReleaseQualifier**
> int getReleaseQualifier(eventId, X_SPLATHON_API_TOKEN)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new AdminApi();
var eventId = 789; // int | 
var X_SPLATHON_API_TOKEN = X_SPLATHON_API_TOKEN_example; // String | 

try { 
    var result = api_instance.getReleaseQualifier(eventId, X_SPLATHON_API_TOKEN);
    print(result);
} catch (e) {
    print("Exception when calling AdminApi->getReleaseQualifier: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **int**|  | [default to null]
 **X_SPLATHON_API_TOKEN** | **String**|  | [default to null]

### Return type

**int**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listReception**
> ListReceptionResponse listReception(eventId, X_SPLATHON_API_TOKEN)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new AdminApi();
var eventId = 789; // int | 
var X_SPLATHON_API_TOKEN = X_SPLATHON_API_TOKEN_example; // String | 

try { 
    var result = api_instance.listReception(eventId, X_SPLATHON_API_TOKEN);
    print(result);
} catch (e) {
    print("Exception when calling AdminApi->listReception: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **int**|  | [default to null]
 **X_SPLATHON_API_TOKEN** | **String**|  | [default to null]

### Return type

[**ListReceptionResponse**](ListReceptionResponse.md)

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

var api_instance = new AdminApi();
var eventId = 789; // int | 
var matchId = 789; // int | match id
var X_SPLATHON_API_TOKEN = X_SPLATHON_API_TOKEN_example; // String | 
var battle = new Battle(); // Battle | 

try { 
    api_instance.updateBattle(eventId, matchId, X_SPLATHON_API_TOKEN, battle);
} catch (e) {
    print("Exception when calling AdminApi->updateBattle: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **int**|  | [default to null]
 **matchId** | **int**| match id | [default to null]
 **X_SPLATHON_API_TOKEN** | **String**|  | [default to null]
 **battle** | [**Battle**](Battle.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateMatch**
> updateMatch(eventId, matchId, X_SPLATHON_API_TOKEN, newMatchRequest)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new AdminApi();
var eventId = 789; // int | 
var matchId = 789; // int | match id
var X_SPLATHON_API_TOKEN = X_SPLATHON_API_TOKEN_example; // String | 
var newMatchRequest = new NewMatchRequest(); // NewMatchRequest | 

try { 
    api_instance.updateMatch(eventId, matchId, X_SPLATHON_API_TOKEN, newMatchRequest);
} catch (e) {
    print("Exception when calling AdminApi->updateMatch: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **int**|  | [default to null]
 **matchId** | **int**| match id | [default to null]
 **X_SPLATHON_API_TOKEN** | **String**|  | [default to null]
 **newMatchRequest** | [**NewMatchRequest**](NewMatchRequest.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateReception**
> updateReception(eventId, X_SPLATHON_API_TOKEN, updateReceptionRequest)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new AdminApi();
var eventId = 789; // int | 
var X_SPLATHON_API_TOKEN = X_SPLATHON_API_TOKEN_example; // String | 
var updateReceptionRequest = new UpdateReceptionRequest(); // UpdateReceptionRequest | 

try { 
    api_instance.updateReception(eventId, X_SPLATHON_API_TOKEN, updateReceptionRequest);
} catch (e) {
    print("Exception when calling AdminApi->updateReception: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **int**|  | [default to null]
 **X_SPLATHON_API_TOKEN** | **String**|  | [default to null]
 **updateReceptionRequest** | [**UpdateReceptionRequest**](UpdateReceptionRequest.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateReleaseQualifier**
> updateReleaseQualifier(eventId, X_SPLATHON_API_TOKEN, updateReleaseQualifierRequest)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new AdminApi();
var eventId = 789; // int | 
var X_SPLATHON_API_TOKEN = X_SPLATHON_API_TOKEN_example; // String | 
var updateReleaseQualifierRequest = new UpdateReleaseQualifierRequest(); // UpdateReleaseQualifierRequest | 

try { 
    api_instance.updateReleaseQualifier(eventId, X_SPLATHON_API_TOKEN, updateReleaseQualifierRequest);
} catch (e) {
    print("Exception when calling AdminApi->updateReleaseQualifier: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **int**|  | [default to null]
 **X_SPLATHON_API_TOKEN** | **String**|  | [default to null]
 **updateReleaseQualifierRequest** | [**UpdateReleaseQualifierRequest**](UpdateReleaseQualifierRequest.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **writeNotice**
> writeNotice(eventId, X_SPLATHON_API_TOKEN, notice)



Insert or update notices. Update if Notice.id is specified.

### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new AdminApi();
var eventId = 789; // int | 
var X_SPLATHON_API_TOKEN = X_SPLATHON_API_TOKEN_example; // String | 
var notice = new Notice(); // Notice | 

try { 
    api_instance.writeNotice(eventId, X_SPLATHON_API_TOKEN, notice);
} catch (e) {
    print("Exception when calling AdminApi->writeNotice: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **int**|  | [default to null]
 **X_SPLATHON_API_TOKEN** | **String**|  | [default to null]
 **notice** | [**Notice**](Notice.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


# openapi.api.AdminApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://splathon-api-dev.appspot.com/splathon*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addTournamentRound**](AdminApi.md#addtournamentround) | **POST** /{eventId}/tournament/ | 
[**completeReception**](AdminApi.md#completereception) | **POST** /{eventId}/reception/{splathonReceptionCode}/complete | 
[**createEvent**](AdminApi.md#createevent) | **POST** /create-event | 
[**createNewQualifier**](AdminApi.md#createnewqualifier) | **POST** /{eventId}/qualifier | 
[**deleteEvent**](AdminApi.md#deleteevent) | **DELETE** /{eventId}/event | 
[**deleteNotice**](AdminApi.md#deletenotice) | **DELETE** /{eventId}/notices/{noticeId} | 
[**deleteQualifier**](AdminApi.md#deletequalifier) | **POST** /{eventId}/delete-qualifier | 
[**getParticipantsDataForReception**](AdminApi.md#getparticipantsdataforreception) | **GET** /{eventId}/reception/{splathonReceptionCode} | 
[**getReleaseQualifier**](AdminApi.md#getreleasequalifier) | **GET** /{eventId}/release-qualifier | 
[**listReception**](AdminApi.md#listreception) | **GET** /{eventId}/list-reception | 
[**updateBattle**](AdminApi.md#updatebattle) | **POST** /{eventId}/matches/{matchId} | 
[**updateEvent**](AdminApi.md#updateevent) | **PUT** /{eventId}/event | 
[**updateMatch**](AdminApi.md#updatematch) | **PUT** /{eventId}/matches/{matchId} | 
[**updateReception**](AdminApi.md#updatereception) | **POST** /{eventId}/update-reception | 
[**updateReleaseQualifier**](AdminApi.md#updatereleasequalifier) | **PUT** /{eventId}/release-qualifier | 
[**updateSchedule**](AdminApi.md#updateschedule) | **PUT** /{eventId}/schedule | 
[**writeNotice**](AdminApi.md#writenotice) | **POST** /{eventId}/notices | 


# **addTournamentRound**
> addTournamentRound(eventId, X_SPLATHON_API_TOKEN, request)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = AdminApi();
final eventId = eventId_example; // String | 
final X_SPLATHON_API_TOKEN = X_SPLATHON_API_TOKEN_example; // String | 
final request = AddTournamentRoundRequest(); // AddTournamentRoundRequest | 

try {
    api_instance.addTournamentRound(eventId, X_SPLATHON_API_TOKEN, request);
} catch (e) {
    print('Exception when calling AdminApi->addTournamentRound: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **String**|  | 
 **X_SPLATHON_API_TOKEN** | **String**|  | 
 **request** | [**AddTournamentRoundRequest**](AddTournamentRoundRequest.md)|  | 

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

final api_instance = AdminApi();
final eventId = eventId_example; // String | 
final splathonReceptionCode = splathonReceptionCode_example; // String | ReceptionResponse.splathon.code と同じもの(たぶん内部SlackID).
final X_SPLATHON_API_TOKEN = X_SPLATHON_API_TOKEN_example; // String | 

try {
    api_instance.completeReception(eventId, splathonReceptionCode, X_SPLATHON_API_TOKEN);
} catch (e) {
    print('Exception when calling AdminApi->completeReception: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **String**|  | 
 **splathonReceptionCode** | **String**| ReceptionResponse.splathon.code と同じもの(たぶん内部SlackID). | 
 **X_SPLATHON_API_TOKEN** | **String**|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createEvent**
> createEvent(X_SPLATHON_API_TOKEN, request)



Create event data

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = AdminApi();
final X_SPLATHON_API_TOKEN = X_SPLATHON_API_TOKEN_example; // String | 
final request = Event(); // Event | 

try {
    api_instance.createEvent(X_SPLATHON_API_TOKEN, request);
} catch (e) {
    print('Exception when calling AdminApi->createEvent: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **X_SPLATHON_API_TOKEN** | **String**|  | 
 **request** | [**Event**](Event.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createNewQualifier**
> createNewQualifier(eventId, X_SPLATHON_API_TOKEN)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = AdminApi();
final eventId = eventId_example; // String | 
final X_SPLATHON_API_TOKEN = X_SPLATHON_API_TOKEN_example; // String | 

try {
    api_instance.createNewQualifier(eventId, X_SPLATHON_API_TOKEN);
} catch (e) {
    print('Exception when calling AdminApi->createNewQualifier: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **String**|  | 
 **X_SPLATHON_API_TOKEN** | **String**|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteEvent**
> deleteEvent(eventId, X_SPLATHON_API_TOKEN)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = AdminApi();
final eventId = eventId_example; // String | 
final X_SPLATHON_API_TOKEN = X_SPLATHON_API_TOKEN_example; // String | 

try {
    api_instance.deleteEvent(eventId, X_SPLATHON_API_TOKEN);
} catch (e) {
    print('Exception when calling AdminApi->deleteEvent: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **String**|  | 
 **X_SPLATHON_API_TOKEN** | **String**|  | 

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

final api_instance = AdminApi();
final eventId = eventId_example; // String | 
final noticeId = 789; // int | 
final X_SPLATHON_API_TOKEN = X_SPLATHON_API_TOKEN_example; // String | 

try {
    api_instance.deleteNotice(eventId, noticeId, X_SPLATHON_API_TOKEN);
} catch (e) {
    print('Exception when calling AdminApi->deleteNotice: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **String**|  | 
 **noticeId** | **int**|  | 
 **X_SPLATHON_API_TOKEN** | **String**|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteQualifier**
> deleteQualifier(eventId, X_SPLATHON_API_TOKEN, request)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = AdminApi();
final eventId = eventId_example; // String | 
final X_SPLATHON_API_TOKEN = X_SPLATHON_API_TOKEN_example; // String | 
final request = DeleteQualifierRequest(); // DeleteQualifierRequest | 

try {
    api_instance.deleteQualifier(eventId, X_SPLATHON_API_TOKEN, request);
} catch (e) {
    print('Exception when calling AdminApi->deleteQualifier: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **String**|  | 
 **X_SPLATHON_API_TOKEN** | **String**|  | 
 **request** | [**DeleteQualifierRequest**](DeleteQualifierRequest.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getParticipantsDataForReception**
> ReceptionPartcipantsDataResponse getParticipantsDataForReception(eventId, splathonReceptionCode, X_SPLATHON_API_TOKEN)



参加者情報取得API

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = AdminApi();
final eventId = eventId_example; // String | 
final splathonReceptionCode = splathonReceptionCode_example; // String | ReceptionResponse.splathon.code と同じもの(たぶん内部SlackID).
final X_SPLATHON_API_TOKEN = X_SPLATHON_API_TOKEN_example; // String | 

try {
    final result = api_instance.getParticipantsDataForReception(eventId, splathonReceptionCode, X_SPLATHON_API_TOKEN);
    print(result);
} catch (e) {
    print('Exception when calling AdminApi->getParticipantsDataForReception: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **String**|  | 
 **splathonReceptionCode** | **String**| ReceptionResponse.splathon.code と同じもの(たぶん内部SlackID). | 
 **X_SPLATHON_API_TOKEN** | **String**|  | 

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

final api_instance = AdminApi();
final eventId = eventId_example; // String | 
final X_SPLATHON_API_TOKEN = X_SPLATHON_API_TOKEN_example; // String | 

try {
    final result = api_instance.getReleaseQualifier(eventId, X_SPLATHON_API_TOKEN);
    print(result);
} catch (e) {
    print('Exception when calling AdminApi->getReleaseQualifier: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **String**|  | 
 **X_SPLATHON_API_TOKEN** | **String**|  | 

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

final api_instance = AdminApi();
final eventId = eventId_example; // String | 
final X_SPLATHON_API_TOKEN = X_SPLATHON_API_TOKEN_example; // String | 

try {
    final result = api_instance.listReception(eventId, X_SPLATHON_API_TOKEN);
    print(result);
} catch (e) {
    print('Exception when calling AdminApi->listReception: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **String**|  | 
 **X_SPLATHON_API_TOKEN** | **String**|  | 

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

final api_instance = AdminApi();
final eventId = eventId_example; // String | 
final matchId = 789; // int | match id
final X_SPLATHON_API_TOKEN = X_SPLATHON_API_TOKEN_example; // String | 
final battle = Battle(); // Battle | 

try {
    api_instance.updateBattle(eventId, matchId, X_SPLATHON_API_TOKEN, battle);
} catch (e) {
    print('Exception when calling AdminApi->updateBattle: $e\n');
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

# **updateEvent**
> updateEvent(eventId, X_SPLATHON_API_TOKEN, request)



Update event data

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = AdminApi();
final eventId = eventId_example; // String | 
final X_SPLATHON_API_TOKEN = X_SPLATHON_API_TOKEN_example; // String | 
final request = Event(); // Event | 

try {
    api_instance.updateEvent(eventId, X_SPLATHON_API_TOKEN, request);
} catch (e) {
    print('Exception when calling AdminApi->updateEvent: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **String**|  | 
 **X_SPLATHON_API_TOKEN** | **String**|  | 
 **request** | [**Event**](Event.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateMatch**
> updateMatch(eventId, matchId, X_SPLATHON_API_TOKEN, match)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = AdminApi();
final eventId = eventId_example; // String | 
final matchId = 789; // int | match id
final X_SPLATHON_API_TOKEN = X_SPLATHON_API_TOKEN_example; // String | 
final match = NewMatchRequest(); // NewMatchRequest | 

try {
    api_instance.updateMatch(eventId, matchId, X_SPLATHON_API_TOKEN, match);
} catch (e) {
    print('Exception when calling AdminApi->updateMatch: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **String**|  | 
 **matchId** | **int**| match id | 
 **X_SPLATHON_API_TOKEN** | **String**|  | 
 **match** | [**NewMatchRequest**](NewMatchRequest.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateReception**
> updateReception(eventId, X_SPLATHON_API_TOKEN, request)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = AdminApi();
final eventId = eventId_example; // String | 
final X_SPLATHON_API_TOKEN = X_SPLATHON_API_TOKEN_example; // String | 
final request = UpdateReceptionRequest(); // UpdateReceptionRequest | 

try {
    api_instance.updateReception(eventId, X_SPLATHON_API_TOKEN, request);
} catch (e) {
    print('Exception when calling AdminApi->updateReception: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **String**|  | 
 **X_SPLATHON_API_TOKEN** | **String**|  | 
 **request** | [**UpdateReceptionRequest**](UpdateReceptionRequest.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateReleaseQualifier**
> updateReleaseQualifier(eventId, X_SPLATHON_API_TOKEN, request)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = AdminApi();
final eventId = eventId_example; // String | 
final X_SPLATHON_API_TOKEN = X_SPLATHON_API_TOKEN_example; // String | 
final request = UpdateReleaseQualifierRequest(); // UpdateReleaseQualifierRequest | 

try {
    api_instance.updateReleaseQualifier(eventId, X_SPLATHON_API_TOKEN, request);
} catch (e) {
    print('Exception when calling AdminApi->updateReleaseQualifier: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **String**|  | 
 **X_SPLATHON_API_TOKEN** | **String**|  | 
 **request** | [**UpdateReleaseQualifierRequest**](UpdateReleaseQualifierRequest.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateSchedule**
> updateSchedule(eventId, X_SPLATHON_API_TOKEN, request)



Update event schedule data

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = AdminApi();
final eventId = eventId_example; // String | 
final X_SPLATHON_API_TOKEN = X_SPLATHON_API_TOKEN_example; // String | 
final request = Schedule(); // Schedule | 

try {
    api_instance.updateSchedule(eventId, X_SPLATHON_API_TOKEN, request);
} catch (e) {
    print('Exception when calling AdminApi->updateSchedule: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **String**|  | 
 **X_SPLATHON_API_TOKEN** | **String**|  | 
 **request** | [**Schedule**](Schedule.md)|  | 

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

final api_instance = AdminApi();
final eventId = eventId_example; // String | 
final X_SPLATHON_API_TOKEN = X_SPLATHON_API_TOKEN_example; // String | 
final notice = Notice(); // Notice | 

try {
    api_instance.writeNotice(eventId, X_SPLATHON_API_TOKEN, notice);
} catch (e) {
    print('Exception when calling AdminApi->writeNotice: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **String**|  | 
 **X_SPLATHON_API_TOKEN** | **String**|  | 
 **notice** | [**Notice**](Notice.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


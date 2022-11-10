# openapi.api.DefaultApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://splathon-api-dev.appspot.com/splathon*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getEvent**](DefaultApi.md#getevent) | **GET** /{eventId}/event | 
[**getSchedule**](DefaultApi.md#getschedule) | **GET** /{eventId}/schedule | 
[**getTeamDetail**](DefaultApi.md#getteamdetail) | **GET** /{eventId}/teams/{team_id} | 
[**listEvents**](DefaultApi.md#listevents) | **GET** /events | 
[**listNotices**](DefaultApi.md#listnotices) | **GET** /{eventId}/notices | 
[**listTeams**](DefaultApi.md#listteams) | **GET** /{eventId}/teams | 
[**login**](DefaultApi.md#login) | **POST** /{eventId}/login | 


# **getEvent**
> Event getEvent(eventId)



Return event data

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = DefaultApi();
final eventId = eventId_example; // String | 

try {
    final result = api_instance.getEvent(eventId);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->getEvent: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **String**|  | 

### Return type

[**Event**](Event.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getSchedule**
> Schedule getSchedule(eventId)



Return event schedule data

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = DefaultApi();
final eventId = eventId_example; // String | 

try {
    final result = api_instance.getSchedule(eventId);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->getSchedule: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **String**|  | 

### Return type

[**Schedule**](Schedule.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getTeamDetail**
> Team getTeamDetail(eventId, teamId)



Return detail team data

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = DefaultApi();
final eventId = eventId_example; // String | 
final teamId = 789; // int | team id

try {
    final result = api_instance.getTeamDetail(eventId, teamId);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->getTeamDetail: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **String**|  | 
 **teamId** | **int**| team id | 

### Return type

[**Team**](Team.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listEvents**
> Events listEvents()



Return event list data

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = DefaultApi();

try {
    final result = api_instance.listEvents();
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->listEvents: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**Events**](Events.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listNotices**
> ListNoticesResponse listNotices(eventId, X_SPLATHON_API_TOKEN)



Return notices

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = DefaultApi();
final eventId = eventId_example; // String | 
final X_SPLATHON_API_TOKEN = X_SPLATHON_API_TOKEN_example; // String | 

try {
    final result = api_instance.listNotices(eventId, X_SPLATHON_API_TOKEN);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->listNotices: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **String**|  | 
 **X_SPLATHON_API_TOKEN** | **String**|  | 

### Return type

[**ListNoticesResponse**](ListNoticesResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listTeams**
> Teams listTeams(eventId)



Return team list

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = DefaultApi();
final eventId = eventId_example; // String | 

try {
    final result = api_instance.listTeams(eventId);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->listTeams: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **String**|  | 

### Return type

[**Teams**](Teams.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **login**
> LoginResponse login(eventId, request)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = DefaultApi();
final eventId = eventId_example; // String | 
final request = LoginRequest(); // LoginRequest | 

try {
    final result = api_instance.login(eventId, request);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->login: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **String**|  | 
 **request** | [**LoginRequest**](LoginRequest.md)|  | 

### Return type

[**LoginResponse**](LoginResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


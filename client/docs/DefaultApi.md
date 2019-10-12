# openapi.api.DefaultApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://splathon-api-us.appspot.com/splathon*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getEvent**](DefaultApi.md#getEvent) | **GET** /v{eventId}/event | 
[**getSchedule**](DefaultApi.md#getSchedule) | **GET** /v{eventId}/schedule | 
[**getTeamDetail**](DefaultApi.md#getTeamDetail) | **GET** /v{eventId}/teams/{team_id} | 
[**listNotices**](DefaultApi.md#listNotices) | **GET** /v{eventId}/notices | 
[**listTeams**](DefaultApi.md#listTeams) | **GET** /v{eventId}/teams | 
[**login**](DefaultApi.md#login) | **POST** /v{eventId}/login | 


# **getEvent**
> Event getEvent(eventId)



Return event data

### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new DefaultApi();
var eventId = 789; // int | 

try { 
    var result = api_instance.getEvent(eventId);
    print(result);
} catch (e) {
    print("Exception when calling DefaultApi->getEvent: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **int**|  | [default to null]

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

var api_instance = new DefaultApi();
var eventId = 789; // int | 

try { 
    var result = api_instance.getSchedule(eventId);
    print(result);
} catch (e) {
    print("Exception when calling DefaultApi->getSchedule: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **int**|  | [default to null]

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

var api_instance = new DefaultApi();
var eventId = 789; // int | 
var teamId = 789; // int | team id

try { 
    var result = api_instance.getTeamDetail(eventId, teamId);
    print(result);
} catch (e) {
    print("Exception when calling DefaultApi->getTeamDetail: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **int**|  | [default to null]
 **teamId** | **int**| team id | [default to null]

### Return type

[**Team**](Team.md)

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

var api_instance = new DefaultApi();
var eventId = 789; // int | 
var X_SPLATHON_API_TOKEN = X_SPLATHON_API_TOKEN_example; // String | 

try { 
    var result = api_instance.listNotices(eventId, X_SPLATHON_API_TOKEN);
    print(result);
} catch (e) {
    print("Exception when calling DefaultApi->listNotices: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **int**|  | [default to null]
 **X_SPLATHON_API_TOKEN** | **String**|  | [default to null]

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

var api_instance = new DefaultApi();
var eventId = 789; // int | 

try { 
    var result = api_instance.listTeams(eventId);
    print(result);
} catch (e) {
    print("Exception when calling DefaultApi->listTeams: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **int**|  | [default to null]

### Return type

[**Teams**](Teams.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **login**
> LoginResponse login(eventId, loginRequest)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new DefaultApi();
var eventId = 789; // int | 
var loginRequest = new LoginRequest(); // LoginRequest | 

try { 
    var result = api_instance.login(eventId, loginRequest);
    print(result);
} catch (e) {
    print("Exception when calling DefaultApi->login: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **int**|  | [default to null]
 **loginRequest** | [**LoginRequest**](LoginRequest.md)|  | 

### Return type

[**LoginResponse**](LoginResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


# openapi.api.AdminApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://splathon-api.appspot.com/splathon*

Method | HTTP request | Description
------------- | ------------- | -------------
[**updateBattle**](AdminApi.md#updateBattle) | **POST** /v{eventId}/matches/{matchId} | 


# **updateBattle**
> updateBattle(eventId, matchId, battle)



Update a battle data in the match.

### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new AdminApi();
var eventId = 789; // int | 
var matchId = 789; // int | match id
var battle = new Battle(); // Battle | 

try { 
    api_instance.updateBattle(eventId, matchId, battle);
} catch (e) {
    print("Exception when calling AdminApi->updateBattle: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **int**|  | [default to null]
 **matchId** | **int**| match id | [default to null]
 **battle** | [**Battle**](Battle.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


# openapi.api.DefaultApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://localhost/splathon*

Method | HTTP request | Description
------------- | ------------- | -------------
[**listTeams**](DefaultApi.md#listTeams) | **GET** /v{eventId}/teams | 


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


# openapi.api.MatchApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://localhost/splathon*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getMatch**](MatchApi.md#getMatch) | **GET** /v{eventId}/matches/{matchId} | 


# **getMatch**
> Match getMatch(eventId, matchId)



マッチの詳細を返す。スコアボードとかで使える。

### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new MatchApi();
var eventId = 789; // int | 
var matchId = 789; // int | match id

try { 
    var result = api_instance.getMatch(eventId, matchId);
    print(result);
} catch (e) {
    print("Exception when calling MatchApi->getMatch: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **int**|  | [default to null]
 **matchId** | **int**| match id | [default to null]

### Return type

[**Match**](Match.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


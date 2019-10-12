# openapi.api.ResultApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://splathon-api-us.appspot.com/splathon*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getResult**](ResultApi.md#getResult) | **GET** /v{eventId}/results | 


# **getResult**
> Results getResult(eventId, teamId, X_SPLATHON_API_TOKEN)



リザルト一覧を返す。リザルトと言いつつ終了していない未来のマッチも返す。ゲスト・管理アプリ両方から使う。team_idを指定するとそのチームのみの結果が返ってくる。

### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new ResultApi();
var eventId = 789; // int | 
var teamId = 789; // int | team id
var X_SPLATHON_API_TOKEN = X_SPLATHON_API_TOKEN_example; // String | 

try { 
    var result = api_instance.getResult(eventId, teamId, X_SPLATHON_API_TOKEN);
    print(result);
} catch (e) {
    print("Exception when calling ResultApi->getResult: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **int**|  | [default to null]
 **teamId** | **int**| team id | [optional] [default to null]
 **X_SPLATHON_API_TOKEN** | **String**|  | [optional] [default to null]

### Return type

[**Results**](Results.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


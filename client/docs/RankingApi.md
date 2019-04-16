# openapi.api.RankingApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://localhost/splathon*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getRanking**](RankingApi.md#getRanking) | **GET** /v{eventId}/ranking | 


# **getRanking**
> Ranking getRanking(eventId)



予選ランキングを返す。

### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new RankingApi();
var eventId = 789; // int | 

try { 
    var result = api_instance.getRanking(eventId);
    print(result);
} catch (e) {
    print("Exception when calling RankingApi->getRanking: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **int**|  | [default to null]

### Return type

[**Ranking**](Ranking.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


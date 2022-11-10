# openapi.api.RankingApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://splathon-api-dev.appspot.com/splathon*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getRanking**](RankingApi.md#getranking) | **GET** /{eventId}/ranking | 


# **getRanking**
> Ranking getRanking(eventId, latest)



予選ランキングを返す。

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = RankingApi();
final eventId = eventId_example; // String | 
final latest = true; // bool | Return latest ranking if true.

try {
    final result = api_instance.getRanking(eventId, latest);
    print(result);
} catch (e) {
    print('Exception when calling RankingApi->getRanking: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **String**|  | 
 **latest** | **bool**| Return latest ranking if true. | [optional] 

### Return type

[**Ranking**](Ranking.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


# openapi.api.ReceptionApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://splathon-api-us.appspot.com/splathon*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getParticipantsDataForReception**](ReceptionApi.md#getParticipantsDataForReception) | **GET** /v{eventId}/reception/{splathonReceptionCode} | 
[**getReception**](ReceptionApi.md#getReception) | **GET** /v{eventId}/reception | 
[**registerParticipants**](ReceptionApi.md#registerParticipants) | **POST** /v{eventId}/reception/{splathonReceptionCode}/register | 


# **getParticipantsDataForReception**
> ReceptionPartcipantsDataResponse getParticipantsDataForReception(eventId, splathonReceptionCode, X_SPLATHON_API_TOKEN)



参加者情報取得API

### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new ReceptionApi();
var eventId = 789; // int | 
var splathonReceptionCode = splathonReceptionCode_example; // String | ReceptionResponse.splathon.code と同じもの(たぶん内部SlackID).
var X_SPLATHON_API_TOKEN = X_SPLATHON_API_TOKEN_example; // String | 

try { 
    var result = api_instance.getParticipantsDataForReception(eventId, splathonReceptionCode, X_SPLATHON_API_TOKEN);
    print(result);
} catch (e) {
    print("Exception when calling ReceptionApi->getParticipantsDataForReception: $e\n");
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

# **getReception**
> ReceptionResponse getReception(eventId, X_SPLATHON_API_TOKEN)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new ReceptionApi();
var eventId = 789; // int | 
var X_SPLATHON_API_TOKEN = X_SPLATHON_API_TOKEN_example; // String | 

try { 
    var result = api_instance.getReception(eventId, X_SPLATHON_API_TOKEN);
    print(result);
} catch (e) {
    print("Exception when calling ReceptionApi->getReception: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **int**|  | [default to null]
 **X_SPLATHON_API_TOKEN** | **String**|  | [default to null]

### Return type

[**ReceptionResponse**](ReceptionResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **registerParticipants**
> registerParticipants(eventId, splathonReceptionCode, X_SPLATHON_API_TOKEN)



参加登録API

### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new ReceptionApi();
var eventId = 789; // int | 
var splathonReceptionCode = splathonReceptionCode_example; // String | ReceptionResponse.splathon.code と同じもの(たぶん内部SlackID).
var X_SPLATHON_API_TOKEN = X_SPLATHON_API_TOKEN_example; // String | 

try { 
    api_instance.registerParticipants(eventId, splathonReceptionCode, X_SPLATHON_API_TOKEN);
} catch (e) {
    print("Exception when calling ReceptionApi->registerParticipants: $e\n");
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


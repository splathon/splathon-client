# openapi.api.ReceptionApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://splathon-api-us.appspot.com/splathon*

Method | HTTP request | Description
------------- | ------------- | -------------
[**completeReception**](ReceptionApi.md#completereception) | **POST** /v{eventId}/reception/{splathonReceptionCode}/complete | 
[**getParticipantsDataForReception**](ReceptionApi.md#getparticipantsdataforreception) | **GET** /v{eventId}/reception/{splathonReceptionCode} | 
[**getReception**](ReceptionApi.md#getreception) | **GET** /v{eventId}/reception | 


# **completeReception**
> completeReception(eventId, splathonReceptionCode, X_SPLATHON_API_TOKEN)



参加登録API

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = ReceptionApi();
final eventId = 789; // int | 
final splathonReceptionCode = splathonReceptionCode_example; // String | ReceptionResponse.splathon.code と同じもの(たぶん内部SlackID).
final X_SPLATHON_API_TOKEN = X_SPLATHON_API_TOKEN_example; // String | 

try {
    api_instance.completeReception(eventId, splathonReceptionCode, X_SPLATHON_API_TOKEN);
} catch (e) {
    print('Exception when calling ReceptionApi->completeReception: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **int**|  | 
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

# **getParticipantsDataForReception**
> ReceptionPartcipantsDataResponse getParticipantsDataForReception(eventId, splathonReceptionCode, X_SPLATHON_API_TOKEN)



参加者情報取得API

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = ReceptionApi();
final eventId = 789; // int | 
final splathonReceptionCode = splathonReceptionCode_example; // String | ReceptionResponse.splathon.code と同じもの(たぶん内部SlackID).
final X_SPLATHON_API_TOKEN = X_SPLATHON_API_TOKEN_example; // String | 

try {
    final result = api_instance.getParticipantsDataForReception(eventId, splathonReceptionCode, X_SPLATHON_API_TOKEN);
    print(result);
} catch (e) {
    print('Exception when calling ReceptionApi->getParticipantsDataForReception: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **int**|  | 
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

# **getReception**
> ReceptionResponse getReception(eventId, X_SPLATHON_API_TOKEN)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = ReceptionApi();
final eventId = 789; // int | 
final X_SPLATHON_API_TOKEN = X_SPLATHON_API_TOKEN_example; // String | 

try {
    final result = api_instance.getReception(eventId, X_SPLATHON_API_TOKEN);
    print(result);
} catch (e) {
    print('Exception when calling ReceptionApi->getReception: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **int**|  | 
 **X_SPLATHON_API_TOKEN** | **String**|  | 

### Return type

[**ReceptionResponse**](ReceptionResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


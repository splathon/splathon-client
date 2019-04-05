# openapi.api.Sample1Api

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://localhost/splathon/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getUserById**](Sample1Api.md#getUserById) | **GET** /user/{id} | 


# **getUserById**
> SampleObj getUserById(id)



サンプルコード

### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new Sample1Api();
var id = 8.14; // num | user id

try { 
    var result = api_instance.getUserById(id);
    print(result);
} catch (e) {
    print("Exception when calling Sample1Api->getUserById: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **num**| user id | [default to null]

### Return type

[**SampleObj**](SampleObj.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


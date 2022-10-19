# openapi.model.LoginResponse

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**token** | **String** | Session API token. Send this token via X-SPLATHON-API-TOKEN HTTP hader. 'X-SPLATHON-API-TOKEN: <token>' | 
**isAdmin** | **bool** | 管理者かどうか。(e.g. true なら battle data を送信できる。) | 
**team** | [**Team**](Team.md) |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)



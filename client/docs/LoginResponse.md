# openapi.model.LoginResponse

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**token** | **String** | Session API token. Send this token via X-SPLATHON-API-TOKEN HTTP hader. &#39;X-SPLATHON-API-TOKEN: &lt;token&gt;&#39; | [default to null]
**isAdmin** | **bool** | 管理者かどうか。(e.g. true なら battle data を送信できる。) | [optional] [default to null]
**team** | [**Team**](Team.md) |  | [optional] [default to null]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)



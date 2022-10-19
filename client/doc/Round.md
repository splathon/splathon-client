# openapi.model.Round

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **int** | Round ID. (Qualifier ID or Tournament ID) | [optional] 
**name** | **String** | ラウンド名。e.g. 予選第1ラウンド, 決勝T1回戦, 決勝戦 | 
**round** | **int** | 何ラウンドか。i.e. 予選第Nラウンド, 決勝T N回戦 | [optional] 
**rooms** | [**List<Room>**](Room.md) |  | [optional] [default to const []]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)



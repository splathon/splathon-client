# openapi.model.Match

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **int** | Match ID | 
**winner** | **String** | 勝者がどちらか。または引き分け。 | [optional] 
**order** | **int** | Room内でのマッチの順番 | [optional] 
**teamAlpha** | [**Team**](Team.md) |  | 
**teamBravo** | [**Team**](Team.md) |  | 
**battles** | [**List<Battle>**](Battle.md) |  | [optional] [default to const []]
**roundName** | **String** | ラウンド名。e.g. 予選第1ラウンド, 決勝T1回戦, 決勝戦. Match APIから読んだときに埋まっている | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)



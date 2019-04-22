# openapi.model.Match

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **int** | Match ID | [default to null]
**winner** | **String** | 勝者がどちらか。または引き分け。 | [optional] [default to null]
**order** | **int** | Room内でのマッチの順番 | [optional] [default to null]
**teamAlpha** | [**Team**](Team.md) |  | [default to null]
**teamBravo** | [**Team**](Team.md) |  | [default to null]
**battles** | [**List&lt;Battle&gt;**](Battle.md) |  | [optional] [default to []]
**roundName** | **String** | ラウンド名。e.g. 予選第1ラウンド, 決勝T1回戦, 決勝戦. Match APIから読んだときに埋まっている | [optional] [default to null]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)



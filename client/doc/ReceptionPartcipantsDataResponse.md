# openapi.model.ReceptionPartcipantsDataResponse

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**description** | **String** | 受付の仕方の説明や注意点などのフリーテキスト。 | [optional] 
**slackInternalId** | **String** | 参加者の Slack Internal ID | [optional] 
**participants** | [**List<ParticipantReception>**](ParticipantReception.md) | 1つのSlackIDで複数の参加者をカバーしている。また participants とは別に参加者情報のない同伴者が存在する可能性があり、 もしいる場合は has_companion flag が true となる | [optional] [default to const []]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)



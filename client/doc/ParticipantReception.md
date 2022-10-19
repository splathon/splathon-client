# openapi.model.ParticipantReception

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **int** | internal id | 
**slackUserId** | **String** | Slack ID | 
**nickname** | **String** | ハンドルネーム。 e.g. みーくん | 
**fullnameKana** | **String** | カタカナのフルネーム。 e.g. ヤマダタロウ | 
**companyName** | **String** | 所属企業名 | 
**teamName** | **String** | チーム名 | [optional] 
**teamId** | **int** | チームID(一応) | [optional] 
**participantFee** | **int** | 合計参加費(円) | 
**joinParty** | **bool** | 懇親会に参加するか否か | 
**isStaff** | **bool** | スタッフかどうか | 
**isPlayer** | **bool** | playerとして参加するかどうか。falseならスタッフか観戦 | 
**hasSwitchDock** | **bool** | Nintendo Switch doc を持ってきたか | 
**hasCompanion** | **bool** | 同伴者がいるかどうか。いる場合は用スプレッドシート確認。 | 
**reception** | [**Reception**](Reception.md) |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)



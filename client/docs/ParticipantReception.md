# openapi.model.ParticipantReception

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**nickname** | **String** | ハンドルネーム。 e.g. みーくん | [optional] [default to null]
**fullnameKana** | **String** | カタカナのフルネーム。 e.g. ヤマダタロウ | [optional] [default to null]
**companyName** | **String** | 所属企業名 | [optional] [default to null]
**teamName** | **String** | チーム名 | [optional] [default to null]
**teamId** | **int** | チームID(一応) | [optional] [default to null]
**participantFee** | **int** | 合計参加費(円) | [optional] [default to null]
**joinParty** | **bool** | 懇親会に参加するか否か | [optional] [default to null]
**isStaff** | **bool** | スタッフかどうか | [optional] [default to null]
**isPlayer** | **bool** | playerとして参加するかどうか。falseならスタッフか観戦 | [optional] [default to null]
**hasSwitchDock** | **bool** | Nintendo Switch doc を持ってきたか | [optional] [default to null]
**hasCompanion** | **bool** | 同伴者がいるかどうか。いる場合は用スプレッドシート確認。 | [optional] [default to null]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)



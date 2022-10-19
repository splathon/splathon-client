//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:openapi/api.dart';
import 'package:test/test.dart';


/// tests for MatchApi
void main() {
  // final instance = MatchApi();

  group('tests for MatchApi', () {
    // マッチの詳細を返す。スコアボードとかで使える。
    //
    //Future<Match> getMatch(int eventId, int matchId) async
    test('test getMatch', () async {
      // TODO
    });

    // 次の試合を返す。team_id を指定した場合そのチームの、なければログインしている参加者のチームの 次のマッチをあれば返す。 team_idを指定せず参加者がチームに属して無い場合などはエラー。
    //
    //Future<GetNextMatchResponse> getNextMatch(int eventId, String X_SPLATHON_API_TOKEN, { int teamId }) async
    test('test getNextMatch', () async {
      // TODO
    });

    // Update a battle data in the match.
    //
    //Future updateBattle(int eventId, int matchId, String X_SPLATHON_API_TOKEN, Battle battle) async
    test('test updateBattle', () async {
      // TODO
    });

  });
}

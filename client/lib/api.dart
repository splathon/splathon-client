library openapi.api;

import 'dart:core' as Core show Match;
import 'dart:core' hide Match;
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';

part 'api_client.dart';
part 'api_helper.dart';
part 'api_exception.dart';
part 'auth/authentication.dart';
part 'auth/api_key_auth.dart';
part 'auth/oauth.dart';
part 'auth/http_basic_auth.dart';

part 'api/default_api.dart';
part 'api/match_api.dart';
part 'api/ranking_api.dart';
part 'api/result_api.dart';

part 'model/battle.dart';
part 'model/battle_rule.dart';
part 'model/battle_stage.dart';
part 'model/error.dart';
part 'model/match.dart';
part 'model/member.dart';
part 'model/rank.dart';
part 'model/ranking.dart';
part 'model/results.dart';
part 'model/room.dart';
part 'model/round.dart';
part 'model/team.dart';
part 'model/teams.dart';


ApiClient defaultApiClient = ApiClient();

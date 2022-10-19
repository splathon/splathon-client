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

part 'api/admin_api.dart';
part 'api/default_api.dart';
part 'api/match_api.dart';
part 'api/ranking_api.dart';
part 'api/reception_api.dart';
part 'api/result_api.dart';

part 'model/add_tournament_round_request.dart';
part 'model/battle.dart';
part 'model/error.dart';
part 'model/event.dart';
part 'model/get_next_match_response.dart';
part 'model/list_notices_response.dart';
part 'model/list_reception_response.dart';
part 'model/login_request.dart';
part 'model/login_response.dart';
part 'model/match.dart';
part 'model/member.dart';
part 'model/member_detail.dart';
part 'model/new_match_request.dart';
part 'model/next_match.dart';
part 'model/next_match_room.dart';
part 'model/notice.dart';
part 'model/participant_reception.dart';
part 'model/rank.dart';
part 'model/ranking.dart';
part 'model/reception.dart';
part 'model/reception_code.dart';
part 'model/reception_partcipants_data_response.dart';
part 'model/reception_response.dart';
part 'model/results.dart';
part 'model/room.dart';
part 'model/round.dart';
part 'model/rule.dart';
part 'model/schedule.dart';
part 'model/schedule_entry.dart';
part 'model/stage.dart';
part 'model/supported_room.dart';
part 'model/team.dart';
part 'model/teams.dart';
part 'model/update_reception_request.dart';
part 'model/update_release_qualifier_request.dart';


ApiClient defaultApiClient = ApiClient();

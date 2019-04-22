part of openapi.api;

class MemberDetail {
  /* 一言コメント */
  String shortComment = null;
  /* A+, X (2401~2500) */
  String rankSplatZones = null;
  /* A+, X (2401~2500) */
  String rankTowerControl = null;
  /* A+, X (2401~2500) */
  String rankClamBlitz = null;
  /* メインウェポン/好きなブキ */
  String mainWeapon = null;
  MemberDetail();

  @override
  String toString() {
    return 'MemberDetail[shortComment=$shortComment, rankSplatZones=$rankSplatZones, rankTowerControl=$rankTowerControl, rankClamBlitz=$rankClamBlitz, mainWeapon=$mainWeapon, ]';
  }

  MemberDetail.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    shortComment = json['short_comment'];
    rankSplatZones = json['rank_splat_zones'];
    rankTowerControl = json['rank_tower_control'];
    rankClamBlitz = json['rank_clam_blitz'];
    mainWeapon = json['main_weapon'];
  }

  Map<String, dynamic> toJson() {
    return {
      'short_comment': shortComment,
      'rank_splat_zones': rankSplatZones,
      'rank_tower_control': rankTowerControl,
      'rank_clam_blitz': rankClamBlitz,
      'main_weapon': mainWeapon
    };
  }

  static List<MemberDetail> listFromJson(List<dynamic> json) {
    return json == null ? new List<MemberDetail>() : json.map((value) => new MemberDetail.fromJson(value)).toList();
  }

  static Map<String, MemberDetail> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, MemberDetail>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new MemberDetail.fromJson(value));
    }
    return map;
  }
}


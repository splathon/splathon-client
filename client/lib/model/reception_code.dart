part of openapi.api;

class ReceptionCode {
  /* Splathon会場入場コード/XXXビル入館コード */
  String name = null;
  /* 入場の説明 */
  String description = null;
  /* コードの説明 */
  String shortText = null;
  /* Image URL of QR code */
  String qrcodeImg = null;
  
  String code = null;
  
  String codeType = null;
  //enum codeTypeEnum {  qrcode,  barcode,  };{
  ReceptionCode();

  @override
  String toString() {
    return 'ReceptionCode[name=$name, description=$description, shortText=$shortText, qrcodeImg=$qrcodeImg, code=$code, codeType=$codeType, ]';
  }

  ReceptionCode.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    name = json['name'];
    description = json['description'];
    shortText = json['short_text'];
    qrcodeImg = json['qrcode_img'];
    code = json['code'];
    codeType = json['code_type'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'short_text': shortText,
      'qrcode_img': qrcodeImg,
      'code': code,
      'code_type': codeType
    };
  }

  static List<ReceptionCode> listFromJson(List<dynamic> json) {
    return json == null ? new List<ReceptionCode>() : json.map((value) => new ReceptionCode.fromJson(value)).toList();
  }

  static Map<String, ReceptionCode> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, ReceptionCode>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new ReceptionCode.fromJson(value));
    }
    return map;
  }
}


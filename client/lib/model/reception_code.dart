//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ReceptionCode {
  /// Returns a new [ReceptionCode] instance.
  ReceptionCode({
    this.name,
    this.description,
    this.shortText,
    this.qrcodeImg,
    this.code,
    this.codeType,
  });

  /// Splathon会場入場コード/XXXビル入館コード
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// 入場の説明
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// コードの説明
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? shortText;

  /// Image URL of QR code
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? qrcodeImg;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? code;

  ReceptionCodeCodeTypeEnum? codeType;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ReceptionCode &&
     other.name == name &&
     other.description == description &&
     other.shortText == shortText &&
     other.qrcodeImg == qrcodeImg &&
     other.code == code &&
     other.codeType == codeType;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (name == null ? 0 : name!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (shortText == null ? 0 : shortText!.hashCode) +
    (qrcodeImg == null ? 0 : qrcodeImg!.hashCode) +
    (code == null ? 0 : code!.hashCode) +
    (codeType == null ? 0 : codeType!.hashCode);

  @override
  String toString() => 'ReceptionCode[name=$name, description=$description, shortText=$shortText, qrcodeImg=$qrcodeImg, code=$code, codeType=$codeType]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.shortText != null) {
      json[r'short_text'] = this.shortText;
    } else {
      json[r'short_text'] = null;
    }
    if (this.qrcodeImg != null) {
      json[r'qrcode_img'] = this.qrcodeImg;
    } else {
      json[r'qrcode_img'] = null;
    }
    if (this.code != null) {
      json[r'code'] = this.code;
    } else {
      json[r'code'] = null;
    }
    if (this.codeType != null) {
      json[r'code_type'] = this.codeType;
    } else {
      json[r'code_type'] = null;
    }
    return json;
  }

  /// Returns a new [ReceptionCode] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ReceptionCode? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ReceptionCode[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ReceptionCode[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ReceptionCode(
        name: mapValueOfType<String>(json, r'name'),
        description: mapValueOfType<String>(json, r'description'),
        shortText: mapValueOfType<String>(json, r'short_text'),
        qrcodeImg: mapValueOfType<String>(json, r'qrcode_img'),
        code: mapValueOfType<String>(json, r'code'),
        codeType: ReceptionCodeCodeTypeEnum.fromJson(json[r'code_type']),
      );
    }
    return null;
  }

  static List<ReceptionCode>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ReceptionCode>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ReceptionCode.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ReceptionCode> mapFromJson(dynamic json) {
    final map = <String, ReceptionCode>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ReceptionCode.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ReceptionCode-objects as value to a dart map
  static Map<String, List<ReceptionCode>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ReceptionCode>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ReceptionCode.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}


class ReceptionCodeCodeTypeEnum {
  /// Instantiate a new enum with the provided [value].
  const ReceptionCodeCodeTypeEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const qrcode = ReceptionCodeCodeTypeEnum._(r'qrcode');
  static const barcode = ReceptionCodeCodeTypeEnum._(r'barcode');

  /// List of all possible values in this [enum][ReceptionCodeCodeTypeEnum].
  static const values = <ReceptionCodeCodeTypeEnum>[
    qrcode,
    barcode,
  ];

  static ReceptionCodeCodeTypeEnum? fromJson(dynamic value) => ReceptionCodeCodeTypeEnumTypeTransformer().decode(value);

  static List<ReceptionCodeCodeTypeEnum>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ReceptionCodeCodeTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ReceptionCodeCodeTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ReceptionCodeCodeTypeEnum] to String,
/// and [decode] dynamic data back to [ReceptionCodeCodeTypeEnum].
class ReceptionCodeCodeTypeEnumTypeTransformer {
  factory ReceptionCodeCodeTypeEnumTypeTransformer() => _instance ??= const ReceptionCodeCodeTypeEnumTypeTransformer._();

  const ReceptionCodeCodeTypeEnumTypeTransformer._();

  String encode(ReceptionCodeCodeTypeEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a ReceptionCodeCodeTypeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ReceptionCodeCodeTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'qrcode': return ReceptionCodeCodeTypeEnum.qrcode;
        case r'barcode': return ReceptionCodeCodeTypeEnum.barcode;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [ReceptionCodeCodeTypeEnumTypeTransformer] instance.
  static ReceptionCodeCodeTypeEnumTypeTransformer? _instance;
}



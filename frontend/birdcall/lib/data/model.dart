import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Model {
  String id;
  String gen;
  String sp;
  String en;
  String cnt;
  String loc;

  String type;

  String file;
  String sono;

  String length;

  Model({
    required this.id,
    required this.gen,
    required this.sp,
    required this.en,
    required this.cnt,
    required this.loc,
    required this.type,
    required this.file,
    required this.sono,
    required this.length,
  });

  Model copyWith({
    String? id,
    String? gen,
    String? sp,
    String? en,
    String? cnt,
    String? loc,
    String? type,
    String? file,
    String? sono,
    String? length,
  }) {
    return Model(
      id: id ?? this.id,
      gen: gen ?? this.gen,
      sp: sp ?? this.sp,
      en: en ?? this.en,
      cnt: cnt ?? this.cnt,
      loc: loc ?? this.loc,
      type: type ?? this.type,
      file: file ?? this.file,
      sono: sono ?? this.sono,
      length: length ?? this.length,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'gen': gen,
      'sp': sp,
      'en': en,
      'cnt': cnt,
      'loc': loc,
      'type': type,
      'file': file,
      'sono': sono,
      'length': length,
    };
  }

  factory Model.fromMap(Map<String, dynamic> map) {
    return Model(
      id: map['id'] as String,
      gen: map['gen'] as String,
      sp: map['sp'] as String,
      en: map['en'] as String,
      cnt: map['cnt'] as String,
      loc: map['loc'] as String,
      type: map['type'] as String,
      file: map['file'] as String,
      sono: map['sono'] as String,
      length: map['length'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Model.fromJson(String source) =>
      Model.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Model(id: $id, gen: $gen, sp: $sp, en: $en, cnt: $cnt, loc: $loc,  type: $type, file: $file, sono: $sono,  quality: length: $length, )';
  }

  @override
  bool operator ==(covariant Model other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.gen == gen &&
        other.sp == sp &&
        other.en == en &&
        other.cnt == cnt &&
        other.loc == loc &&
        other.type == type &&
        other.file == file &&
        other.sono == sono &&
        other.length == length;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        gen.hashCode ^
        sp.hashCode ^
        en.hashCode ^
        cnt.hashCode ^
        loc.hashCode ^
        type.hashCode ^
        file.hashCode ^
        sono.hashCode ^
        length.hashCode;
  }
}

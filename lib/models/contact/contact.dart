import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'contact.freezed.dart';
part 'contact.g.dart';

@freezed
class Contact with _$Contact {
  @HiveType(typeId: 0, adapterName: 'ContactAdapter')
  const factory Contact({
    @HiveField(0) required String id,
    @HiveField(1) required String firstName,
    @HiveField(2) required String lastName,
    @HiveField(3) required String phoneNumber,
    @HiveField(4) required String email,
    @HiveField(5) @Default([]) List<String> groups,
    @HiveField(6) String? relationship,
    @HiveField(7) String? note,
    @HiveField(8) String? nickname,
  }) = _Contact;

  const Contact._();

  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);

  String get initials => '${firstName[0]}${lastName[0]}';

  static String boxName = 'contacts';
}

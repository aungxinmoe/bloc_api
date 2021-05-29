import 'package:json_annotation/json_annotation.dart';
part 'contacts.g.dart';

@JsonSerializable()
class Contact {
  final String id;
  final String name;
  final String job;
  final String age;

  Contact({required this.id,required this.name, required this.job, required this.age});

  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);
  Map<String, dynamic> toJson() => _$ContactToJson(this);
}

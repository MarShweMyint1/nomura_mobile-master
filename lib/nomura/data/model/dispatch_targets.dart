import 'package:json_annotation/json_annotation.dart';
part 'dispatch_targets.g.dart';

@JsonSerializable()
class DispatchTargets {
  String? id;
  String? name;
  DispatchTargets(this.id, this.name);
  factory DispatchTargets.fromJson(Map<String, dynamic> json) =>
      _$DispatchTargetsFromJson(json);
  Map<String, dynamic> toJson() => _$DispatchTargetsToJson(this);
}

// {
//     "dispatchTargets": [
//         {
//             "id": "a3cbc72f-87d9-4ba0-bc64-91722ea46841",
//             "name": "Android Google sdk_gphone_x86-20.06.2023 11:54:039"
//         },
//         {
//             "id": "06d6743b-227f-4f65-9467-6e7b3684b3db",
//             "name": "Android Xiaomi M2101K7BG-20.06.2023 11:22:020"
//         },
//         {
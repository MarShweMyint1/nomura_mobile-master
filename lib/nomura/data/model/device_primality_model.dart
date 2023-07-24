import 'package:json_annotation/json_annotation.dart';
import 'package:nomura_mobile/nomura/data/model/dispatch_targets.dart';
part 'device_primality_model.g.dart';
@JsonSerializable()
class DevicePrimalityModel {
  final List<DispatchTargets>? dispatchTargets;
  DevicePrimalityModel(this.dispatchTargets);
  factory DevicePrimalityModel.fromJson(Map<String, dynamic> json) =>
      _$DevicePrimalityModelFromJson(json);
  Map<String, dynamic> toJson() => _$DevicePrimalityModelToJson(this);
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
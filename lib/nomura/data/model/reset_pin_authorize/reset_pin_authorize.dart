import 'package:json_annotation/json_annotation.dart';
import 'package:nomura_mobile/nomura/data/model/reset_pin_authorize/trusted_facets.dart';
part 'reset_pin_authorize.g.dart';
@JsonSerializable()
class ResetPinAuthorizeModel {
  List<TrustedFacets>? trustedFacets;
  ResetPinAuthorizeModel(this.trustedFacets);
  factory ResetPinAuthorizeModel.fromJson(Map<String, dynamic> json) =>
      _$ResetPinAuthorizeModelFromJson(json);
  Map<String, dynamic> toJson() => _$ResetPinAuthorizeModelToJson(this);
}

// {
//     "trustedFacets": [
//         {
//             "version": {
//                 "major": 1,
//                 "minor": 1
//             },
//             "ids": [
//                 "ios:bundle-id:com.sst.nomuraMobile",
//                 "android:apk-key-hash:1SyN6Ur8JqDpVo45zBoABRNL97mvCCA8o/4b15coMrA"
//             ]
//         }
//     ]
// }

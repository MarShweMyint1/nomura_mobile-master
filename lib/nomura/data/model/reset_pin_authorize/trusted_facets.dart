
import 'package:json_annotation/json_annotation.dart';
import 'package:nomura_mobile/nomura/data/model/reset_pin_authorize/version.dart';
part 'trusted_facets.g.dart';
@JsonSerializable()
class TrustedFacets{
  Version? version;
  List<String>? ids;
  TrustedFacets(this.version,this.ids);
  factory TrustedFacets.fromJson(Map<String,dynamic>json)=>_$TrustedFacetsFromJson(json);
  Map<String,dynamic> toJson()=>_$TrustedFacetsToJson(this);

}

import 'package:json_annotation/json_annotation.dart';
part 'version.g.dart';
@JsonSerializable()
class Version{
  int? major;
  int? minor;
  Version(this.major,this.minor);
  factory Version.fromJson(Map<String,dynamic>json)=>_$VersionFromJson(json);
  Map<String,dynamic> toJson()=>_$VersionToJson(this);
}


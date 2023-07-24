import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nomura_mobile/nomura/data/model/legacy_login_model.dart';
import 'package:nomura_mobile/nomura/data/model/legacy_proceed_model.dart';

part 'legacy_proceed_state.freezed.dart';

extension Getters on LegacyProceedState {
  bool get isLoading => this is Loading;
}

@freezed
class LegacyProceedState with _$LegacyProceedState {
  const factory LegacyProceedState.data({required LegacyProceedModel data}) =
      Data;
  const factory LegacyProceedState.notFound(
      {required LegacyLoginModel invalidData}) = InvalidData;
  const factory LegacyProceedState.initial() = Initial;
  const factory LegacyProceedState.loading() = Loading;
  const factory LegacyProceedState.error({String? message}) = Error;
}

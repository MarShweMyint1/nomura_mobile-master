import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nomura_mobile/nomura/data/model/legacy_login_model.dart';

part 'legacy_login_state.freezed.dart';

extension Getters on LegacyState {
  bool get isLoading => this is Loading;
}

@freezed
class LegacyState with _$LegacyState {
  const factory LegacyState.data({required LegacyLoginModel data}) = Data;
  const factory LegacyState.lock({required LegacyLoginModel data}) = Lock;
  const factory LegacyState.initial() = Initial;
  const factory LegacyState.loading() = Loading;
  const factory LegacyState.error({String? message}) = Error;
  const factory LegacyState.timeOut({String? message}) = TimeOut;
}

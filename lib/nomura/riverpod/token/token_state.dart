import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nomura_mobile/nomura/data/model/token_model.dart';

part 'token_state.freezed.dart';

extension Getters on TokenState {
  bool get isLoading => this is Loading;
}
@freezed
class TokenState with _$TokenState{
  const factory TokenState.data({required TokenModel data})=Data;
  const factory TokenState.initial()=Initial;
  const factory TokenState.loading()=Loading;
  const factory TokenState.error({required String message})=Error;
}
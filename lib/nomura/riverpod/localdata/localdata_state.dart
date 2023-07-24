import 'package:freezed_annotation/freezed_annotation.dart';

part 'localdata_state.freezed.dart';

extension Getters on LocalDataState {
  bool get isLoading => this is Loading;
}

@freezed
class LocalDataState with _$LocalDataState {
  const factory LocalDataState.data() = Data;
  const factory LocalDataState.username({String? username}) = LocalData;
  const factory LocalDataState.initial() = Initial;
  const factory LocalDataState.loading() = Loading;
  const factory LocalDataState.error({String? message}) = Error;
  const factory LocalDataState.timeOut({String? message}) = TimeOut;
}

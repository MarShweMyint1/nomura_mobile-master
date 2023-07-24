part of 'legacy_proceed_provider.dart';

class LegacyProceedNotifier extends StateNotifier<LegacyProceedState> {
  LegacyProceedNotifier(
      {required LegacyProceedUsecase legacyProceedUsecase,
      LegacyProceedState? initState})
      : _legacyProceedUseCase = legacyProceedUsecase,
        super(initState ?? const LegacyProceedState.initial());

  final LegacyProceedUsecase _legacyProceedUseCase;

  void reset() => state = const LegacyProceedState.initial();

  Future<void> legacyProceedFunc(ValidateUserParams params) async {
    state = const LegacyProceedState.loading();
    final result = await _legacyProceedUseCase.legacyProceed(params);

    result.fold((failure) {
      state = LegacyProceedState.error(message: failure.toString());
    }, (success) {
      if (success.runtimeType == LegacyLoginModel) {
        state = LegacyProceedState.notFound(invalidData: success);
      } else {
        state = LegacyProceedState.data(data: success);
      }
    });
  }
}

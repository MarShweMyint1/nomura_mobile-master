part of 'localdata_provider.dart';

class LocalDataNotifier extends StateNotifier<LocalDataState> {
  LocalDataNotifier({LocalDataState? initState})
      : super(initState ?? const LocalDataState.initial());

  void reset() => state = const LocalDataState.initial();

  Future<void> getLocalData(
    ClientProvider clientProvider,
  ) async {
    state = const LocalDataState.loading();
    String name = await clientProvider.client.localData.accounts
        .then((value) => value.first.username);
    state = LocalDataState.username(username: name);
  }
}

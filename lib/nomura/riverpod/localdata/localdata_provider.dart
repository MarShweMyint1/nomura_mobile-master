import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomura_mobile/nomura/riverpod/localdata/localdata_state.dart';
import 'package:nomura_mobile/test_nevis/lib/domain/client_provider/client_provider.dart';
part 'localdata_notifier.dart';

final localdataNotifierProvider =
    StateNotifierProvider<LocalDataNotifier, LocalDataState>(
  (ref) => LocalDataNotifier(),
);

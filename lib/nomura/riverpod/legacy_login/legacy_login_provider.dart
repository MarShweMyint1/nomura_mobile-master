import 'package:nomura_mobile/nomura/data/data_services/dio_data_source.dart';
import 'package:nomura_mobile/nomura/data/irepositories/i_repository.dart';
import 'package:nomura_mobile/nomura/data/model/legacy_login_model.dart';
import 'package:nomura_mobile/nomura/data/params/validate_user.dart';
import 'package:nomura_mobile/nomura/domain/repository/repository.dart';
import 'package:nomura_mobile/nomura/domain/usecases/legacy_login.dart';
import 'package:nomura_mobile/nomura/riverpod/legacy_login/legacy_login_state.dart';
import 'package:nomura_mobile/nomura/utils/url_utils.dart';
import 'package:riverpod/riverpod.dart';
part 'legacy_login_notifier.dart';

final legacyLoginRepository = Provider<Repository>(
  (_) => IRepository(
    remoteDataSource:
        DioDataSource(url: '${UrlUtils.prodUrl}/${UrlUtils.initEndPoint}'),
  ),
);

final legacyProvider = Provider<LegacyLoginUsecase>((ref) {
  final repository = ref.watch(legacyLoginRepository);
  return LegacyLoginUsecase(repository: repository);
});

final legacyLoginNotifierProvider =
    StateNotifierProvider<LegacyNotifier, LegacyState>(
  (ref) => LegacyNotifier(
    legacyLoginUsecase: ref.watch(legacyProvider),
  ),
);

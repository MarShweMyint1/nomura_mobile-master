import 'package:nomura_mobile/nomura/data/data_services/dio_data_source.dart';
import 'package:nomura_mobile/nomura/data/irepositories/i_repository.dart';
import 'package:nomura_mobile/nomura/data/params/pwd_params.dart';
import 'package:nomura_mobile/nomura/domain/repository/repository.dart';
import 'package:nomura_mobile/nomura/domain/usecases/pwd_auth_usecase.dart';
import 'package:nomura_mobile/nomura/riverpod/pwd_auth/pwd_auth_state.dart';
import 'package:nomura_mobile/nomura/utils/url_utils.dart';
import 'package:riverpod/riverpod.dart';
part 'pwd_auth_notifier.dart';

final pwdAuthRepository = Provider<Repository>(
  (_) => IRepository(
    remoteDataSource:
        DioDataSource(url: '${UrlUtils.prodUrl}/${UrlUtils.pwdAuthEndPoint}'),
  ),
);

final pwdAuthProvider = Provider<PwdAuthUsecase>((ref) {
  final repository = ref.watch(pwdAuthRepository);
  return PwdAuthUsecase(repository: repository);
});

final pwdAuthNotifierProvider =
    StateNotifierProvider<PwdAuthNotifier, PwdAuthState>(
  (ref) => PwdAuthNotifier(
    pwdAuthUsecase: ref.watch(pwdAuthProvider),
  ),
);

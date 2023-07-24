import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomura_mobile/nomura/data/data_services/dio_data_source.dart';
import 'package:nomura_mobile/nomura/data/irepositories/i_repository.dart';
import 'package:nomura_mobile/nomura/domain/repository/repository.dart';
import 'package:nomura_mobile/nomura/domain/usecases/pwd_authz_usecase.dart';
import 'package:nomura_mobile/nomura/riverpod/pwd_authz/pwd_authz_notifier.dart';
import 'package:nomura_mobile/nomura/riverpod/pwd_authz/pwd_authz_state.dart';
import 'package:nomura_mobile/nomura/utils/url_utils.dart';

final authzRepository = Provider<Repository>(
  (_) => IRepository(
    remoteDataSource:
        DioDataSource(url: '${UrlUtils.prodUrl}/${UrlUtils.authZEndPoint}'),
  ),
);

final authzProvider = Provider<PwdAuthzUsecase>((ref) {
  final repository = ref.watch(authzRepository);
  return PwdAuthzUsecase(repository: repository);
});

final authzNotifierProvider =
    StateNotifierProvider<PwdAuthzNotifier, PwdAuthzState>((ref) {
  return PwdAuthzNotifier(pwdAuthzUsecase: ref.watch(authzProvider));
});

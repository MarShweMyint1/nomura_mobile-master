import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomura_mobile/nomura/data/data_services/dio_data_source.dart';
import 'package:nomura_mobile/nomura/data/irepositories/i_repository.dart';
import 'package:nomura_mobile/nomura/data/params/token_param.dart';
import 'package:nomura_mobile/nomura/domain/repository/repository.dart';
import 'package:nomura_mobile/nomura/domain/usecases/token_usecase.dart';
import 'package:nomura_mobile/nomura/riverpod/token/token_state.dart';
import 'package:nomura_mobile/nomura/utils/url_utils.dart';

part 'token_notifier.dart';

final tokenRepository = Provider<Repository>(
  (_) => IRepository(
    remoteDataSource:
        DioDataSource(url: '${UrlUtils.prodUrl}/${UrlUtils.authZEndPoint}'),
  ),
);

final tokenProvider = Provider<TokenUsecase>((ref) {
  final repository = ref.watch(tokenRepository);
  return TokenUsecase(repository: repository);
});

final tokenNotifierProvider =
    StateNotifierProvider<TokenNotifier, TokenState>((ref) {
  return TokenNotifier(tokenUsecase: ref.watch(tokenProvider));
});

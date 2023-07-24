import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomura_mobile/nomura/data/data_services/dio_data_source.dart';
import 'package:nomura_mobile/nomura/data/irepositories/i_repository.dart';
import 'package:nomura_mobile/nomura/domain/repository/repository.dart';
import 'package:nomura_mobile/nomura/domain/usecases/authorize_usecase.dart';
import 'package:nomura_mobile/nomura/riverpod/authorize/authorize_state.dart';
import 'package:nomura_mobile/nomura/utils/url_utils.dart';
part 'authorize_notifier.dart';

final authorizeRepository = Provider<Repository>(
  (_) => IRepository(
    remoteDataSource: DioDataSource(
      url: '${UrlUtils.prodUrl}/${UrlUtils.authorizeEndPoint}',
    ),
  ),
);

final authorizeProvider = Provider<AuthorizeUsecase>((ref) {
  final repository = ref.watch(authorizeRepository);
  return AuthorizeUsecase(repository: repository);
});

final authorizeNotifierProvider =
    StateNotifierProvider<AuthorizeNotifier, AuthorizeState>(
  (ref) => AuthorizeNotifier(
    authorizeUsecase: ref.watch(authorizeProvider),
  ),
);

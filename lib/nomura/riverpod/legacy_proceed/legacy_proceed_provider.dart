import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomura_mobile/nomura/data/data_services/dio_data_source.dart';
import 'package:nomura_mobile/nomura/data/irepositories/i_repository.dart';
import 'package:nomura_mobile/nomura/data/model/legacy_login_model.dart';
import 'package:nomura_mobile/nomura/data/params/validate_user.dart';
import 'package:nomura_mobile/nomura/domain/repository/repository.dart';
import 'package:nomura_mobile/nomura/domain/usecases/legacy_proceed.dart';
import 'package:nomura_mobile/nomura/riverpod/legacy_proceed/legacy_proceed_state.dart';
import 'package:nomura_mobile/nomura/utils/url_utils.dart';

part 'legacy_proceed_notifier.dart';

final legacyProceedRepository = Provider<Repository>((_) => IRepository(
    remoteDataSource: DioDataSource(
        url: '${UrlUtils.prodUrl}/${UrlUtils.mailProceedEndPoint}')));

final legacyProvider = Provider<LegacyProceedUsecase>((ref) {
  final repository = ref.watch(legacyProceedRepository);
  return LegacyProceedUsecase(repository: repository);
});

final legacyProceedNotifierProvider =
    StateNotifierProvider<LegacyProceedNotifier, LegacyProceedState>((ref) =>
        LegacyProceedNotifier(legacyProceedUsecase: ref.watch(legacyProvider)));

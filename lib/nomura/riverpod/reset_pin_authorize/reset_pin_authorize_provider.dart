import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomura_mobile/nomura/data/data_services/dio_data_source.dart';
import 'package:nomura_mobile/nomura/data/irepositories/i_repository.dart';
import 'package:nomura_mobile/nomura/data/model/legacy_login_model.dart';
import 'package:nomura_mobile/nomura/data/model/reset_pin_authorize/reset_pin_authorize.dart';
import 'package:nomura_mobile/nomura/domain/repository/repository.dart';
import 'package:nomura_mobile/nomura/domain/usecases/reset_pin_authorize_usecase.dart';
import 'package:nomura_mobile/nomura/riverpod/reset_pin_authorize/reset_pin_authorize_state.dart';
import 'package:nomura_mobile/nomura/utils/url_utils.dart';

part 'reset_pin_authorize_notifier.dart';


final resetPinAuthorizeRepository = Provider.autoDispose<Repository>(
  (_) => IRepository(
    remoteDataSource: DioDataSource(
        url: '${UrlUtils.prodUrl}/${UrlUtils.pinResetAuthorizeEndPoint}'),
  ),
);

final resetPinAuthorizeProvider = Provider.autoDispose<ResetPinAuthorizeUsecase>((ref) {
  final repository = ref.watch(resetPinAuthorizeRepository);
  return ResetPinAuthorizeUsecase(repository: repository);
});

final resetPinAuthorizeNotifierProvider =
    StateNotifierProvider.autoDispose<ResetPinAuthorizeNotifier, ResetPinAuthorizeState>(
        (ref) =>
            ResetPinAuthorizeNotifier(resetPinAuthorizeUsecase: ref.watch(resetPinAuthorizeProvider)));

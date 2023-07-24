import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomura_mobile/nomura/data/data_services/dio_data_source.dart';
import 'package:nomura_mobile/nomura/data/irepositories/i_repository.dart';
import 'package:nomura_mobile/nomura/data/model/legacy_login_model.dart';
import 'package:nomura_mobile/nomura/data/params/resend_sms.dart';
import 'package:nomura_mobile/nomura/domain/repository/repository.dart';
import 'package:nomura_mobile/nomura/domain/usecases/resend_sms.dart';
import 'package:nomura_mobile/nomura/riverpod/resend_sms/resend_sms_state.dart';
import 'package:nomura_mobile/nomura/utils/url_utils.dart';

part 'resend_sms_notifier.dart';

final resendSMSRepository = Provider.autoDispose<Repository>(
  (_) => IRepository(
    remoteDataSource: DioDataSource(
        url: '${UrlUtils.prodUrl}/${UrlUtils.mailProceedEndPoint}'),
  ),
);

final resendSMSProvider = Provider.autoDispose<ResendSMSUsecase>((ref) {
  final repository = ref.watch(resendSMSRepository);
  return ResendSMSUsecase(repository: repository);
});

final resendSMSNotifierProvider =
    StateNotifierProvider.autoDispose<ResendSMSNotifier, ResendSMSState>(
        (ref) =>
            ResendSMSNotifier(resendSMSUsecase: ref.watch(resendSMSProvider)));

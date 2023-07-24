import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomura_mobile/nomura/data/data_services/dio_data_source.dart';
import 'package:nomura_mobile/nomura/data/irepositories/i_repository.dart';
import 'package:nomura_mobile/nomura/data/params/resend_sms.dart';
import 'package:nomura_mobile/nomura/domain/repository/repository.dart';
import 'package:nomura_mobile/nomura/domain/usecases/resend_mail.dart';
import 'package:nomura_mobile/nomura/riverpod/resend_mail/resend_mail_state.dart';
import 'package:nomura_mobile/nomura/utils/url_utils.dart';

part 'resend_mail_notifier.dart';

final resendMailRepository = Provider.autoDispose<Repository>(
  (_) => IRepository(
    remoteDataSource:
        DioDataSource(url: '${UrlUtils.prodUrl}/${UrlUtils.initEndPoint}'),
  ),
);

final resendMailProvider = Provider.autoDispose<ResendMailUsecase>((ref) {
  final repository = ref.watch(resendMailRepository);
  return ResendMailUsecase(repository: repository);
});

final resendMailNotifierProvider = StateNotifierProvider
    .autoDispose<ResendMailNotifier, ResendMailState>((ref) =>
        ResendMailNotifier(resendMailUsecase: ref.watch(resendMailProvider)));

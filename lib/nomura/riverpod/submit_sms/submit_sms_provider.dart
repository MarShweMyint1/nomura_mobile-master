import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomura_mobile/nomura/data/data_services/dio_data_source.dart';
import 'package:nomura_mobile/nomura/data/irepositories/i_repository.dart';
import 'package:nomura_mobile/nomura/data/model/legacy_proceed_model.dart';
import 'package:nomura_mobile/nomura/data/params/submit_sms.dart';
import 'package:nomura_mobile/nomura/domain/repository/repository.dart';
import 'package:nomura_mobile/nomura/domain/usecases/submit_sms.dart';
import 'package:nomura_mobile/nomura/riverpod/submit_sms/submit_sms_state.dart';
import 'package:nomura_mobile/nomura/utils/url_utils.dart';
part 'submit_sms_notifier.dart';

final submitSMSRepository = Provider<Repository>(
  (_) => IRepository(
    remoteDataSource: DioDataSource(
        url: '${UrlUtils.prodUrl}/${UrlUtils.mailProceedEndPoint}'),
  ),
);
final submitSMSProvider = Provider<SubmitSMSUsecase>((ref) {
  final repository = ref.watch(submitSMSRepository);
  return SubmitSMSUsecase(repository: repository);
});

final submitSMSNotifierProvider =
    StateNotifierProvider<SubmitSMSNotifier, SubmitSMSState>(
  (ref) => SubmitSMSNotifier(
    submitSMSUsecase: ref.watch(submitSMSProvider),
  ),
);

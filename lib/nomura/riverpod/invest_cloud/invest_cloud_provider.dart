import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomura_mobile/nomura/data/data_services/dio_data_source.dart';
import 'package:nomura_mobile/nomura/data/irepositories/i_repository.dart';
import 'package:nomura_mobile/nomura/domain/repository/repository.dart';
import 'package:nomura_mobile/nomura/domain/usecases/invest_cloud_usecase.dart';
import 'package:nomura_mobile/nomura/riverpod/invest_cloud/invest_cloud_notifier.dart';
import 'package:nomura_mobile/nomura/riverpod/invest_cloud/invest_cloud_state.dart';
import 'package:nomura_mobile/nomura/utils/url_utils.dart';

final investCloudRepository = Provider<Repository>(
  (_) => IRepository(
    remoteDataSource: DioDataSource(
        url: '${UrlUtils.investCloudUrl}/${UrlUtils.investCloudEndPoint}'),
  ),
);

final investCloudProvider = Provider<InvestCloudUsecase>((ref) {
  final repository = ref.watch(investCloudRepository);
  return InvestCloudUsecase(repository: repository);
});

final investCloudNotifierProvider =
    StateNotifierProvider<InvestCloudNotifier, InvestCloudState>((ref) {
  return InvestCloudNotifier(
    investCloudUsecase: ref.watch(investCloudProvider),
  );
});

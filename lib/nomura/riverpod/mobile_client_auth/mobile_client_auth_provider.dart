import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomura_mobile/nomura/data/data_services/dio_data_source.dart';
import 'package:nomura_mobile/nomura/data/irepositories/i_repository.dart';
import 'package:nomura_mobile/nomura/data/params/mobile_client_auth_param.dart';
import 'package:nomura_mobile/nomura/domain/repository/repository.dart';
import 'package:nomura_mobile/nomura/domain/usecases/mobile_client_auth_usecase.dart';
import 'package:nomura_mobile/nomura/riverpod/mobile_client_auth/mobile_client_auth_state.dart';
import 'package:nomura_mobile/nomura/utils/url_utils.dart';

part 'mobile_client_auth_notifier.dart';

final mobileClientAuthRepository = Provider.autoDispose<Repository>((ref) =>
    IRepository(
        remoteDataSource: DioDataSource(
            url: '${UrlUtils.prodUrl}/${UrlUtils.mobileClientAuthEndPoint}')));

final mobileClientAuthProvider =
    Provider.autoDispose<MobileClientAuthUsecase>((ref) {
  final repository = ref.watch(mobileClientAuthRepository);
  return MobileClientAuthUsecase(repository: repository);
});

final mobileClientAuthNotifierProvider = StateNotifierProvider.autoDispose<
        MobileClientAuthNotifier, MobileClientAuthState>(
    (ref) => MobileClientAuthNotifier(
        mobileClientAuthUsecase: ref.watch(mobileClientAuthProvider)));

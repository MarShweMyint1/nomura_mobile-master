import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomura_mobile/nomura/data/data_services/dio_data_source.dart';
import 'package:nomura_mobile/nomura/data/irepositories/i_repository.dart';
import 'package:nomura_mobile/nomura/data/model/device_primality_model.dart';
import 'package:nomura_mobile/nomura/data/params/validate_user.dart';
import 'package:nomura_mobile/nomura/domain/repository/repository.dart';
import 'package:nomura_mobile/nomura/domain/usecases/device_check_primality_usecase.dart';
import 'package:nomura_mobile/nomura/riverpod/device_check_primality/device_check_primality_state.dart';
import 'package:nomura_mobile/nomura/utils/url_utils.dart';

part 'device_check_primality_notifier.dart';

final deviceCheckPrimalityRepository = Provider.autoDispose<Repository>((ref) =>
    IRepository(
        remoteDataSource: DioDataSource(
            url:
                '${UrlUtils.prodUrl}/${UrlUtils.deviceCheckPrimalityEndPont}')));

final deviceCheckPrimalityProvider =
    Provider.autoDispose<DevicePrimalityCheckUsecase>((ref) {
  final repository = ref.watch(deviceCheckPrimalityRepository);
  return DevicePrimalityCheckUsecase(repository: repository);
});

final deviceCheckPrimalityNotifierProvider = StateNotifierProvider.autoDispose<
        DeviceCheckPrimalityNotifier, DeviceCheckPrimalityState>(
    (ref) => DeviceCheckPrimalityNotifier(
        devicePrimalityCheckUsecase: ref.watch(deviceCheckPrimalityProvider)));

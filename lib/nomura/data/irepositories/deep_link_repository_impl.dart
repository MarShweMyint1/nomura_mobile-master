// Copyright © 2022 Nevis Security AG. All rights reserved.

import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:nomura_mobile/nomura/data/deep_link/deep_link_datasource.dart';
import 'package:nomura_mobile/test_nevis/lib/domain/repository/deep_link_repository.dart';

@Injectable(as: DeepLinkRepository)
class DeepLinkRepositoryImpl implements DeepLinkRepository {
  final DeepLinkDataSource _deepLinkDataSource;

  DeepLinkRepositoryImpl(this._deepLinkDataSource);

  @override
  StreamSubscription setDeepLinkReceiver(void Function(dynamic)? onData,
      {Function? onError, void Function()? onDone, bool? cancelOnError}) {
    return _deepLinkDataSource.setDeepLinkReceiver(
      onData,
      onError: onError,
      onDone: onDone,
      cancelOnError: cancelOnError,
    );
  }

  @override
  Future<String?> getStartUri() async {
    return await _deepLinkDataSource.getStartUri();
  }
}

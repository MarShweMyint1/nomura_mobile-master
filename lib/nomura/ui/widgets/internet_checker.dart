import 'package:flutter/widgets.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:nomura_mobile/nomura/ui/widgets/dialog_widget.dart';

internetAvaliable(BuildContext context, Function() goto) async {
  if (await InternetConnectionChecker().hasConnection) {
  } else {
    okDialog(
      context,
      content: 'No Internet Connection Found!',
      onPressed: () => Navigator.pop(context),
      isSuccess: false,
    );
  }
}

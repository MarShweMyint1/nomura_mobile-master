import 'package:flutter/material.dart';
import 'package:nomura_mobile/nomura/ui/widgets/successful_widget.dart';

class DeregisterationSuccess extends StatelessWidget {
  const DeregisterationSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return SuccessfulWidget(
      status: 'You have successfully deregistered the device.',
      onClicked: () => Navigator.pop(context),
    );
  }
}

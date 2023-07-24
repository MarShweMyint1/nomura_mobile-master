import 'package:flutter/material.dart';
import 'package:nomura_mobile/nomura/ui/widgets/appbar_widget.dart';
import 'package:nomura_mobile/nomura/ui/widgets/face_id_widget.dart';
import 'package:nomura_mobile/nomura/ui/widgets/text_collections.dart';
import 'package:nomura_mobile/nomura/utils/color_utils.dart';
import 'package:nomura_mobile/nomura/utils/values_utils.dart';

class SetupFaceIDScreen extends StatelessWidget {
  const SetupFaceIDScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.primary,
      appBar: nomuraAppbar(context),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.all(AppMargin.m32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    titleText("Scan Face ID"),
                    const SizedBox(height: 60),
                    subtitleText(
                      "Complete the registration process by adding Face ID.",
                    ),
                    const SizedBox(height: 50),
                     FaceIDWidget(ontap: (){}),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

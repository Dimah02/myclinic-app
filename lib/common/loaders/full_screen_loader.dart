import 'package:flutter/material.dart';
import 'package:myclinic/common/loaders/animation_loaders.dart';
import 'package:myclinic/utils/constants/colors.dart';

class KFullScreenLoader {
  // Open a full-screen loading dialog wit a given text and animation

  static void openLoadingDialog(BuildContext context,
      {required String text,
      String animation = "assets/images/loading2.json"}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: KColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(
                height: 250,
              ),
              KAnimationLoaderWidget(text: text, animation: animation),
            ],
          ),
        ),
      ),
    );
  }

  static stopLoading(BuildContext context) {
    Navigator.of(context).pop();
  }
}

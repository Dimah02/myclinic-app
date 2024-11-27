import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:myclinic/utils/constants/colors.dart';

/// A widget for displaying an animated loading indicator with optional text and action button
class KAnimationLoaderWidget extends StatelessWidget {
  /// Parametes:
  /// - text: The text to be displayed below the animation
  /// - animation: The path to the lottie animation file
  /// - showAction: whether to show an action button below the text
  /// - actionText: the text to be diplayed on the acction button
  /// - onActionPressed: callback funtion to be executed when the action button is pressed

  const KAnimationLoaderWidget(
      {super.key,
      required this.text,
      required this.animation,
      this.showAction = false,
      this.actionText,
      this.onActionPressed});

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            animation,
            width: MediaQuery.of(context).size.width * 0.8,
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 24,
          ),
          showAction
              ? SizedBox(
                  width: 250,
                  child: OutlinedButton(
                    onPressed: onActionPressed,
                    style:
                        OutlinedButton.styleFrom(backgroundColor: KColors.dark),
                    child: Text(
                      actionText!,
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                            color: KColors.light,
                          ),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

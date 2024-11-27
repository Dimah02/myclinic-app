import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myclinic/utils/constants/colors.dart';
import 'package:myclinic/utils/helpers/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {super.key,
      this.image = "assets/images/emailsent.png",
      required this.title,
      required this.subtitle,
      this.btnText = "Continue",
      this.onPress,
      this.imagesvg});

  final String? image, imagesvg, btnText;
  final String title, subtitle;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsDirectional.only(
            top: 24 * 2,
            bottom: 24,
            start: 24,
            end: 24,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              (imagesvg != null)
                  ? SvgPicture.asset(
                      imagesvg!,
                      width: KHlper.screenWidth(context) * 0.8,
                    )
                  : Image.asset(
                      image!,
                      width: KHlper.screenWidth(context) * 0.6,
                    ),
              const SizedBox(
                height: 32,
              ),
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: KColors.black, fontSize: 22),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                subtitle,
                style: TextStyle(
                    color: KColors.black.withOpacity(0.7), fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 32,
              ),
              ElevatedButton(
                onPressed: onPress,
                child: Text(btnText!),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

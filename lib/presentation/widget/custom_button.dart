import 'package:app/presentation/widget/helper_widget.dart';
import 'package:app/resource/utils/extensions.dart';
import 'package:flutter/cupertino.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.bgColor,
    this.textColor,
    this.width,
    this.isLoading,
    this.radius,
  });
  final String text;
  final Function() onTap;
  final Color? bgColor;
  final Color? textColor;
  final double? width;
  final bool? isLoading;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.maxFinite,
      child: CupertinoButton(
        color: bgColor ?? context.theme.kBlack,
        padding: EdgeInsets.zero,
        borderRadius: radius != null
            ? BorderRadius.circular(radius!)
            : BorderRadius.circular(30),
        onPressed: isLoading ?? false ? null : onTap,
        child: CustomText(
          txt: text,
          color: textColor ?? context.theme.kWhite,
        ),
      ),
    );
  }
}

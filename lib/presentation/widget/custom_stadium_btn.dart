import 'package:app/resource/utils/common_lib.dart';
import 'package:app/resource/utils/extensions.dart';

class CustomStadiumBtn extends StatelessWidget {
  const CustomStadiumBtn({
    super.key,
    required this.text,
    this.txtColor,
    this.bgColor,
    this.enableBorder,
    this.onTap,
  });
  final String text;
  final Color? txtColor;
  final Color? bgColor;
  final bool? enableBorder;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 35,
        padding: EdgeInsets.symmetric(horizontal: inset.sm),
        decoration: ShapeDecoration(
          color: bgColor ?? context.theme.kBlack,
          shape: StadiumBorder(
            side: enableBorder ?? false
                ? BorderSide(
                    color: context.theme.kBlack,
                  )
                : BorderSide.none,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: $style.text.textBold12.copyWith(
            color: txtColor ?? context.theme.kWhite,
          ),
        ),
      ),
    );
  }
}

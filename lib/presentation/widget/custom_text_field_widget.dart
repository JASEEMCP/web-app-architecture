import 'package:app/presentation/widget/helper_widget.dart';
import 'package:app/resource/utils/common_lib.dart';
import 'package:app/resource/utils/extensions.dart';
import 'package:flutter/services.dart';


class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({
    super.key,
    this.obscureText,
    this.controller,
    this.validator,
    required this.label,
    this.suffix,
    this.type,
    this.inputFormatters,
    this.validate,
    this.readOnly,
  });

  final bool? readOnly;

  final bool? obscureText;
  final TextEditingController? controller;
  final String? Function(String? p1)? validator;
  final String label;
  final Widget? suffix;
  final TextInputType? type;
  final bool? validate;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          txt: label,
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Colors.indigo,
        ),
        Gap(inset.xxs),
        TextFormField(
          onTapOutside: (event) => FocusScope.of(context).unfocus,
          readOnly: readOnly ?? false,
          inputFormatters: inputFormatters,
          keyboardType: type,
          obscureText: obscureText ?? false,
          controller: controller,
          validator: validate ?? false
              ? validator ??
                  (value) {
                    if (value!.trim().isEmpty) {
                      return '* Required';
                    }
                    return null;
                  }
              : null,
          style: $style.text.textN12.copyWith(),
          decoration: InputDecoration(
            errorMaxLines: 3,
            //hintText: 'Enter email',
            suffixIcon: suffix,
            hintStyle: $style.text.textN12.copyWith(),
            contentPadding: const EdgeInsets.all(12),
            border: _applyBorder(context),
            focusedBorder: _applyBorder(context),
            enabledBorder: _applyBorder(context),
            errorBorder: _applyBorder(context),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder _applyBorder(BuildContext context) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: context.theme.kBlack,
      ),
      borderRadius: BorderRadius.circular(8),
    );
  }
}

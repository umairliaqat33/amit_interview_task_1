import 'package:amit_interview_task_1/config/size_config.dart';
import 'package:amit_interview_task_1/utils/colors.dart';
import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this.controller,
    required this.validator,
    required this.label,
    this.hintText = "",
    this.inputType = TextInputType.text,
    this.inputAction = TextInputAction.next,
    this.textAlign = TextAlign.left,
    this.fieldEnabled = true,
    this.maxLines = 1,
    this.maxLength,
    this.isLabelColorGiven = false,
    this.autoFocus = false,
    this.suffixIconFunction,
    this.suffixIcon,
    this.onChanged,
    this.textFieldFilled = true,
    this.minLines = 1,
    this.isBorderColorGiven = false,
    this.fillColor = textFieldFillColor,
  });
  final TextEditingController controller;
  final String hintText;
  final String label;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final FormFieldValidator validator;
  final TextAlign textAlign;
  final bool fieldEnabled;
  final int maxLines;
  final int minLines;
  final int? maxLength;
  final bool isLabelColorGiven;
  final bool autoFocus;
  final Function? suffixIconFunction;
  final IconData? suffixIcon;
  final Function? onChanged;
  final bool? textFieldFilled;
  final bool isBorderColorGiven;
  final Color fillColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label.isEmpty
            ? const SizedBox()
            : Padding(
                padding: const EdgeInsets.only(
                  left: 3,
                ),
                child: Text(
                  label,
                  style: TextStyle(
                    color: isLabelColorGiven ? whiteColor : Colors.black,
                    fontWeight:
                        isLabelColorGiven ? FontWeight.w400 : FontWeight.bold,
                    fontSize: isLabelColorGiven
                        ? SizeConfig.font12(context) + 1
                        : null,
                  ),
                ),
              ),
        SizedBox(
          height: SizeConfig.height8(context),
        ),
        TextFormField(
          enabled: fieldEnabled,
          controller: controller,
          textInputAction: inputAction,
          keyboardType: inputType,
          textAlign: textAlign,
          validator: validator,
          maxLines: maxLines,
          minLines: minLines,
          maxLength: maxLength,
          autofocus: autoFocus,
          style: TextStyle(
            color: fillColor == Colors.black ? whiteColor : Colors.black,
          ),
          onChanged: (value) => onChanged == null ? null : onChanged!(value),
          decoration: InputDecoration(
            hintText: hintText.isEmpty ? "" : hintText,
            hintStyle: TextStyle(
              color: fillColor == Colors.black ? whiteColor : greyColor,
            ),
            filled: textFieldFilled,
            fillColor: fillColor,
            suffixIcon: suffixIconFunction != null && suffixIcon != null
                ? IconButton(
                    onPressed: () => suffixIconFunction!(),
                    icon: Icon(
                      suffixIcon,
                      color: primaryColor,
                    ),
                  )
                : null,
            contentPadding: const EdgeInsets.all(
              10,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  10,
                ),
              ),
              borderSide: BorderSide(
                color: isBorderColorGiven ? whiteColor : Colors.black,
                width: 3,
              ),
            ),
            disabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  10,
                ),
              ),
              borderSide: BorderSide(
                color: Colors.grey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  10,
                ),
              ),
              borderSide: BorderSide(
                color: isBorderColorGiven ? whiteColor : Colors.black,
                width: 3,
              ),
            ),
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  10,
                ),
              ),
              borderSide: BorderSide(
                color: redColor,
              ),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  10,
                ),
              ),
              borderSide: BorderSide(
                color: redColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

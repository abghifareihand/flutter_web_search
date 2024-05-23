import 'package:flutter/material.dart';
import 'package:wifipos_web/core/constants/colors.dart';

import '../constants/fonts.dart';

enum InputFieldStyle {
  text,
  email,
  password,
  number,
}

class InputField extends StatefulWidget {
  final InputFieldStyle style;
  final String label;
  final TextInputType inputType;
  final TextEditingController? controller;

  const InputField.text({
    super.key,
    required this.label,
    this.controller,
    this.inputType = TextInputType.text,
    this.style = InputFieldStyle.text,
  });

  const InputField.email({
    super.key,
    required this.label,
    this.controller,
    this.inputType = TextInputType.emailAddress,
    this.style = InputFieldStyle.email,
  });

  const InputField.password({
    super.key,
    required this.label,
    this.controller,
    this.inputType = TextInputType.visiblePassword,
    this.style = InputFieldStyle.password,
  });

  const InputField.number({
    super.key,
    required this.label,
    this.controller,
    this.inputType = TextInputType.number,
    this.style = InputFieldStyle.number,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: AppFont.blackText.copyWith(
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(height: 8.0),
          Container(
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: TextFormField(
              controller: widget.controller,
              keyboardType: widget.inputType,
              textCapitalization: widget.style == InputFieldStyle.text
                  ? TextCapitalization.words
                  : TextCapitalization.none,
              textInputAction: widget.style == InputFieldStyle.password
                  ? TextInputAction.done
                  : TextInputAction.next,
              obscureText: _obscureText
                  ? widget.style == InputFieldStyle.password
                  : false,
              cursorColor: AppColor.primary,
              style: AppFont.blackText.copyWith(
                fontWeight: medium,
              ),
              decoration: InputDecoration(
                hintText: 'Enter your ${widget.label.toLowerCase()}',
                hintStyle: AppFont.greyText.copyWith(
                  fontSize: 14,
                  fontWeight: regular,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(color: AppColor.grey300),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(color: AppColor.grey300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: AppColor.primary,
                    width: 2,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 14.0,
                  horizontal: 12.0,
                ),
                suffixIcon: widget.style == InputFieldStyle.password
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        child: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color:
                              _obscureText ? AppColor.grey300 : AppColor.primary,
                        ),
                      )
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

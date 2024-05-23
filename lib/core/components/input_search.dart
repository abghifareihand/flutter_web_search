import 'package:flutter/material.dart';
import 'package:wifipos_web/core/constants/colors.dart';
import 'package:wifipos_web/core/constants/fonts.dart';

class InputSearch extends StatelessWidget {
  final TextEditingController controller;
  const InputSearch({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: TextFormField(
        controller: controller,
        textInputAction: TextInputAction.done,
        cursorColor: AppColor.primary,
        style: AppFont.blackText.copyWith(
          fontWeight: medium,
        ),
        decoration: InputDecoration(
          hintText: 'Search username atau lokasi',
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
        ),
      ),
    );
  }
}

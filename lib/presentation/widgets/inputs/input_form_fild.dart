import 'package:binance_implementation/config/themes/primary_config.dart';
import 'package:flutter/material.dart';


class InputFormField extends StatelessWidget {


  const InputFormField({
    super.key,
    this.keyboardType,
    this.suffixIcon,
    this.obscureText,
    required this.controller,
    required this.title,
    this.validator,
  });
  
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final String? title;
  final bool? obscureText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title != null
            ? Text(
                title!,
                style: const TextStyle(
                  color: PrimaryConfig.textColor,
                  fontSize: 16,
                ),
              )
            : const SizedBox(),
        const SizedBox(
          height: 5,
        ),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(left: 16),
          margin: EdgeInsets.zero,
          height: 60,
          decoration: BoxDecoration(color: PrimaryConfig.secondaryColor, borderRadius: BorderRadius.circular(5)),
          child: TextFormField(
            obscureText: obscureText ?? false,
            keyboardType: keyboardType,
            controller: controller,
            cursorColor: PrimaryConfig.primaryColor,
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              border: InputBorder.none,
              suffixIcon: suffixIcon,
              errorStyle: const TextStyle(color: Colors.red, fontSize: 10),
            ),
            style: const TextStyle(color: Colors.white),
            validator: validator,
            
          ),
        )
      ],
    );
  }
}
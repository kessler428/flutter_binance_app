import 'package:binance_implementation/config/themes/primary_config.dart';
import 'package:flutter/material.dart';


class NavigationButton extends StatelessWidget {

  const NavigationButton({
    super.key,
    required this.btnName,
    this.txtColor,
    this.backgroundColor,
    this.iconImage,
    required this.onPressed,
  });

  final String? btnName;
  final Color? txtColor;
  final Color? backgroundColor;
  final String? iconImage;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: backgroundColor ?? PrimaryConfig.primaryButtonColor),
        onPressed: onPressed,
        child: SizedBox(
          height: 50,
          child: Center(
              child: Row(
            children: [
              iconImage != null
                  ? Image.asset(
                      iconImage!,
                      width: 20,
                    )
                  : const SizedBox(),
              Expanded(
                  child: Center(
                child: Text(
                  btnName!,
                  style: TextStyle(
                    color: txtColor ?? Colors.white,
                    fontSize: 17,
                  ),
                ),
              ))
            ],
          )),
        ));
  }
}
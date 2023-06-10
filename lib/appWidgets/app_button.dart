import 'package:flutter/material.dart';
import 'package:razasheikhtest/app_constants/app_colors.dart';

// ignore: must_be_immutable
class ApplicationButton extends StatelessWidget {

  String? title;
  VoidCallback? onPressed;
  bool? fillColor;
  ApplicationButton(
      {super.key,
      required this.title,
      required this.onPressed,
      required this.fillColor});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 100;
    var width = MediaQuery.of(context).size.width / 100;
    return InkWell(
      onTap: onPressed!,
      child: Container(
        padding: const EdgeInsets.only(top: 10),
        width: 65 * width,
        height: 7 * height,
        decoration: BoxDecoration(
            border: fillColor == true
                ? Border.all(
                    color: Theme.of(context).secondaryHeaderColor, width: 1)
                : null,
            borderRadius: BorderRadius.circular(25),
            color: fillColor == true
                ? Colors.transparent
                : AppColors.primaryColor),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Text(
              title!,
              textAlign: TextAlign.center,
              softWrap: true, style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
              fontSize: 14,
              fontFamily: "Gotham-Black",
            ),
              textScaleFactor: 1.3,
            ),
          ),
        ),
      ),
    );
  }
}

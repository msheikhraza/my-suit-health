import 'package:flutter/material.dart';
import 'package:razasheikhtest/app_constants/app_colors.dart';

class DialogHandler {
  static showLoaderDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return  Dialog(
          backgroundColor: Colors.white.withOpacity(0.0),
          insetPadding: EdgeInsets.zero,
          child: const Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryColor,

            ),
          ),
        );
      },
    );
  }
}

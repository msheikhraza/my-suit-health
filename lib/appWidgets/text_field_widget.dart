
import 'package:flutter/material.dart';
import 'package:razasheikhtest/app_constants/app_colors.dart';
import 'package:razasheikhtest/utils/responsive.dart';

// ignore: must_be_immutable
class TextFieldWidget extends StatefulWidget {
  String? hint;
  String? label;
  String? error;
  TextInputType textInputType;
  bool? isPassword, isEmail, isPhone, isPass, isDisable;
  bool readonly;
  TextEditingController? controller = TextEditingController();
  Function()? onTab;

  TextFieldWidget(this.hint, this.label, String this.error,
      {Key? key,
        bool this.isPassword = false,
        bool this.isEmail = false,
        bool this.isPhone = false,
        bool this.isPass = false,
        this.readonly = false,
        bool this.isDisable = true,
        this.onTab,
        this.textInputType = TextInputType.text,
        this.controller})
      : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  FocusNode myFocusNode = FocusNode();

  Responsive response = Responsive();

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    response.setContext(context);
    return TextFormField(
      focusNode: myFocusNode,
      enabled: widget.isDisable,
      validator: widget.isEmail == true
          ? (value) {
        return validateEmail(value!);
      }
          : widget.isPass == true
          ? (value) {
        return validatePassword(value);
      }
          : (value) {
        if (value!.isEmpty) {
          return " ${widget.error}";
        } else if (value.length > 200) {
          return "Can't be greater than 200 character ";
        }
        return null;
      },
      cursorColor: Theme.of(context).primaryColor,
      controller: widget.controller,
      autofocus: false,
      showCursor: true,
      textAlign: TextAlign.start,
      obscureText: widget.isPass == true ? _obscureText : false,
      obscuringCharacter: '*',
      keyboardType: widget.textInputType,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(top: 10),
        suffixIcon: widget.isPass == true
            ? GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: AppColors.primaryColor,
          ),
        ):
            widget.isEmail==true?Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.primaryColor)
                  ),
                  child: const Icon(Icons.done ,size: 14,color: AppColors.primaryColor)),
            ): const SizedBox(
          height: 0,
          width: 0,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.4)),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color: widget.isDisable == true
                  ? Colors.red
                  : Theme.of(context).primaryColor,
              width: 1),
        ),
        focusedErrorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color:  AppColors.primaryColor,   ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color:   AppColors.primaryColor,   ),
        ),
        labelStyle: TextStyle(
            color:
            myFocusNode.hasFocus ? AppColors.primaryColor :  AppColors.darkColor,
            fontSize: response.setTextScale(14)),
        labelText: widget.hint,
        helperStyle: TextStyle(fontSize: response.setTextScale(16)),
        border: InputBorder.none,
      ),
    );
  }


  String? validateEmail(String value) {
    if (RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return null;
    } else {
      return 'Please Enter valid Email';
    }
  }

  String? validatePassword(String? value) {
    if (value!.length >= 6) {
      return null;
    } else {
      return 'password must be at least 6 characters';
    }
  }
}

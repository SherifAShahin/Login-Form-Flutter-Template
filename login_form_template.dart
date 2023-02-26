import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Widget defaultButton({
  double width = 280.0,
  double height = 64.0,
  String hexColor = '#045255',
  double borderRadius = 15.0,
  required Function()? onPressed,
  required String text,
  Color textColor = Colors.white,
  double fontSize = 25.0,
}) => Container(
  width: width,
  height: height,
  decoration: BoxDecoration(
    color: HexColor(
      hexColor,
    ),
    borderRadius: BorderRadius.circular(
      borderRadius,
    ),
  ),
  child: MaterialButton(
    onPressed: onPressed,
    child: Text(
      text,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
      ),
    ),
  ),
);

Widget defaultTextFormField({
  double height = 50.0,
  Color color = Colors.white,
  double borderRadius = 15.0,
  required var controller,
  required TextInputType keyboardType,
  required String label,
  required bool isPassword,
  ValueChanged? onSubmit,
  required FormFieldValidator validate,
  bool labelIsOn = false,
  IconData? suffixIcon,
  Function()? suffixPressed,
}) => Container(
  height: height,
  padding: EdgeInsetsDirectional.only(
    start: 10.0,
  ),
  decoration: BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(
      borderRadius,
    ),
  ),
  child: TextFormField(
    controller: controller,
    keyboardType: keyboardType,
    obscureText: isPassword,
    onFieldSubmitted: onSubmit,
    validator: validate,

    decoration: InputDecoration(
      labelText: label,
      suffixIcon: suffixIcon != null ? IconButton(
        highlightColor: HexColor('#e3c099'),
        onPressed: suffixPressed,
        icon: Icon(
          suffixIcon,
        ),
      ) : null,
      floatingLabelBehavior: labelIsOn ? FloatingLabelBehavior.auto : FloatingLabelBehavior.never,
      border: InputBorder.none,
    ),
  ),
);


bool loginIsPassword = true;
Widget defaultLoginForm({
  required GlobalKey<FormState> formKey,
  required var usernameController,
  required var passwordController,
  required Function()? onPressed,
  required Function()? suffixPressed,
  required Function()? textButtonOnPressed,
  double padding = 25.0,
  double titleFontSize = 62.6,
  double dontHaveAccountTextFontSize = 18.5,
  double textButtonFontSize = 18.5,
  double buttonFontSize = 25.0,
  double buttonWidth = 280.0,
  double buttonHeight = 64.0,
  double buttonBorderRadius = 15.0,
  TextInputType usernameKeyboardType = TextInputType.text,
  TextInputType passwordKeyboardType = TextInputType.visiblePassword,
  String title = 'Login',
  String usernameLabel = 'Username',
  String passwordLabel = 'Password',
  String usernameValidateMessage = 'user name should not be empty!',
  String passwordValidateMessage = 'password should not be empty!',
  String buttonText = 'login',
  String dontHaveAccountText = 'don’t have an account?, ',
  String textButtonTitle = 'sign up...',
  String textButtonColor = '#045255',
  String buttonHexColor = '#045255',
  IconData suffixOff = Icons.visibility_off,
  IconData suffixOn = Icons.visibility,
  Color buttonTextColor = Colors.white,
  Color dontHaveAccountTextColor = Colors.white,
  FontWeight textButtonFontWeight = FontWeight.w700,
  FontWeight titleFontWeight = FontWeight.w700,
  FontWeight dontHaveAccountTextFontWeight = FontWeight.w400,
}) => Form(
  key: formKey,
  child: Padding(
    padding: EdgeInsets.symmetric(
      horizontal: padding,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
      [
        Text(
          title,
          style: TextStyle(
            fontWeight: titleFontWeight,
            fontSize: titleFontSize,

          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        defaultTextFormField(
          controller: usernameController,
          keyboardType: usernameKeyboardType,
          label: usernameLabel,
          isPassword: false,
          validate: (value)
          {
            if(value!.isEmpty)
            {
              return usernameValidateMessage;
            }
            return null;
          },
        ),
        SizedBox(
          height: 10.0,
        ),
        defaultTextFormField(
          controller: passwordController,
          keyboardType: passwordKeyboardType,
          label: passwordLabel,
          isPassword: loginIsPassword,
          suffixIcon: loginIsPassword ? suffixOff : suffixOn,
          suffixPressed: suffixPressed,
          validate: (value)
          {
            if(value!.isEmpty)
            {
              return passwordValidateMessage;
            }
            return null;
          },
        ),
        SizedBox(
          height: 10.0,
        ),
        Center(
          child: defaultButton(
            onPressed: onPressed,
            text: buttonText,
            textColor: buttonTextColor,
            fontSize: buttonFontSize,
            borderRadius: buttonBorderRadius,
            height: buttonHeight,
            width: buttonWidth,
            hexColor: buttonHexColor,
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            Text(
              dontHaveAccountText,
              style: TextStyle(
                color: dontHaveAccountTextColor,
                fontWeight: dontHaveAccountTextFontWeight,
                fontSize: dontHaveAccountTextFontSize,
              ),
            ),
            TextButton(
              onPressed: textButtonOnPressed,
              child: Text(
                textButtonTitle,
                style: TextStyle(
                  color: HexColor(
                    textButtonColor,
                  ),
                  fontWeight: textButtonFontWeight,
                  fontSize: textButtonFontSize,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  ),
);

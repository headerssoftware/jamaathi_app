import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppTheme {
  static const Color liteGreenColor = Color(0xFFE0F7EE);
  static const Color cardColor = Color(0xFFcff2f0);
  static const Color appColor = Color(0xFF003230);
  static const Color greenColor = Color(0xFF008000);
  static const Color backColor = Color(0xFFC8D6DD);
  static const Color redColor = Color(0xFF9A2121);
  static const Color textColor = Color(0xFF101010);
}

class Pages {
  static const Gradient backgroundGradient = LinearGradient(
      stops: [0.6, 1],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: backgroundGradientColor);
  static const List<Color> backgroundGradientColor = [
    Color(0xff5D0557),
    Color(0xff140034)
  ];
}

class FormThemes {
  static const Color appTheme = Color(0xff9cb533);
  static const Color appLabelColor = Color(0xff202020);
  static const Color appHeaderColor = Color(0xff9e7d49);
  static const Widget SpaceDivider = SizedBox(height: 20.0);
  static const Color inputBorderColor = Color(0x33252525);

  static const TextStyle formHeaderStyle = TextStyle(
      fontSize: 20.0, color: Color(0xff202020), fontWeight: FontWeight.bold);

  // Textinput
  static const Color labelColor = Colors.white;
  static const BorderRadius inputBorderRadius =
      BorderRadius.all(Radius.circular(8.0));

  static const Map<String, OutlineInputBorder> inputOutlineBorder = {
    "focusedBorder": OutlineInputBorder(
      borderRadius: inputBorderRadius,
      borderSide: BorderSide(color: inputBorderColor),
    ),
    "disabledBorder": OutlineInputBorder(
      borderRadius: inputBorderRadius,
      borderSide: BorderSide(color: inputBorderColor),
    ),
    "enabledBorder": OutlineInputBorder(
      borderRadius: inputBorderRadius,
      borderSide: BorderSide(color: inputBorderColor),
    ),
    "errorBorder": OutlineInputBorder(
      borderRadius: inputBorderRadius,
      borderSide: BorderSide(color: inputBorderColor),
    ),
    "focusedErrorBorder": OutlineInputBorder(
      borderRadius: inputBorderRadius,
      borderSide: BorderSide(color: inputBorderColor),
    ),
    "border": OutlineInputBorder(
      borderRadius: inputBorderRadius,
      borderSide: BorderSide(color: inputBorderColor),
    )
  };

  static const BorderRadius inputLeftBorderRadius = BorderRadius.only(
      topLeft: Radius.circular(10), bottomLeft: Radius.circular(10));

  static const Map<String, OutlineInputBorder> inputLeftOutlineBorder = {
    "focusedBorder": OutlineInputBorder(
      borderRadius: inputLeftBorderRadius,
      borderSide: BorderSide(color: inputBorderColor),
    ),
    "disabledBorder": OutlineInputBorder(
      borderRadius: inputLeftBorderRadius,
      borderSide: BorderSide(color: inputBorderColor),
    ),
    "enabledBorder": OutlineInputBorder(
      borderRadius: inputLeftBorderRadius,
      borderSide: BorderSide(color: inputBorderColor),
    ),
    "errorBorder": OutlineInputBorder(
      borderRadius: inputLeftBorderRadius,
      borderSide: BorderSide(color: inputBorderColor),
    ),
    "focusedErrorBorder": OutlineInputBorder(
      borderRadius: inputLeftBorderRadius,
      borderSide: BorderSide(color: inputBorderColor),
    ),
    "border": OutlineInputBorder(
      borderRadius: inputLeftBorderRadius,
      borderSide: BorderSide(color: inputBorderColor),
    )
  };

  static const BorderRadius inputRightBorderRadius = BorderRadius.only(
      topRight: Radius.circular(10), bottomRight: Radius.circular(10));

  static const Map<String, OutlineInputBorder> customRightDropdownBorder = {
    "focusedBorder": OutlineInputBorder(
      borderRadius: inputRightBorderRadius,
      borderSide: BorderSide(color: inputBorderColor),
    ),
    "disabledBorder": OutlineInputBorder(
      borderRadius: inputRightBorderRadius,
      borderSide: BorderSide(color: inputBorderColor),
    ),
    "enabledBorder": OutlineInputBorder(
      borderRadius: inputRightBorderRadius,
      borderSide: BorderSide(color: inputBorderColor),
    ),
    "errorBorder": OutlineInputBorder(
      borderRadius: inputRightBorderRadius,
      borderSide: BorderSide(color: inputBorderColor),
    ),
    "focusedErrorBorder": OutlineInputBorder(
      borderRadius: inputRightBorderRadius,
      borderSide: BorderSide(color: inputBorderColor),
    ),
    "border": OutlineInputBorder(
      borderRadius: inputRightBorderRadius,
      borderSide: BorderSide(color: inputBorderColor),
    )
  };
  // Buttons
  static MaterialStateProperty<Color> Function(Color btnBGColor) buttonBgColor =
      (btnBGColor) => MaterialStateProperty.all<Color>(btnBGColor);
  static MaterialStateProperty<Color> Function(Color btnFGColor) buttonFgColor =
      (btnFGColor) => MaterialStateProperty.all<Color>(btnFGColor);

  // Text buttons
  static MaterialStateProperty<TextStyle> Function({Color textColor})
      textButtonStyle = ({textColor = Colors.white}) =>
          MaterialStateProperty.all<TextStyle>(TextStyle(color: textColor));

  // Form input
  static const Color formLabelColor = appLabelColor;
  static const Color formInputColor = appTheme;

  // Form Radio
  static const Color formRadioSelectedColor = appTheme;
  static const Color formRadioUnSelectedColor = Color(0xffF1F6FB);
  static MaterialStateProperty<Color> formRadioSelectedLabelColor =
      MaterialStateProperty.all<Color>(Colors.white);
  static MaterialStateProperty<Color> formRadioUnSelectedLabelColor =
      MaterialStateProperty.all<Color>(appLabelColor);

  // Form Dropdown
  static const Color formDropdownBorderColor = Color(0xffF5F5F5);
  static const Map<String, OutlineInputBorder> formDropdownBorder = {
    "focusedBorder": OutlineInputBorder(
      borderRadius: inputBorderRadius,
      borderSide: BorderSide(color: formDropdownBorderColor),
    ),
    "disabledBorder": OutlineInputBorder(
      borderRadius: inputBorderRadius,
      borderSide: BorderSide(color: formDropdownBorderColor),
    ),
    "enabledBorder": OutlineInputBorder(
      borderRadius: inputBorderRadius,
      borderSide: BorderSide(color: formDropdownBorderColor),
    ),
    "errorBorder": OutlineInputBorder(
      borderRadius: inputBorderRadius,
      borderSide: BorderSide(color: formDropdownBorderColor),
    ),
    "focusedErrorBorder": OutlineInputBorder(
      borderRadius: inputBorderRadius,
      borderSide: BorderSide(color: formDropdownBorderColor),
    ),
    "border": OutlineInputBorder(
      borderRadius: inputBorderRadius,
      borderSide: BorderSide(color: Colors.white),
    )
  };

  // Dropdown
  static const Color dropdownBorderColor = Color(0xff772D82);
  static const Map<String, OutlineInputBorder> dropdownBorder = {
    "focusedBorder": OutlineInputBorder(
      borderRadius: inputBorderRadius,
      borderSide: BorderSide(color: dropdownBorderColor),
    ),
    "disabledBorder": OutlineInputBorder(
      borderRadius: inputBorderRadius,
      borderSide: BorderSide(color: dropdownBorderColor),
    ),
    "enabledBorder": OutlineInputBorder(
      borderRadius: inputBorderRadius,
      borderSide: BorderSide(color: dropdownBorderColor),
    ),
    "errorBorder": OutlineInputBorder(
      borderRadius: inputBorderRadius,
      borderSide: BorderSide(color: dropdownBorderColor),
    ),
    "focusedErrorBorder": OutlineInputBorder(
      borderRadius: inputBorderRadius,
      borderSide: BorderSide(color: dropdownBorderColor),
    ),
    "border": OutlineInputBorder(
      borderRadius: inputBorderRadius,
      borderSide: BorderSide(color: dropdownBorderColor),
    )
  };

  // Form checkbox
  static Color checkBoxColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
      MaterialState.selected
    };
    if (states.any(interactiveStates.contains)) {
      return Color(0xff34C759);
    }
    return Color(0xffD4D4D4);
  }

  // Gradient Buttons
  static const Gradient successBtnGradient = LinearGradient(
      stops: [0, 1],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: successBtnGradientColor);
  static const List<Color> successBtnGradientColor = [
    Color(0xff34C759),
    Color(0xff00711D)
  ];

  // Danger gradient
  static const Gradient dangerBtnGradient = LinearGradient(
      stops: [0, 1],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: dangerBtnGradientColor);
  static const List<Color> dangerBtnGradientColor = [
    Color(0xffFF3737),
    Color(0xffBE0000)
  ];

  // Stupid designer
  static const Gradient pinkBtnGradient = LinearGradient(
      stops: [0, 1],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: pinkBtnGradientColor);
  static const List<Color> pinkBtnGradientColor = [
    Color(0xffF9468E),
    Color(0xffCB0052)
  ];

  // Stupid designer
  static const Gradient warningBtnGradient = LinearGradient(
      stops: [0, 1],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: warningBtnGradientColor);
  static const List<Color> warningBtnGradientColor = [
    Color(0xffFCDE41),
    Color(0xffFDB107)
  ];

  static const Gradient disableBtnGradient = LinearGradient(
      stops: [0, 1],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: disableBtnGradientColor);
  static const List<Color> disableBtnGradientColor = [
    Color(0xffB0B3C4),
    Color(0xff808895)
  ];
}

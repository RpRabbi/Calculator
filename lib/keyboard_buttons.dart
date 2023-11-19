import 'constants.dart';
import "package:flutter/material.dart";

typedef void CallbackButtonTap({String buttonText});

class KeyboardButtons extends StatefulWidget {
  KeyboardButtons({required this.buttons, required this.onTap});

  final List<String> buttons;
  final CallbackButtonTap onTap;

  @override
  _KeyboardButtonsState createState() => _KeyboardButtonsState();
}

class _KeyboardButtonsState extends State<KeyboardButtons> {
  bool _isButtonPressed = false;

  Color _buttonColor(String button) {
    if (button == EQUAL_SIGN || button == CLEAR_ALL_SIGN) {
      return Colors.amber; // Gold color for "AC" and "=" buttons
    } else if (button == PLUS_SIGN ||
        button == MINUS_SIGN ||
        button == MODULAR_SIGN ||
        button == MULTIPLICATION_SIGN ||
        button == DIVISION_SIGN ||
        button == E_NUM ||
        button == DECIMAL_POINT_SIGN) {
      return Colors.blueGrey[600]!; // Blue Grey 600 color for these buttons
    } else if (button == ZERO ||
        button == ONE ||
        button == TWO ||
        button == THREE ||
        button == FOR ||
        button == FIVE ||
        button == SIX ||
        button == SEVEN ||
        button == EIGHT ||
        button == NINE) {
      return Color(0xFF007FFF); // Azure blue color for numbers
    }
    return _isButtonPressed ? Color(0xFF000000) : Color(0xFFDDDDDD);
  }

  void _handleButtonPress() {
    setState(() {
      _isButtonPressed = true;
    });

    // Delay for 0.5 seconds to show the press effect
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _isButtonPressed = false;
      });
    });
  }

  bool _colorTextButtons(String button) {
    return (button == DEL_SIGN ||
        button == DECIMAL_POINT_SIGN ||
        button == CLEAR_ALL_SIGN ||
        button == MODULAR_SIGN ||
        button == PLUS_SIGN ||
        button == MINUS_SIGN ||
        button == MULTIPLICATION_SIGN ||
        button == DIVISION_SIGN ||
        button == EXCHANGE_CALCULATOR ||
        button == PI ||
        button == SQUARE_ROOT_SIGN ||
        button == POWER_SIGN ||
        button == LN_SIGN ||
        button == LG_SIGN ||
        button == SIN_SIGN ||
        button == COS_SIGN ||
        button == TAN_SIGN ||
        button == RAD_SIGN ||
        button == DEG_SIGN ||
        button == ARCSIN_SIGN ||
        button == ARCCOS_SIGN ||
        button == ARCTAN_SIGN ||
        button == LN2_SIGN ||
        button == LEFT_QUOTE_SIGN ||
        button == RIGHT_QUOTE_SIGN);
  }

  bool _fontSize(String button) {
    return (button == LN_SIGN ||
        button == LG_SIGN ||
        button == SIN_SIGN ||
        button == COS_SIGN ||
        button == TAN_SIGN ||
        button == RAD_SIGN ||
        button == DEG_SIGN ||
        button == ARCSIN_SIGN ||
        button == ARCCOS_SIGN ||
        button == ARCTAN_SIGN ||
        button == LN2_SIGN ||
        button == LEFT_QUOTE_SIGN ||
        button == RIGHT_QUOTE_SIGN);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(8.0), // Add margin to the button
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: _buttonColor(widget.buttons[0]), // Button color
            padding: EdgeInsets.all(16.0), // Add padding to the button
          ),
          onPressed: () {
            _handleButtonPress(); // Handle button press effect
            widget.onTap(buttonText: widget.buttons[0]);
          },
          child: Text(
            widget.buttons[0],
            style: TextStyle(
              color: (_colorTextButtons(widget.buttons[0]))
                  ? Colors.blueAccent
                  : (widget.buttons[0] == EQUAL_SIGN)
                      ? Colors.blue // Change this to the desired color
                      : Color(0xFF444444),
              fontSize: _fontSize(widget.buttons[0]) ? 18 : 20.0,
            ),
          ),
        ),
      ),
    );
  }
}

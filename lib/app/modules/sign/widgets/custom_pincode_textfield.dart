import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../shared/utilities.dart';

class CustomPinCodeTextField extends StatefulWidget {
  final TextEditingController? controller;
  const CustomPinCodeTextField({Key? key, this.controller}) : super(key: key);

  @override
  _CustomPinCodeTextFieldState createState() => _CustomPinCodeTextFieldState();
}

class _CustomPinCodeTextFieldState extends State<CustomPinCodeTextField> {
  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      controller: widget.controller,
      keyboardType: TextInputType.number,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(19),
        fieldHeight: wXD(78, context),
        fieldWidth: wXD(51, context),
        // borderWidth: 1,
        // activeFillColor: getColors(context).primary,
        // selectedFillColor: getColors(context).primary,
        // inactiveFillColor: getColors(context).secondary,
        // selectedColor: getColors(context).secondary,
        inactiveColor: Colors.white,
        inactiveFillColor: Colors.white,
        selectedColor: Colors.black,
        selectedFillColor: Colors.white,
        activeColor: Colors.white,
        activeFillColor: Colors.white,
      ),
      textStyle: getStyles(context).labelLarge?.copyWith(color: Colors.black),
      boxShadows: const [
        BoxShadow(
          offset: Offset(0.5, 3),
          color: Color(0x30000000),
          blurRadius: 4,
        )
      ],
      enableActiveFill: true,
      appContext: context,
      length: 6,
      obscureText: false,
      animationType: AnimationType.fade,
      onChanged: (value) {
        print(value);
      },
    );
  }
}

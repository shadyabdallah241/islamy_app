import 'package:flutter/material.dart';

class RadioButton extends StatefulWidget {
  final String buttonText;
  final Color buttonTextColor;
  final Color buttonColor;
  final bool isActive;

  const RadioButton({
    super.key,
    required this.buttonText,
    required this.buttonTextColor,
    required this.buttonColor,
    required this.isActive,
  });

  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () {},
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: widget.buttonColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            widget.buttonText,
            style: TextStyle(color: widget.buttonTextColor, fontWeight: .bold),
            textAlign: .center,
          ),
        ),
      ),
    );
  }
}

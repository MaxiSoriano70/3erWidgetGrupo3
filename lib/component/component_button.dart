import 'package:flutter/material.dart';

///este es el custom button del Bingo

class CustomButton2 extends StatefulWidget {
  final String text;
  final double height;
  final double width;
  final Color backgroundColor;
  final Color textColor;
  final Color iconColor;
  final double? textSize;
  final double? iconSize;
  final FontWeight textWeight;
  bool isEnabled;
  Function? onTap;
  final IconData? icon;
  final String? iconPath;
  final Color borderColor;
  final double borderWidth;

  CustomButton2({
    super.key,
    required this.text,
    this.height = 60,
    this.width = 300,
    this.backgroundColor = Colors.teal,
    this.textColor = Colors.white,
    this.borderColor = Colors.transparent,
    this.borderWidth = 1,
    this.isEnabled = true,
    this.onTap,
    this.icon,
    this.textWeight = FontWeight.normal,
    this.iconPath,
    this.iconColor = Colors.white,
    this.textSize,
    this.iconSize,
  });

  @override
  State<CustomButton2> createState() => _CustomButton2State();
}

class _CustomButton2State extends State<CustomButton2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        border: Border.all(
          width: widget.borderWidth,
          color: widget.borderColor,
        ),
        borderRadius: BorderRadius.circular(widget.height / 2),
        color: widget.isEnabled ? widget.backgroundColor : Colors.grey,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          hoverColor:
          widget.isEnabled ? widget.backgroundColor : Colors.transparent,
          splashFactory: widget.isEnabled
              ? InkSplash.splashFactory
              : NoSplash.splashFactory,
          borderRadius: BorderRadius.circular(widget.height / 2),
          onTap: _onTap,
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _Icon(),
                _text(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTap() {
    widget.isEnabled ? widget.onTap!() : null;
  }

  Widget _Icon() {
    if (widget.iconPath != null) {
      return Padding(
        padding: const EdgeInsets.only(right: 5),
        child: Image.asset(
          widget.iconPath!,
          height: widget.iconSize ?? (widget.height / 2),
          width: widget.iconSize ?? (widget.height / 2),
          fit: BoxFit.cover,
          color: widget.iconColor,
        ),
      );
    }

    if (widget.icon != null && widget.iconPath == null) {
      return Padding(
        padding: const EdgeInsets.only(right: 5),
        child: Icon(
          widget.icon!,
          color: widget.iconColor,
          size: widget.iconSize ?? (widget.height / 2),
        ),
      );
    }

    return const SizedBox.shrink();
  }

  Widget _text() {
    return Text(
      widget.text,
      style: TextStyle(
        fontWeight: widget.textWeight,
        color: widget.textColor,
        fontSize: widget.textSize ?? (widget.height / 2),
        letterSpacing: 3,
      ),
    );
  }
}
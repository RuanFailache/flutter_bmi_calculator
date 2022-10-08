import 'package:flutter/material.dart';

class CircleIconButton extends StatelessWidget {
  const CircleIconButton({
    Key? key,
    this.size = 48,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  final double size;
  final IconData icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0,
      onPressed: onPressed,
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: size,
        height: size,
      ),
      child: Icon(icon),
    );
  }
}

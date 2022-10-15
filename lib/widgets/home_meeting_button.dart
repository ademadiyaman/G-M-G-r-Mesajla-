import 'package:flutter/material.dart';
import 'package:zoom_clone/utils/colors.dart';

class HomeMeetingButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String text;
  const HomeMeetingButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(9),
              boxShadow: [
                BoxShadow(
                  blurRadius: 11,
                  color: Colors.black.withOpacity(0.46),
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            width: 65,
            height: 65,
            child: Icon(
              icon,
              color: Colors.white,
              size: 31,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            text,
            style: const TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

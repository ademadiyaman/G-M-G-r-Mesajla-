import 'package:flutter/material.dart';
import 'package:zoom_clone/utils/colors.dart';

class MeetingOption extends StatelessWidget {
  final bool isMute;
  final String text;
  final Function(bool) onChange;
  const MeetingOption(
      {Key? key,
      required this.onChange,
      required this.text,
      required this.isMute})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: secondaryBackgroungColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          Switch.adaptive(value: isMute, onChanged: onChange),
        ],
      ),
    );
  }
}

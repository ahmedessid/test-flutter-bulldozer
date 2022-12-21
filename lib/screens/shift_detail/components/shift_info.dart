import 'package:flutter/material.dart';

Row shiftInfo(infoIcon, infoText) {
  return Row(
      children: [Icon(infoIcon), const SizedBox(width: 10), Text(infoText)]);
}

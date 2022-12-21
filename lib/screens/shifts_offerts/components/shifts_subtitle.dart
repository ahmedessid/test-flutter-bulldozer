import 'package:flutter/material.dart';

import 'package:test_flutter_bulldozer/utils/colors/colors.dart';

Text shiftsSubtitle(subtitle) {
  return Text(
    subtitle.toUpperCase(),
    style: TextStyle(color: kGrey35, fontSize: 12, fontWeight: FontWeight.w500),
  );
}

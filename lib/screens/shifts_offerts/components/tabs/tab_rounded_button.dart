import 'package:flutter/material.dart';

import 'package:test_flutter_bulldozer/utils/colors/colors.dart';

Material tabRoundedButton(icon) {
  return Material(
      color: kBlack8,
      shape: const CircleBorder(),
      clipBehavior: Clip.hardEdge,
      child: Padding(
          padding: const EdgeInsets.all(6),
          child: IconButton(
            onPressed: () {},
            icon: Icon(icon),
          )));
}

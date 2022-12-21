import 'package:flutter/material.dart';

import 'package:test_flutter_bulldozer/screens/shifts_offerts/components/tabs/tab_rounded_button.dart';
import 'package:test_flutter_bulldozer/utils/colors/colors.dart';

Container bottomBar() {
  return Container(
    decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(60), color: kWhite),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: kTeal,
              shadowColor: Colors.transparent,
              elevation: 0,
              padding: const EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60),
              ),
            ),
            child: Row(
              children: const [
                Icon(
                  Icons.search,
                  color: kWhite,
                ),
                SizedBox(width: 8),
                Text(
                  "Shift Offerts",
                  style: TextStyle(fontWeight: FontWeight.w500, color: kWhite),
                )
              ],
            ),
          ),
          const SizedBox(width: 6),
          tabRoundedButton(Icons.file_open),
          const SizedBox(width: 6),
          tabRoundedButton(Icons.supervisor_account_rounded),
        ],
      ),
    ),
  );
}

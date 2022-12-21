import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:test_flutter_bulldozer/screens/shift_detail/shift_detail_screen.dart';

import 'package:test_flutter_bulldozer/utils/colors/colors.dart';
import 'package:test_flutter_bulldozer/utils/constants/date.dart';
import 'package:test_flutter_bulldozer/utils/constants/strings.dart';

InkWell shiftCard(context, Map item) {
  final DateFormat formatter = DateFormat('EEEE d MMM');

  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ShiftDetailScreen(item: item)));
    },
    child: Container(
      decoration: BoxDecoration(
        color: kWhite,
        boxShadow: [
          BoxShadow(
              color: kBlack3,
              spreadRadius: 2,
              blurRadius: 35,
              offset: const Offset(0, 0)),
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item["company"],
              style: const TextStyle(
                  color: kBlack, fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 6),
            Text(
              DateTime.parse(item["start_at"]) == todayDate
                  ? today
                  : formatter
                      .format(DateTime.parse(item["start_at"]))
                      .toUpperCase(),
              style: TextStyle(
                  fontSize: 12,
                  color: DateTime.parse(item["start_at"]) == todayDate
                      ? kRed
                      : kGrey35,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      constraints: const BoxConstraints(maxWidth: 80),
                      decoration: BoxDecoration(
                          color: kBlack8,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 12),
                        child: Text(
                          item["post_name"],
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 12, color: kBlack80),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      item["buy_price"] + "\$ / H",
                      style: TextStyle(
                          fontSize: 12,
                          color: kBlack80,
                          fontWeight: FontWeight.w500),
                    ),
                    const Text(
                      "+ 2\$ / H",
                      style: TextStyle(
                          fontSize: 12,
                          color: kTeal,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Text(
                  "16:00 - 22:00",
                  style: TextStyle(
                      fontSize: 12,
                      color: DateTime.parse(item["start_at"]) == todayDate
                          ? kRed
                          : kGrey35,
                      fontWeight: FontWeight.w500),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}

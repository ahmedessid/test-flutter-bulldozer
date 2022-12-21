import 'package:flutter/material.dart';
import 'package:test_flutter_bulldozer/screens/shifts_offerts/components/cards/cards.dart';
import 'package:test_flutter_bulldozer/screens/shifts_offerts/components/shifts_subtitle.dart';
import 'package:test_flutter_bulldozer/screens/shifts_offerts/components/tabs/bottom_bar.dart';

import 'package:test_flutter_bulldozer/utils/colors/colors.dart';
import 'package:test_flutter_bulldozer/utils/constants/date.dart';

class ShiftsOffertsScreen extends StatefulWidget {
  const ShiftsOffertsScreen({Key? key}) : super(key: key);

  @override
  State<ShiftsOffertsScreen> createState() => _ShiftsOffertsScreenState();
}

class _ShiftsOffertsScreenState extends State<ShiftsOffertsScreen> {
  final _shiftsTitle = "Shifts Offerts";
  final _lastMinuteTitle = "Dernière minute";
  final _comingShiftsTitle = "Shifts à venir";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(color: kGrey),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(_shiftsTitle,
                        style: const TextStyle(
                            color: kBlack,
                            fontSize: 26,
                            fontWeight: FontWeight.w400)),
                    const SizedBox(height: 40),
                    shiftsSubtitle(_lastMinuteTitle),
                    const SizedBox(height: 10),
                    cards((element) =>
                        DateTime.parse(element["start_at"]) == todayDate),
                    const SizedBox(height: 30),
                    shiftsSubtitle(_comingShiftsTitle),
                    const SizedBox(height: 10),
                    cards((element) =>
                        DateTime.parse(element["start_at"]) != todayDate),
                    const SizedBox(height: 60),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0.0,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: bottomBar(),
              ),
            )
          ],
        ),
      ),
    ));
  }
}

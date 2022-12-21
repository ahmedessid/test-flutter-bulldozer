import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:test_flutter_bulldozer/screens/shift_detail/components/shift_info.dart';

import 'package:test_flutter_bulldozer/utils/colors/colors.dart';
import 'package:test_flutter_bulldozer/utils/constants/date.dart';
import 'package:test_flutter_bulldozer/utils/constants/strings.dart';

class ShiftDetailScreen extends StatefulWidget {
  final Map? item;
  const ShiftDetailScreen({Key? key, this.item}) : super(key: key);

  @override
  State<ShiftDetailScreen> createState() => _ShiftDetailScreenState();
}

class _ShiftDetailScreenState extends State<ShiftDetailScreen> {
  final DateFormat formatter = DateFormat('EEEE d MMM');
  final _button = "Postuler";
  final _image =
      "https://s3-media0.fl.yelpcdn.com/bphoto/EnlWcSrd-lsA8j-SqUUM9w/l.jpg";

  @override
  Widget build(BuildContext context) {
    final _shift = widget.item;

    return SafeArea(
        child: Scaffold(
            body: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(color: kWhite),
                child: SingleChildScrollView(
                    child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Material(
                                color: kBlack,
                                shape: const CircleBorder(),
                                clipBehavior: Clip.hardEdge,
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  icon: const Icon(Icons.arrow_back,
                                      color: kWhite),
                                )),
                            Center(
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: kBlack80,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                            color: kBlack8,
                                            spreadRadius: 2,
                                            blurRadius: 8,
                                            offset: const Offset(0, 0))
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: CachedNetworkImage(
                                          height: 110,
                                          width: 110,
                                          imageUrl: _image,
                                          imageBuilder:
                                              (BuildContext context, image) =>
                                                  CircleAvatar(
                                                      backgroundImage: image),
                                          placeholder: (context, url) =>
                                              CircularProgressIndicator(
                                                  color: kBlack8),
                                          errorWidget: (context, url, error) =>
                                              Container()),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    _shift!["company"],
                                    style: const TextStyle(
                                        color: kBlack,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              DateTime.parse(_shift["start_at"]) == todayDate
                                  ? today
                                  : formatter
                                      .format(
                                          DateTime.parse(_shift["start_at"]))
                                      .toUpperCase(),
                              style: const TextStyle(
                                  fontSize: 12,
                                  color: kRed,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: kBlack8,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 6, horizontal: 12),
                                        child: Text(
                                          _shift["post_name"],
                                          style: TextStyle(
                                              fontSize: 12, color: kBlack80),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      _shift["buy_price"] + "\$ / H",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: kBlack80,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                const Text(
                                  "16:00 - 22:00",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: kRed,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),

                            // Cette partie est statique car l'api est n'est pas compatible avec les screens
                            Column(children: [
                              shiftInfo(Icons.location_disabled_rounded,
                                  "48 Rue Sous le Fort, Québec"),
                              shiftInfo(
                                  Icons.attach_money, "Bonus de travailleur"),
                              shiftInfo(Icons.pause, "Pause de 30 minutes"),
                              shiftInfo(
                                  Icons.local_parking, "Stationnement gratuit"),
                            ]),
                            const SizedBox(height: 30),
                            Text(
                              "Responsable".toUpperCase(),
                              style: TextStyle(
                                  fontSize: 15,
                                  color: kGrey35,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "Georgie Kovlaks",
                              style: TextStyle(fontSize: 16, color: kBlack),
                            ),
                            const SizedBox(height: 30),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.teal,
                                  minimumSize: const Size.fromHeight(50),
                                  shadowColor: Colors.transparent,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 18, vertical: 18),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(60.0))),
                              child: Text(_button,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500)),
                            )
                          ],
                        ))))));
  }
}

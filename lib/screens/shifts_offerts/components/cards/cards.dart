import 'package:flutter/material.dart';
import 'package:test_flutter_bulldozer/screens/shifts_offerts/components/cards/shift_card.dart';
import 'package:test_flutter_bulldozer/services/shifts_service.dart';

FutureBuilder cards(condition) {
  const _emptyMsg = "Pas de Shifts offerts..";
  const _errorMsg = "Une erreur s'est produite!";

  return FutureBuilder(
      future: readJson(),
      builder: (BuildContext context, AsyncSnapshot snapshot) =>
          snapshot.hasData
              ? snapshot.data.length != 0
                  ? Builder(builder: (BuildContext context) {
                      var data =
                          snapshot.data["data"].where(condition).toList();
                      return data.isEmpty
                          ? const Text("Pas de Shifts..")
                          : Column(
                              children: List.generate(data.length, (index) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: shiftCard(context, data[index]),
                                );
                              }),
                            );
                    })
                  : const Text(_emptyMsg)
              : snapshot.hasError
                  ? const Text(_errorMsg)
                  : const Center(child: CircularProgressIndicator()));
}

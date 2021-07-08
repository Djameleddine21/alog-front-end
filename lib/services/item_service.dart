import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:tp_alog/constants.dart';

class ItemService {
  static ItemService instance = ItemService._();

  ItemService._();

  Future<bool> addItem(
      String? id, String? title, String? price, String? additional) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl + 'add_client'),
        body: {
          "itemId": id,
          "title": title,
          "rentalPrice": price,
          "type": "1",
          "additional": additional,
        },
      );
      if (response.statusCode == 200) {
        Fluttertoast.showToast(
          msg: 'Item ajouter avec Success',
          webPosition: 'top',
          toastLength: Toast.LENGTH_SHORT,
        );
        return true;
      } else {
        Fluttertoast.showToast(
          msg: "Item n'est pas Ajoute",
          webPosition: 'top',
          backgroundColor: Colors.red,
          toastLength: Toast.LENGTH_SHORT,
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'Une erreur est survenue',
        webPosition: 'top',
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.red,
      );
      debugPrint("ERROR on add client : " + e.toString());
    }
    return false;
  }
}

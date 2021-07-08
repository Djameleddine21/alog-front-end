import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tp_alog/constants.dart';
import 'package:tp_alog/models/client.dart';

class ClientService {
  static ClientService instance = ClientService._();

  ClientService._();

  Future<bool> addClient(String? id, String? name, String? solde) async {
    try {
      final response = await http.post(Uri.parse(apiUrl + 'add_client'), body: {
        "clientId": id,
        "clientName": name,
        "accountBalance": solde,
      });
      if (response.statusCode == 200) {
        Fluttertoast.showToast(
          msg: 'Client ajouter avec Success',
          webPosition: 'top',
          toastLength: Toast.LENGTH_SHORT,
        );
        return true;
      } else {
        Fluttertoast.showToast(
          msg: "Client n'est pas Ajoute",
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

  Future<List<Client>> getClients() async {
    List<Client> result = <Client>[];
    try {
      final response = await http.get(Uri.parse(apiUrl + 'clients'));
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        for (var item in body) {
          result.add(Client.fromMap(item));
        }
      }
    } catch (e) {
      debugPrint("ERROR on get clients : " + e.toString());
    }
    return result;
  }

  Future<String> getSolde(String? id) async {
    try {
      final response = await http.get(Uri.parse(apiUrl + 'get_solde/$id'));
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        return body['solde'].toString();
      }
    } catch (e) {
      debugPrint("ERROR on get clients : " + e.toString());
    }
    return '0';
  }
}

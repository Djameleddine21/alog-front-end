import 'package:flutter/material.dart';
import 'package:tp_alog/views/screens/add_client/add_client_screen.dart';
import 'package:tp_alog/views/screens/add_item/add_item_screen.dart';
import 'package:tp_alog/views/screens/client_list/client_list_screen.dart';
import 'package:tp_alog/views/screens/solde_client/slode_client_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String id = '/home';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: SizedBox.shrink(),
          title: Text(
            'VideoGameStore',
            style: TextStyle(
              color: Colors.white,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
            ),
          ),
          centerTitle: true,
        ),
        body: ListView(
          physics: BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          children: [
            const SizedBox(height: 30.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40.0),
                ElevatedButton(
                  child: Text("Ajouter un client"),
                  onPressed: () {
                    Navigator.pushNamed(context, AddClientScreen.id);
                  },
                ),
                const SizedBox(height: 30.0),
                ElevatedButton(
                  child: Text("Afficher la liste des clients"),
                  onPressed: () {
                    Navigator.pushNamed(context, ClientListScreen.id);
                  },
                ),
                const SizedBox(height: 30.0),
                ElevatedButton(
                  child: Text("Solde d'un client"),
                  onPressed: () {
                    Navigator.pushNamed(context, SoldeClientScreen.id);
                  },
                ),
                const SizedBox(height: 30.0),
                ElevatedButton(
                  child: Text("Ajouter Item"),
                  onPressed: () {
                    Navigator.pushNamed(context, AddItemScreen.id);
                  },
                ),
                const SizedBox(height: 30.0),
              ],
            )
          ],
        ),
      ),
    );
  }
}

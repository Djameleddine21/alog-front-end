import 'package:flutter/material.dart';
import 'package:tp_alog/services/client_service.dart';

// ignore: must_be_immutable
class SoldeClientScreen extends StatelessWidget {
  static const String id = '/solde';

  String? _id;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(height: 30.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                decoration: InputDecoration(hintText: 'client id'),
                onChanged: (value) => _id = value,
              ),
            ),
            const SizedBox(height: 40.0),
            ElevatedButton(
              onPressed: () async {
                showDialog(
                  context: context,
                  builder: (context) {
                    return SimpleDialog(
                      contentPadding: const EdgeInsets.all(20.0),
                      children: [
                        FutureBuilder(
                          future: ClientService.instance.getSolde(_id),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState !=
                                ConnectionState.done) {
                              return Center(child: CircularProgressIndicator());
                            } else {
                              return Center(
                                  child:
                                      Text('le slode est : ${snapshot.data}'));
                            }
                          },
                        )
                      ],
                    );
                  },
                );
              },
              child: Text("Get Slode"),
            ),
          ],
        ),
      ),
    );
  }
}

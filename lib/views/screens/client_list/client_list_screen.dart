import 'package:flutter/material.dart';
import 'package:tp_alog/models/client.dart';
import 'package:tp_alog/services/client_service.dart';

class ClientListScreen extends StatelessWidget {
  static const String id = '/client_list';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<List<Client>>(
          future: ClientService.instance.getClients(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return Center(child: CircularProgressIndicator());
            } else {
              return ListView.separated(
                itemCount: snapshot.data!.length,
                separatorBuilder: (_, __) => const SizedBox(height: 30.0),
                itemBuilder: (_, index) => Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30.0,
                      backgroundColor: Colors.teal,
                      child: Text(
                        snapshot.data?[index].clientId.toString() ?? '',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(
                      snapshot.data?[index].clientName ?? '',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

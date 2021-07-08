import 'package:flutter/material.dart';
import 'package:tp_alog/services/client_service.dart';

// ignore: must_be_immutable
class AddClientScreen extends StatelessWidget {
  static const String id = '/addclient';

  String? _id, _name, _solde;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50.0),
              TextField(
                decoration: InputDecoration(hintText: 'client id'),
                onChanged: (value) => _id = value,
              ),
              const SizedBox(height: 30.0),
              TextField(
                decoration: InputDecoration(hintText: 'client name'),
                onChanged: (value) => _name = value,
              ),
              const SizedBox(height: 30.0),
              TextField(
                decoration: InputDecoration(hintText: 'client solde'),
                onChanged: (value) => _solde = value,
              ),
              const SizedBox(height: 30.0),
              ElevatedButton(
                child: Text('Ajouter Client'),
                onPressed: () async {
                  showDialog(
                    context: context,
                    builder: (_) => Center(child: CircularProgressIndicator()),
                  );
                  await ClientService.instance.addClient(_id, _name, _solde);
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

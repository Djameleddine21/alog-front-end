import 'package:flutter/material.dart';
import 'package:tp_alog/services/item_service.dart';

// ignore: must_be_immutable
class AddItemScreen extends StatelessWidget {
  static const String id = "/additem";

  String? _id, _title, _price, _additional;

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
                decoration: InputDecoration(hintText: 'item id'),
                onChanged: (value) => _id = value,
              ),
              const SizedBox(height: 30.0),
              TextField(
                decoration: InputDecoration(hintText: 'item title'),
                onChanged: (value) => _title = value,
              ),
              const SizedBox(height: 30.0),
              TextField(
                decoration: InputDecoration(hintText: 'rental price'),
                onChanged: (value) => _price = value,
              ),
              const SizedBox(height: 30.0),
              TextField(
                decoration: InputDecoration(hintText: 'additional'),
                onChanged: (value) => _additional = value,
              ),
              const SizedBox(height: 30.0),
              ElevatedButton(
                child: Text('Ajouter Item'),
                onPressed: () async {
                  showDialog(
                    context: context,
                    builder: (_) => Center(child: CircularProgressIndicator()),
                  );
                  await ItemService.instance
                      .addItem(_id, _title, _price, _additional);
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

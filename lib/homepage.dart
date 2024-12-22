import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vorlesung_state_provider/Item_card_provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<String> randomWords = [
    "Apple",
    "Banana",
    "Cherry",
    "Date",
    "Elderberry",
    "Fig",
    "Grape",
    "Honeydew",
    "Kiwi",
    "Lemon",
    "Mango",
    "Nectarine",
    "Orange",
    "Papaya",
    "Quince"
  ];

  String generateRandomWord() {
    final random = Random();
    return randomWords[random.nextInt(randomWords.length)];
  }

  void _showListDialog(BuildContext context, List<String> items) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Warenkorb Inhalt"),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    "- ${items[index]}",
                    style: const TextStyle(fontSize: 16),
                  ),
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Schließen"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Warenkorb App"),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 50, right: 50, top: 100, bottom: 100),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.deepPurple.shade200,
            boxShadow: myBoxShadow,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Consumer<ItemCardProvider>(
                  builder: (context, cartProvider, child) {
                    return ListView.builder(
                      itemCount: cartProvider.items.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(cartProvider.items[index]),
                          onTap: () {
                            _showListDialog(context, cartProvider.items);
                          },
                        );
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  String newWord = generateRandomWord();
                  Provider.of<ItemCardProvider>(context, listen: false)
                      .addItem(newWord);
                },
                child: const Text("Hinzufügen"),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  final List<BoxShadow> myBoxShadow = [
    BoxShadow(
      spreadRadius: -10,
      blurRadius: 5,
      offset: const Offset(-2, -2),
      color: Colors.black.withOpacity(0.5),
    ),
    BoxShadow(
      spreadRadius: 0,
      blurRadius: 5,
      offset: const Offset(2, 2),
      color: Colors.black.withOpacity(0.5),
    ),
  ];
}

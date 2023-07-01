import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AboutAppScreen extends StatefulWidget {
  const AboutAppScreen({super.key});

  @override
  State<AboutAppScreen> createState() => _AboutAppScreenState();
}

class _AboutAppScreenState extends State<AboutAppScreen> {
  List<dynamic> jsonData = [];
  List<Container> itemContainers = [];

  @override
  void initState() {
    super.initState();
    _parseJsonData().then((_) {
      _createItemContainers();
    });
  }

  Future<void> _parseJsonData() async {
    String jsonString = await _loadJsonData();
    setState(() {
      jsonData = json.decode(jsonString);
    });
  }

  Future<String> _loadJsonData() async {
    return await rootBundle.loadString('assets/aboutApp.json');
  }

  List<String> itemNames = ["About", "Year", "Developer", "Email", "phone"];

  void _createItemContainers() {
    for (var i = 0; i < itemNames.length; i++) {
      itemContainers.add(
        Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
          padding: const EdgeInsets.all(5.0),
          decoration: const BoxDecoration(
            color: Colors.white60,
            border: Border(
              left: BorderSide(
                color: Colors.orange,
                width: 5,
              ),
            ),
          ),
          child: Text(
            "${itemNames[i]} : ${jsonData.isNotEmpty ? jsonData[0][itemNames[i]] : ''}",
            style: const TextStyle(
              fontSize: 17,
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemContainers.length,
      itemBuilder: (context, position) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            itemContainers[position],
          ],
        );
      },
    );
  }
}

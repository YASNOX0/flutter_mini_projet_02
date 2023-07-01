import 'package:flutter/material.dart';
import 'package:mini_projet_02/main_container.dart';
import 'package:mini_projet_02/screens/start_screen.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';

import 'model/Operator.dart';

late List<Operator> _operators;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(
    join(await getDatabasesPath(), 'operator_database.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE operators(symbol TEXT PRIMARY KEY)',
      );
    },
    version: 1,
  );

  Future<void> insertOperation(Operator operator) async {
    final db = await database;
    await db.insert(
      'operators',
      operator.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  await insertOperation(Operator(symbol: "+"));
  await insertOperation(Operator(symbol: "-"));
  await insertOperation(Operator(symbol: "*"));

  Future<List<Operator>> getOperators() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('operators');

    return List.generate(maps.length, (i) {
      return Operator(symbol: maps[i]['symbol']);
    });
  }

  _operators = await getOperators();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: mainContainer(StartScreen(_operators)),
    );
  }
}

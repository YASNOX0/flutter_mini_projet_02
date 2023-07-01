import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:mini_projet_02/main_container.dart';
import 'package:mini_projet_02/screens/about_app_screen.dart';

import '../model/Operator.dart';
import 'calculation_screen.dart';

class StartScreen extends StatelessWidget {
  final List<Operator> _operators;

  const StartScreen(this._operators, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text(
              "Hi",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              Faker().person.name(),
              style: const TextStyle(
                decoration: TextDecoration.underline,
                fontSize: 15,
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>mainContainer(const AboutAppScreen()))),
              icon: const Icon(
                Icons.info,
                color: Colors.blue,
              ),
            ),
          ],
        ),
        const Spacer(),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    mainContainer(CalculationScreen(_operators))));
          },
          child: const Text("Go"),
        ),
      ],
    );
  }
}

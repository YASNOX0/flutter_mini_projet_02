import 'package:flutter/material.dart';
import 'package:mini_projet_02/main_container.dart';
import 'package:mini_projet_02/screens/operation_result_screen.dart';

import '../model/Operator.dart';

class CalculationScreen extends StatefulWidget {
  final List<Operator> _operators;

  const CalculationScreen(this._operators, {super.key});

  @override
  State<CalculationScreen> createState() => _CalculationScreenState();
}

class _CalculationScreenState extends State<CalculationScreen> {
  String? _selectedOperation;
  final TextEditingController _firstNbrController = TextEditingController();
  final TextEditingController _secondNbrController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    List<Widget> radioItems = [];

    for (Operator operator in widget._operators) {
      radioItems.add(
        RadioListTile(
          title: Text(operator.symbol),
          value: operator.symbol,
          groupValue: _selectedOperation,
          onChanged: (value) {
            setState(() {
              _selectedOperation = value;
            });
          },
        ),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: _firstNbrController,
          decoration: const InputDecoration(
            hintText: "First number",
          ),
        ),
        Column(
          children: radioItems,
        ),
        TextField(
          controller: _secondNbrController,
          decoration: const InputDecoration(
            hintText: "Second number",
          ),
        ),
        ElevatedButton(
            child: const Text("Calculate"),
            onPressed: () {
              late String msg;
              try {
                num firstNumber = num.parse(_firstNbrController.text);
                num secondNumber = num.parse(_secondNbrController.text);
                num result;
                switch (_selectedOperation) {
                  case "+":
                    result = firstNumber + secondNumber;
                    break;
                  case "-":
                    result = firstNumber - secondNumber;
                    break;
                  case "*":
                    result = firstNumber * secondNumber;
                    break;
                  default:
                    msg = "error";
                    return;
                }
                msg =
                    "$firstNumber $_selectedOperation $secondNumber = $result";
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        mainContainer(OperationResultScreen(msg))));
              } on Exception {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Caution"),
                    content: Row(
                      children: const [
                        Icon(
                          Icons.error,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 259,
                          child: Text(
                            'You should enter number!!!',
                            softWrap: true,
                          ),
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                          child: const Text('Understood'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          }),
                    ],
                  ),
                );
              }
            }),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class OperationResultScreen extends StatelessWidget {
  final String _msg;

  const OperationResultScreen(this._msg, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage("assets/math_operations_icon.png"),
            width: 80,
          ),
          const SizedBox(width: 10),
          Text(
            _msg,
            style: TextStyle(
              color: Colors.orange.shade400,
              fontSize: 30,
            ),
          ),
        ],
      ),
    );
  }
}

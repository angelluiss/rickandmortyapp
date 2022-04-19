import 'package:flutter/material.dart';

class CardBasic extends StatelessWidget {
  final dynamic model;
  final int index;
  final String name;
  final String type;

  const CardBasic(
      {Key? key,
      required this.model,
      required this.index,
      required this.name,
      required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.info),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(name),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              type,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}

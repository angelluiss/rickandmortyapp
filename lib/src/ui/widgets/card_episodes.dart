import 'package:flutter/material.dart';
import 'package:rickandmortyapp/src/models/characters_model.dart';

class CardEpisodes extends StatelessWidget {
  final CharactersModel model;
  final int index;
  final String name;
  final String type;

  const CardEpisodes(
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
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(name),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              type,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black12),
            ),
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

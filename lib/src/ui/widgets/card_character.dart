import 'package:flutter/material.dart';
import 'package:rickandmortyapp/src/models/characters_model.dart';
import 'package:rickandmortyapp/src/ui/screens/character_page.dart';

class CardCharacter extends StatefulWidget {
  final CharactersModel model;
  final int index;
  CardCharacter({Key? key, required this.model, required this.index})
      : super(key: key);

  @override
  State<CardCharacter> createState() => _CardCharacterState();
}

class _CardCharacterState extends State<CardCharacter> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        elevation: 3,
        child: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.33,
              child: Image.network(
                widget.model.results[widget.index].image,
                fit: BoxFit.fill,
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                              color:
                                  widget.model.results[widget.index].status ==
                                          'Alive'
                                      ? Colors.green
                                      : Colors.red,
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 1,
                                  color: widget.model.results[widget.index]
                                              .status ==
                                          'Alive'
                                      ? Colors.green
                                      : Colors.red)),
                        ),
                        Text(
                          "${widget.model.results[widget.index].status} - ${widget.model.results[widget.index].species}",
                          style: const TextStyle(fontSize: 12.0),
                        ),
                      ],
                    ),
                    Text(
                      widget.model.results[widget.index].name,
                      style: const TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text(
                        "Last known location",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Text(
                      widget.model.results[widget.index].location.name,
                      style: const TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text(
                        "First seen in:",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Text(
                      widget.model.results[widget.index].origin.name,
                      style: const TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CharacterPage(
                    model: widget.model,
                    index: widget.index,
                  ))),
    );
  }
}

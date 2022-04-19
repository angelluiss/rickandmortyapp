import 'package:flutter/material.dart';
import 'package:rickandmortyapp/src/models/characters_model.dart';
import 'package:rickandmortyapp/src/ui/widgets/card_basic.dart';
import 'package:rickandmortyapp/src/ui/widgets/card_episodes.dart';

class CharacterPage extends StatefulWidget {
  final CharactersModel model;
  final int index;
  CharacterPage({Key? key, required this.model, required this.index})
      : super(key: key);

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  final double coverHeight = 220;
  final double profileHeight = 144;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(padding: EdgeInsets.zero, children: [_buildTop()]));
  }

  _characterDetail() {
    final size = MediaQuery.of(context).size;

    final width = size.width;
    final int episodesLengt = widget.model.results[widget.index].episode.length;
    return Container(
      width: width,
      margin: EdgeInsets.only(top: profileHeight / 3),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Información",
              style: TextStyle(color: Colors.black54, fontSize: 22),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CardBasic(
                  model: widget.model,
                  index: widget.index,
                  name: "Gender",
                  type: widget.model.results[widget.index].gender),
              CardBasic(
                  model: widget.model,
                  index: widget.index,
                  name: "Origin",
                  type: widget.model.results[widget.index].origin.name),
              CardBasic(
                  model: widget.model,
                  index: widget.index,
                  name: "Type",
                  type: widget.model.results[widget.index].type)
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Episodios",
              style: TextStyle(color: Colors.black54, fontSize: 22),
            ),
          ),
          // SizedBox(
          //   height: 200,
          //   child: GridView.count(
          //     scrollDirection: Axis.horizontal,
          //     // Create a grid with 2 columns. If you change the scrollDirection to
          //     // horizontal, this produces 2 rows.
          //     crossAxisCount: 2,
          //     // Generate 100 widgets that display their index in the List.
          //     children: List.generate(episodesLengt, (index) {
          //       return CardEpisodes(index: , model: ,name: "", type: ,);
          //     }),
          //   ),
          // ),
        ],
      ),
    );
  }

  buildContent() {
    final bottom = profileHeight / 2;
    final size = MediaQuery.of(context).size;

    final width = size.width;
    return Container(
        width: width,
        decoration: BoxDecoration(color: Color(0xFF081F32)),
        child: Container(
          margin: EdgeInsets.only(top: bottom),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        color:
                            widget.model.results[widget.index].status == 'Alive'
                                ? Colors.green
                                : Colors.red,
                        shape: BoxShape.circle,
                        border: Border.all(
                            width: 1,
                            color: widget.model.results[widget.index].status ==
                                    'Alive'
                                ? Colors.green
                                : Colors.red)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.model.results[widget.index].status,
                      style:
                          const TextStyle(fontSize: 14.0, color: Colors.white),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.model.results[widget.index].name,
                  style: const TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.model.results[widget.index].species,
                  style: const TextStyle(fontSize: 14.0, color: Colors.white),
                ),
              ),
            ],
          ),
        ));
  }

  _buildTop() {
    final top = coverHeight - profileHeight / 2;
    return Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          buildCoverImage(),
          Positioned(
              top: coverHeight / 5,
              left: 5,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              )),
          Positioned(top: coverHeight, child: buildContent()),
          Positioned(top: top, child: buildProfileImage()),
          Positioned(
              top: coverHeight + profileHeight, child: _characterDetail()),
        ]);
  }

  Widget buildCoverImage() => Image.asset(
        "assets/images/ram3.jpeg",
        width: double.infinity,
        height: coverHeight,
        fit: BoxFit.cover,
      );

  Widget buildProfileImage() => CircleAvatar(
        radius: profileHeight / 2,
        backgroundImage: NetworkImage(widget.model.results[widget.index].image),
      );
}

import 'package:flutter/material.dart';
import 'package:rickandmortyapp/src/utils/search_delegate.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              child: Image(image: AssetImage("assets/images/ramtitle.png")),
              decoration: BoxDecoration(
                color: Colors.black,
              ),
            ),
            ListTile(
              title: const Text('Unknown'),
              onTap: () {
                // Actualiza el estado de la aplicación
                // ...
              },
            ),
            ListTile(
              title: const Text('Female'),
              onTap: () {
                // Actualiza el estado de la aplicación
                // ...
              },
            ),
            ListTile(
              title: const Text('Male'),
              onTap: () {
                // Actualiza el estado de la aplicación
                // ...
              },
            ),
            ListTile(
              title: const Text('Genderless'),
              onTap: () {
                // Actualiza el estado de la aplicación
                // ...
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: MySearchDelegate());
              },
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ))
        ],
        flexibleSpace: Container(
          child: const Center(
            child: Image(
              image: AssetImage("assets/images/ramtitle.png"),
            ),
          ),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/ram2.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      body: Column(),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rickandmortyapp/src/ui/screens/home_page.dart';

class InitialUI extends StatelessWidget {
  const InitialUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.9), BlendMode.dstATop),
                  image: const AssetImage("assets/images/ram2.jpeg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: null /* add child content here */,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Image(image: AssetImage("assets/images/ramtitle.png")),
                ),
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    "Bienvenido \n a Rick and Morty",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    "En esta prueba, evaluaremos su capacidad para construit la aplicación mediante el análisis de código y la reproducción del siquiente diseño.",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: const Color(0xFF12555F)),
                      child: CupertinoButton(
                          child: const Text(
                            "Continuar",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()));
                          }),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

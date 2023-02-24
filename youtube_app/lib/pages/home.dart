import 'package:flutter/material.dart';
import 'package:youtube_app/pages/biblioteca.dart';
import 'package:youtube_app/pages/em_alta.dart';
import 'package:youtube_app/pages/inicio.dart';
import 'package:youtube_app/pages/inscricoes.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indexBottom = 0;
  final List _telas = [
    Inicio(),
    EmAlta(),
    Inscricoes(),
    Biblioteca(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.grey),
          backgroundColor: Colors.white,
          title: Image.asset(
            "images/youtube.png",
            width: 98,
            height: 22,
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.videocam)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.account_circle)),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: _telas[_indexBottom],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.black,
          fixedColor: Colors.red,
          currentIndex: _indexBottom,
          onTap: (index) {
            setState(() {
              _indexBottom = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
            BottomNavigationBarItem(
                icon: Icon(Icons.whatshot), label: 'Em alta'),
            BottomNavigationBarItem(
                icon: Icon(Icons.subscriptions), label: 'Inscrições'),
            BottomNavigationBarItem(
                icon: Icon(Icons.folder), label: 'Biblioteca'),
          ],
        ));
  }
}

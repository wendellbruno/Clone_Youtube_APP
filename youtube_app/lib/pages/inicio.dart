import 'package:flutter/material.dart';
import 'package:youtube_app/credenciais/api_google.dart';

import '../models/video.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  _listarVideos() {
    Future<List<Video>?> videos;
    Api api = Api();
    videos = api.pesquisa();
    return videos;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Video>>(
      future: _listarVideos(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.active:
          case ConnectionState.waiting:
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            );
          case ConnectionState.done:
            if (snapshot.hasData) {
              return ListView.separated(
                itemBuilder: (context, index) {
                  List<Video>? videos = snapshot.data;
                  Video video = videos![index];
                  return Column(
                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(video.imagem as String),
                              fit: BoxFit.cover),
                        ),
                      ),
                      ListTile(
                        title: Text(video.titulo as String),
                        subtitle: Text(video.descricao as String),
                      )
                    ],
                  );
                },
                separatorBuilder: (context, index) => const Divider(
                  height: 3,
                  color: Colors.red,
                ),
                itemCount: snapshot.data!.length,
              );
            } else {
              return const Center(
                child: Text('Nenhum dado a ser exibido'),
              );
            }
        }
      },
    );
  }
}

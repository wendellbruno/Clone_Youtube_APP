class Video {
  String? id;
  String? titulo;
  String? imagem;
  String? descricao;
  String? canal;

  Video({
    this.id,
    this.titulo,
    this.imagem,
    this.descricao,
  });

/*   static converterJson(Map<String, dynamic> json){
    return Video(
      id: json["id"]["videoId"],
      titulo: json["snippet"]["title"],
      imagem: json["snippet"]["thumbnails"]["high"]["url"],
      descricao: json["snippet"]["description"],
      
    );
  } */

  //diferente do static o factory retorna apenas 1 objeto e instancia
  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: json["id"]["videoId"],
      titulo: json["snippet"]["title"],
      imagem: json["snippet"]["thumbnails"]["high"]["url"],
      descricao: json["snippet"]["description"],
    );
  }
}

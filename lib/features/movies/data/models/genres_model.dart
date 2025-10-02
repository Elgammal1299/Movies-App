class GenresModel {
  final String name;
  final int id;

  const GenresModel({required this.name, required this.id});

  factory GenresModel.fromJson(Map<String, dynamic> json) =>
      GenresModel(id: json["id"], name: json["name"]);
}

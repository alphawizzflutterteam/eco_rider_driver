
class FaqDataModel {
  bool status;
  String message;
  List<Faqllist> data;

  FaqDataModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory FaqDataModel.fromJson(Map<String, dynamic> json) => FaqDataModel(
    status: json["status"],
    message: json["message"],
    data: List<Faqllist>.from(json["data"].map((x) => Faqllist.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Faqllist {
  String id;
  String title;
  String pgSlug;
  String description;

  Faqllist({
    required this.id,
    required this.title,
    required this.pgSlug,
    required this.description,
  });

  factory Faqllist.fromJson(Map<String, dynamic> json) => Faqllist(
    id: json["id"],
    title: json["title"],
    pgSlug: json["pg_slug"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "pg_slug": pgSlug,
    "description": description,
  };
}

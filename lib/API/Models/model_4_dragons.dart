
class DragonModel {
  DragonModel({
    required this.id,
    required this.name,
    required this.type,
    required this.description,
    required this.active,
    required this.flickrImage,
  });

  String id;
  String name;
  String type;
  String description;
  bool active;
  List<String> flickrImage;

  factory DragonModel.fromJson(Map<String, dynamic> json) => DragonModel(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        description: json["description"],
        active: json["active"],
        flickrImage: json["flickr_images"],
      );

  // Map<String, dynamic> toJson() => {
  //       "id": id,
  //       "name": name,
  //       "type": type,
  //       "active": active,
  //     };
}

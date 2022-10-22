class ShipsModel {
  ShipsModel({
    required this.id,
    required this.name,
    required this.status,
    required this.image,
    required this.active,
  });

  String id;
  String name;
  String status;
  String image;
  bool active;

  factory ShipsModel.fromJson(Map<String, dynamic> json) => ShipsModel(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        image: json["roles"],
        active: json["active"],
      );

  // Map<String, dynamic> toJson() => {
  //       "ship_id": shipId,
  //       "ship_name": shipName,
  //       "ship_model": shipModel,
  //       "roles": List<dynamic>.from(roles.map((x) => x)),
  //       "active": active,
  //     };
}

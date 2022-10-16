class ShipsModel {
  ShipsModel({
    required this.shipId,
    required this.shipName,
    required this.shipModel,
    required this.roles,
    required this.active,
  });

  String shipId;
  String shipName;
  String shipModel;
  List<String> roles;
  bool active;

  factory ShipsModel.fromJson(Map<String, dynamic> json) => ShipsModel(
        shipId: json["ship_id"],
        shipName: json["ship_name"],
        shipModel: json["ship_model"],
        roles: List<String>.from(json["roles"].map((x) => x)),
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

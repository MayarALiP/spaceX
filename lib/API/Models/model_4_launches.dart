class LaunchModel {
  LaunchModel({
    required this.id,
    required this.name,
    required this.success,
    required this.flightNumber,
    required this.details,
  });

  String id;
  String name;
  bool success;
  int flightNumber;
  String details;

  factory LaunchModel.fromJson(Map<String, dynamic> json) => LaunchModel(
        id: json["id"],
        name: json["name"],
        success: json["success"] ?? false,
        flightNumber: json["flight_number"],
        details: json["details"] ?? " ",
      );

  // Map<String, dynamic> toJson() => {
  //       "mission_name": missionName,
  //       "mission_id": List<dynamic>.from(missionId.map((x) => x)),
  //       "launch_year": launchYear,
  //       "launch_date_local": launchDateLocal.toIso8601String(),
  //     };
}


class LaunchModel {
  LaunchModel({
    required this.missionName,
    required this.missionId,
    required this.launchYear,
    required this.launchDateLocal,
  });

  String missionName;
  List<String> missionId;
  String launchYear;
  DateTime launchDateLocal;

  factory LaunchModel.fromJson(Map<String, dynamic> json) => LaunchModel(
        missionName: json["mission_name"],
        missionId: List<String>.from(json["mission_id"].map((x) => x)),
        launchYear: json["launch_year"],
        launchDateLocal: DateTime.parse(json["launch_date_local"]),
      );

  // Map<String, dynamic> toJson() => {
  //       "mission_name": missionName,
  //       "mission_id": List<dynamic>.from(missionId.map((x) => x)),
  //       "launch_year": launchYear,
  //       "launch_date_local": launchDateLocal.toIso8601String(),
  //     };
}

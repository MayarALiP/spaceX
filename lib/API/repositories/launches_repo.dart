import 'package:dio/dio.dart';
import 'package:spacex/API/Models/model_4_launches.dart';
import 'package:spacex/utilities/constants.dart';

class LaunchApiRequests {
  Dio dio = Dio();
  BaseOptions options = BaseOptions(baseUrl: Constants().baseurl);

  LaunchApiRequests() {
    dio = Dio(options);
  }

  Future<List<LaunchModel>> launchesAPI() async {
    Response response = await dio.get(Constants().launchesEndPoint);
    List<LaunchModel> launches = [];

    for (var item in response.data) {
      launches.add(LaunchModel.fromJson(item));
    }
    return launches;
  }
}

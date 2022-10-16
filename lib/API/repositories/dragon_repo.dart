import 'package:dio/dio.dart';
import 'package:spacex/API/Models/model_4_dragons.dart';
import 'package:spacex/utilities/constants.dart';

class DragonApiRequests {
  Dio dio = Dio();
  BaseOptions options = BaseOptions(baseUrl: Constants().baseurl);

  DragonApiRequests() {
    dio = Dio(options);
  }

  Future<List<DragonModel>> dragonAPI() async {
    Response response = await dio.get(Constants().dragonsEndPoint);
    List<DragonModel> dragons = [];

    for (var item in response.data) {
      dragons.add(DragonModel.fromJson(item));
    }
    return dragons;
  }
}

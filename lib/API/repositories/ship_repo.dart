import 'package:dio/dio.dart';
import 'package:spacex/API/Models/model_4_ships.dart';
import 'package:spacex/utilities/constants.dart';

class ShipApiRequests {
  Dio dio = Dio();
  BaseOptions options = BaseOptions(baseUrl: Constants().baseurl);

  ShipApiRequests() {
    dio = Dio(options);
  }

  Future<List<ShipsModel>> shipsAPI() async {
    Response response =
        await dio.get(Constants().baseurl + Constants().shipsEndPoint);
    List<ShipsModel> ships = [];

    print(response.data);

    try {
      for (var item in response.data) {
        ships.add(ShipsModel.fromJson(item));
      }
      return ships;
    } catch (error) {
      print(error);
      throw (error);
    }
  }
}

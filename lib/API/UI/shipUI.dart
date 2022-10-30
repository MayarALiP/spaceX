import 'package:flutter/material.dart';
import 'package:spacex/API/Models/model_4_ships.dart';
import 'package:spacex/API/repositories/ship_repo.dart';

class ShipsConn extends StatefulWidget {
  const ShipsConn({super.key});
  @override
  State<ShipsConn> createState() => _ShipsConnState();
}

class _ShipsConnState extends State<ShipsConn> {
  late Future<List<ShipsModel>> apishipOutput;
  @override
  void initState() {
    apishipOutput = ShipApiRequests().shipsAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<ShipsModel>>(
            future: apishipOutput,
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      ShipsModel ship = snapshot.data![index];

                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 180,
                          width: 50,
                          decoration: BoxDecoration(
                            border: Border.all(width: 2, color: Colors.white60),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          //
                          //
                          child: Column(children: [
                            //Image
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(10, 10, 10, 10),
                              child: Row(children: [
                                // image
                                CircleAvatar(
                                  radius: 38.0,
                                  backgroundColor: Colors.red[900],
                                  child: CircleAvatar(
                                    radius: 35.0,
                                    backgroundImage: NetworkImage(ship.image),
                                  ),
                                ),
                                //
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 0, 10),
                                  //
                                  //text NAme
                                  child: Text(
                                    ship.name,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ]),
                              //
                              //
                            ),

                            // ID
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Text(
                                ("ship ID is ${ship.id}"),
                                style: const TextStyle(fontSize: 14),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                              // active
                              child: ElevatedButton(
                                onPressed: () {},
                                // style:  ButtonStyle(
                                //   shape: RoundedRectangleBorder( borderRadius: BorderRadius.only(
                                //       topLeft: Radius.circular(30),
                                //       topRight: Radius.elliptical(30, 30),
                                //       ),
                                //    ),
                                //     backgroundColor: MaterialStateProperty.all<Color>(
                                //         (if (ship.active == true) {
                                // Colors.green;
                                // } else
                                //     Colors.green;
                                //   ),
                                //  ),
                                // ),
                                child: Text("${ship.active}"),
                              ),
                            ),
                          ]),
                        ),
                      );
                    });
              } else {
                return const Text("No data to show ");
              }
            }),
      ),
    );
  }
}

/**
 * ElevatedButton.styleFrom(

    ),
    ),
    )
 */

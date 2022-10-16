import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spacex/ui/first_screen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<LogInScreen> {
  var controllerUserName = TextEditingController();
  var controllerPassword = TextEditingController();
  var controllerEmail = TextEditingController();
  late SharedPreferences pref;
  bool rememberMe = false;
  String warning = "  ";

  void initialPref() async {
    pref = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    super.initState();
    initialPref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      appBar: AppBar(
        toolbarHeight: 120,
        titleSpacing: 150,
        //مسافة لليمين
        backgroundColor: Colors.black,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(80),
          ),
        ),
      ),
      //
      //
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // error handling الغلابة
                SizedBox(
                    height: 100,
                    width: 450,
                    child: Text(
                      warning,
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        backgroundColor: Colors.grey,
                      ),
                      textDirection: TextDirection.ltr,
                    )),

                //Email
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter your E-mail",
                      icon: const Icon(
                        Icons.alternate_email,
                        color: Colors.red,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    controller: controllerEmail,
                  ),
                ),

                //userName
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "UserName",
                      icon: const Icon(Icons.person, color: Colors.red),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    controller: controllerUserName,
                  ),
                ),

                //password
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                      icon: const Icon(Icons.lock, color: Colors.red),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    controller: controllerPassword,
                  ),
                ),

                //remember me
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                  child: Row(
                    children: [
                      Checkbox(
                          checkColor: Colors.red,
                          activeColor: Colors.white,
                          value: rememberMe,
                          onChanged: (bool? value) {
                            setState(() {
                              rememberMe = value!;
                            });
                          }),
                      const Text("Remember me"),
                    ],
                  ),
                ),

                //continue and nav.push
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
                  child: SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black)),
                      onPressed: () {
                        if (!(controllerEmail.text.contains("@") &&
                            controllerUserName.text.isNotEmpty)) {
                          warning =
                              "  Either your email or user Is not correct";
                        } else {
                          pref.setString("Email", controllerEmail.text);
                          pref.setString("UserName", controllerUserName.text);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const FirstScreen(),
                            ),
                          );
                        }
                      },
                      child: const Text(
                        "Continue",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),

                //login
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 5, 15, 15),
                  child: SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white)),
                      child: const Text(
                        "LogIn with FaceBook",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      onPressed: () {
                        //ToDo: firebase connect with FaceBook Acc !!
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

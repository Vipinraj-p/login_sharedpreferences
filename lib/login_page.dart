import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:login_sharedpreferences/home.dart';
import 'package:login_sharedpreferences/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPg extends StatefulWidget {
  const LoginPg({super.key});

  @override
  State<LoginPg> createState() => _LoginPgState();
}

class _LoginPgState extends State<LoginPg> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(
              Icons.cruelty_free,
              size: 30,
              color: Color.fromARGB(255, 9, 170, 17),
            ),
            Text(
              "Login Page",
              style: TextStyle(
                color: Color.fromARGB(255, 17, 36, 145),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 249, 217, 255),
          Color.fromARGB(255, 191, 223, 248)
        ], begin: Alignment.bottomLeft, end: Alignment.topRight)),
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
              child: Column(children: [
                TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 17, 36, 145),
                      ),
                    ),
                    labelText: "User Name",
                  ),
                  controller: userNameController,
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 17, 36, 145),
                      ),
                    ),
                    labelText: "password",
                  ),
                  controller: passwordController,
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        final _sharedpref =
                            await SharedPreferences.getInstance();
                        await _sharedpref.setString(USER_NAME, 'user1');
                        await _sharedpref.setString(PASSWORD, '123');
                        log(userNameController.text, name: 'username :');
                        log(passwordController.text, name: 'Password :');
                        String userName = userNameController.text;
                        String password = passwordController.text;
                        if (userName == _sharedpref.getString(USER_NAME) &&
                            password == _sharedpref.getString(PASSWORD)) {
                          await _sharedpref.setBool(SAVE_KEY_NAME, true);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ));
                        } else if (userName.isEmpty || password.isEmpty) {
                          showDialog(
                            context: context,
                            builder: (context) => const AlertDialog(
                              alignment: Alignment.topCenter,
                              contentPadding: EdgeInsets.all(10),
                              icon: Icon(
                                Icons.dangerous_outlined,
                                color: Colors.red,
                              ),
                              contentTextStyle: TextStyle(color: Colors.red),
                              backgroundColor:
                                  Color.fromARGB(255, 187, 222, 251),
                              content: Text(
                                'Enter your Username and Password',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) => const AlertDialog(
                              alignment: Alignment.topCenter,
                              contentPadding: EdgeInsets.all(10),
                              icon: Icon(
                                Icons.dangerous_outlined,
                                color: Colors.red,
                              ),
                              contentTextStyle: TextStyle(color: Colors.red),
                              backgroundColor:
                                  Color.fromARGB(255, 187, 222, 251),
                              content: Text(
                                'Invalid Entry',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(148, 17, 36, 145),
                        foregroundColor: Colors.white,
                        fixedSize: const Size(180, 50),
                      ),
                      child: const Text("Sign in",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500)),
                    ),
                    const SizedBox(width: 23),
                    ElevatedButton(
                      onPressed: () {
                        userNameController.clear();
                        passwordController.clear();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color.fromARGB(255, 12, 12, 165),
                        fixedSize: const Size(180, 50),
                      ),
                      child: const Text(
                        "Clear",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

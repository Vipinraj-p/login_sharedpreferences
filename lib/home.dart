import 'package:flutter/material.dart';
import 'package:login_sharedpreferences/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                "Home",
                style: TextStyle(
                  color: Color.fromARGB(255, 17, 36, 145),
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
                onPressed: () async {
                  final _sharedPref = await SharedPreferences.getInstance();
                  await _sharedPref.clear();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPg(),
                      ),
                      (route) => false);
                },
                icon: const Icon(
                  Icons.logout_rounded,
                  color: Color.fromARGB(255, 9, 170, 17),
                ))
          ],
        ),
        body: Stack(
          children: [
            ClipPath(
                clipper: OvalBottomBorderClipper(),
                child: Container(
                  height: 420,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                    // Colors.white10,
                    // Color.fromARGB(255, 235, 172, 247),
                    Color.fromARGB(85, 235, 172, 247),
                    Color.fromARGB(85, 113, 183, 241),
                  ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
                )),
            ClipPath(
                clipper: WaveClipperOne(flip: true),
                child: Container(
                  height: 410,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                    // Colors.white10,
                    // Color.fromARGB(255, 235, 172, 247),
                    Color.fromARGB(85, 235, 172, 247),
                    Color.fromARGB(85, 113, 183, 241),
                  ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
                )),
            const Center(
                child: Icon(
              Icons.cottage_outlined,
              size: 60,
              color: Color.fromARGB(255, 9, 170, 17),
            )),
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:page_route_transition/page_route_transition.dart';
import 'package:sekawanmedia/pages/profilepage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Stream<DateTime> timeStream;
  late DateTime currentTime;

  @override
  void initState() {
    super.initState();
    timeStream = Stream<DateTime>.periodic(
      const Duration(seconds: 1),
          (count) => DateTime.now(),
    );

    // Inisialisasi currentTime dengan waktu sekarang
    currentTime = DateTime.now();

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: Container(
                width: double.infinity,
                height: 55,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(top: 0.0, right: 10, left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          StreamBuilder<DateTime>(
                            stream: timeStream,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                currentTime = snapshot.data!;
                              }
                              final formattedTime = DateFormat('HH:mm:ss').format(currentTime);
                              final formattedDate = DateFormat('dd MMMM y').format(currentTime);
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 0.0),
                                    child: Text(
                                      formattedTime,
                                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.black,),
                                    ),
                                  ),
                                  SizedBox(height: 5.0),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 0.0),
                                    child: Text(
                                      formattedDate,
                                      style: TextStyle(fontSize: 12.0, color: Colors.black,),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                      Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              PageRouteTransition.effect = TransitionEffect.rightToLeft;
                              PageRouteTransition.push(context, const ProfilePage());
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(left: 5.0, right: 5.0),
                              child: Icon(Icons.settings, color: Colors.black, size: 25.0),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
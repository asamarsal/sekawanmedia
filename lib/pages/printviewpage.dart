import 'dart:convert';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:page_route_transition/page_route_transition.dart';
import 'package:http/http.dart' as http;
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:async';

class PrintviewPage extends StatefulWidget {
  const PrintviewPage({super.key});

  @override
  State<PrintviewPage> createState() => _PrintviewPageState();
}

class _PrintviewPageState extends State<PrintviewPage> {

  String namaUser = 'Tunggu Sebentar';
  String usernameUser = 'Tunggu Sebentar';
  String emailUser = 'Tunggu Sebentar';
  String streetUser = 'Tunggu Sebentar';
  String suiteUser = 'Tunggu Sebentar';
  String cityUser = 'Tunggu Sebentar';
  String zipcodeUser = 'Tunggu Sebentar';
  String longitudeUser = 'Tunggu Sebentar';
  String latitudeUser = 'Tunggu Sebentar';

  late Stream<DateTime> timeStream;
  late DateTime currentTime;

  Future<void> loadnamaprofil() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String storedUser = prefs.getString('nama_disimpan') ?? 'Nama Anda';

    setState(() {
      namaUser = storedUser;
    });
  }

  Future<void> loadusernameprofil() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String storedUserName = prefs.getString('username_disimpan') ?? 'Nama Anda';

    setState(() {
      usernameUser = storedUserName;
    });
  }

  Future<void> loademailprofil() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String storedEmail = prefs.getString('email_disimpan') ?? 'Email Anda';

    setState(() {
      emailUser = storedEmail;
    });
  }

  Future<void> loadstreetprofil() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String storedStreet = prefs.getString('street_disimpan') ?? 'Street Anda';

    setState(() {
      streetUser = storedStreet;
    });
  }

  Future<void> loadsuiteprofil() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String storedSuite = prefs.getString('suite_disimpan') ?? 'Suite Anda';

    setState(() {
      suiteUser = storedSuite;
    });
  }

  Future<void> loadcityprofil() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String storedCity = prefs.getString('city_disimpan') ?? 'City Anda';

    setState(() {
      cityUser = storedCity;
    });
  }

  Future<void> loadzipcodeprofil() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String storedZipcode = prefs.getString('zipcode_disimpan') ?? 'Zipcode Anda';

    setState(() {
      zipcodeUser = storedZipcode;
    });
  }

  Future<void> loadlongitudeprofil() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String storedLongitude = prefs.getString('longitude_disimpan') ?? 'Longitude Anda';

    setState(() {
      longitudeUser = storedLongitude;
    });
  }

  Future<void> loadlatitudeprofil() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String storedLatitude = prefs.getString('latitude_disimpan') ?? 'Latitude Anda';

    setState(() {
      latitudeUser = storedLatitude;
    });
  }

  //Waktu
  @override
  void initState() {
    super.initState();
    timeStream = Stream<DateTime>.periodic(
      const Duration(seconds: 1),
          (count) => DateTime.now(),
    );

    loadnamaprofil();
    loadusernameprofil();
    loademailprofil();
    loadstreetprofil();
    loadsuiteprofil();
    loadcityprofil();
    loadzipcodeprofil();
    loadlongitudeprofil();
    loadlatitudeprofil();

    // Inisialisasi currentTime dengan waktu sekarang
    currentTime = DateTime.now();

  }

  String? selectedValue;
  final TextEditingController textEditingController = TextEditingController();

  List<Map<String, dynamic>> jwtData = [];

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () async {
                      PageRouteTransition.effect = TransitionEffect.bottomToTop;
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 50,
                      width: 80,
                      color: Colors.transparent,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 5.0, right: 5.0),
                            child: Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 25.0),
                          ),
                          Text('Back', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 160,
                width: double.infinity,
                color: Color(0XFFEDFAF2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5.0,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () {

                        },
                        child: const Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text(
                            'Username',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          const Text(
                            'Nama Lengkap  :',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 10.0,),
                          Text(
                            namaUser,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15.0,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          const Text(
                            'Username          :',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 10.0,),
                          Text(
                            usernameUser,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15.0,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          const Text(
                            'Email                  :',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 10.0,),
                          Text(
                            emailUser,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5.0,),
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {

                  },
                  child: const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Alamat',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.0,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    const Text(
                      'Street                 :',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 10.0,),
                    Text(
                      streetUser,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.0,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Text(
                      'Suite                   :',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 10.0,),
                    Text(
                      suiteUser,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.0,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Text(
                      'City                     :',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 10.0,),
                    Text(
                      cityUser,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.0,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    const Text(
                      'Zipcode              :',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 10.0,),
                    Text(
                      zipcodeUser,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.0,),
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {

                  },
                  child: const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Location',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.0,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    const Text(
                      'Latitude             :',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 10.0,),
                    Text(
                      latitudeUser,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.0,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Text(
                      'Longitude          :',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 10.0,),
                    Text(
                      longitudeUser,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
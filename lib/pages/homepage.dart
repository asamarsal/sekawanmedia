import 'dart:convert';

import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:page_route_transition/page_route_transition.dart';
import 'package:sekawanmedia/pages/printviewpage.dart';
import 'package:sekawanmedia/pages/profilenewpage.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:typewritertext/typewritertext.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Stream<DateTime> timeStream;
  late DateTime currentTime;

  // Tanggal
  TextEditingController _dateController = TextEditingController();
  TextEditingController nomorkontrakController = TextEditingController();

  final TextEditingController textEditingController = TextEditingController();

  String? selectedValue;

  List<Map<String, dynamic>> jwtData = [];

  List<String> items = [];

  @override
  void initState() {
    super.initState();
    timeStream = Stream<DateTime>.periodic(
      const Duration(seconds: 1),
          (count) => DateTime.now(),
    );

    // Inisialisasi currentTime dengan waktu sekarang
    currentTime = DateTime.now();

    // Tambahkan inisialisasi tanggal ke _dateController
    _dateController.text = DateFormat('yyyy-MM-dd').format(currentTime);

    fetchData().then((data) {
      if (data.isNotEmpty) {
        setState(() {
          jwtData = data;
        });
      }
    });

  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  Future<List<Map<String, dynamic>>> fetchData() async {
    // Ambil nilai dari _dateController dan nomorkontrakController
    String dateValue = _dateController.text;

    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
    );

    if (response.statusCode == 200) {
      // Sukses mendapatkan data
      List<dynamic> decodedData = jsonDecode(response.body);

      if (decodedData.isNotEmpty) {
        //Lottie animasi visibility
        setState(() {
          isDataketemu = false;
          isDatafound = true;
          jwtData = List<Map<String, dynamic>>.from(decodedData);

          items = jwtData.map((data) => data['name'].toString()).toList();
        });
      } else {
        //Lottie animasi visibility
        setState(() {
          isDataketemu = true;
          isDatafound = false;
        });
        print('Error: Data kosong');
      }
    } else {
      // Gagal mendapatkan data, lakukan penanganan kesalahan sesuai kebutuhan Anda
      print('HTTP Error: ${response.statusCode}');
    }

    return jwtData;
  }

  Future<void> onRefresh() async {
    await Future.delayed(Duration(seconds: 1));
  }
  bool isDataketemu = true;
  bool isDatafound = true;

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
            Container(
              height: 240,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.greenAccent,
                    Color(0XFFc8ffe4),  // Anda dapat menambahkan warna lain jika diinginkan
                  ],
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 10.0,),
                  const Text(
                    "Sekawan Media Technical Test",
                    style: TextStyle(fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 5.0,),
                  //Date Controller
                  Padding(padding: EdgeInsets.only(left: 20, right: 20, top: 5),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0), // Menambahkan border circle 8
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 10),
                        child: TextField(
                          controller: _dateController,
                          textAlign: TextAlign.left,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[-0-9\s]')),
                          ],
                          decoration: InputDecoration(
                            hintText: 'Tanggal',
                            hintStyle: TextStyle(color: Colors.grey),
                            suffixIcon: IconButton(
                              icon: Icon(CupertinoIcons.calendar, size: 25,),
                              onPressed: () async {
                                final DateTime? selectedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2024, 1, 1),
                                  lastDate: DateTime(2025).add(Duration(days: 365)),
                                );

                                if (selectedDate != null) {
                                  // Format tanggal
                                  String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);


                                  // Cetak tanggal yang sudah diformat
                                  print('Selected date: $formattedDate');

                                  setState(() {
                                    // Set text dengan tanggal yang sudah diformat
                                    _dateController.text = formattedDate;
                                  });
                                }
                              },
                            ),
                            // Menghilangkan garis bawah
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20,),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0), // Menambahkan border circle 8
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5,),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0), // Menambahkan border circle 8
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2<String>(
                              isExpanded: true,
                              hint: const Text(
                                'Pilih Nama User',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                              items: items
                                  .map((item) => DropdownMenuItem(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                              ))
                                  .toList(),
                              value: selectedValue,
                              onChanged: (value) {
                                setState(() {
                                  selectedValue = value;
                                });
                              },
                              buttonStyleData: const ButtonStyleData(
                                padding: EdgeInsets.symmetric(horizontal: 0),
                                height: 40,
                                width: double.infinity,
                              ),
                              dropdownStyleData: const DropdownStyleData(
                                maxHeight: 340,
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                height: 40,
                              ),
                              dropdownSearchData: DropdownSearchData(
                                searchController: textEditingController,
                                searchInnerWidgetHeight: 50,
                                searchInnerWidget: Container(
                                  height: 50,
                                  padding: const EdgeInsets.only(
                                    top: 8,
                                    bottom: 4,
                                    right: 8,
                                    left: 8,
                                  ),
                                  child: TextFormField(
                                    expands: true,
                                    maxLines: null,
                                    controller: textEditingController,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 8,
                                      ),
                                      hintText: 'Pilih Nama User',
                                      hintStyle: const TextStyle(fontSize: 12),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ),
                                searchMatchFn: (item, searchValue) {
                                  return item.value.toString().contains(searchValue);
                                },
                              ),
                              //This to clear the search value when you close the menu
                              onMenuStateChange: (isOpen) {
                                if (!isOpen) {
                                  textEditingController.clear();
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15.0,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: BouncingWidget(
                      duration: Duration(milliseconds: 100),
                      scaleFactor: 1.5,
                      onPressed: () async {
                        if (_dateController.text.isEmpty) {
                          // Menampilkan snackbar jika username atau password kosong
                          showTopSnackBar(
                            Overlay.of(context),
                            const CustomSnackBar.error(
                              message: "Harap Isi Tanggal",
                            ),
                          );
                        } else {
                          // Panggil fetchData untuk melakukan GET ke API
                          List<Map<String, dynamic>> newData = await fetchData();

                          if (newData.isNotEmpty) {
                            // Jika data berhasil diambil, update state dan tampilkan pesan sukses
                            setState(() {
                              jwtData = newData;
                            });
                            showTopSnackBar(
                              Overlay.of(context),
                              const CustomSnackBar.success(
                                message: "Berhasil",
                              ),
                            );
                          } else {
                            // Jika tidak ada data, tampilkan pesan error
                            showTopSnackBar(
                              Overlay.of(context),
                              const CustomSnackBar.error(
                                message: "Gagal mengambil data dari API",
                              ),
                            );
                          }
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.blue,
                          border: Border.all(
                            color: Colors.transparent,
                          ),
                        ),
                        child: const Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Search',
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0,),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "List User",
                    style: TextStyle(fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: !isDatafound,
              child: Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.asset(
                            'assets/animations/animasidefault.json',
                            width: 250,  // Ubah ukuran lebar sesuai kebutuhan
                            height: 250, // Ubah ukuran tinggi sesuai kebutuhan
                          ),
                        ],
                      ),
                      const TypeWriterText(
                        text: Text('Lakukan Pencarian ....', style: TextStyle(fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.w400),),
                        duration: Duration(milliseconds: 100),
                        repeat: true,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Visibility(
              visible: !isDataketemu,
              child: Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    child: RefreshIndicator(
                      onRefresh: onRefresh,
                      color: Colors.white,
                      backgroundColor: Colors.blue,
                      child: ListView.builder(
                        padding: const EdgeInsets.only(top: 10.0),
                        itemCount: jwtData.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () async {
                              // Ambil data yang akan disimpan
                              final name = jwtData[index]['name'];
                              final username = jwtData[index]['username'];
                              final email = jwtData[index]['email'];
                              final street = jwtData[index]['address']['street'];
                              final suite = jwtData[index]['address']['suite'];
                              final city = jwtData[index]['address']['city'];
                              final zipcode = jwtData[index]['address']['zipcode'];
                              final long = jwtData[index]['address']['geo']['lng'];
                              final lat = jwtData[index]['address']['geo']['lat'];

                              // Cek apakah nama tidak kosong
                              if (name != null && username != null && email != null) {
                                // Simpan ke shared preferences
                                final prefs = await SharedPreferences.getInstance();
                                prefs.setString('nama_disimpan', name);
                                prefs.setString('username_disimpan', username);
                                prefs.setString('email_disimpan', email);
                                prefs.setString('street_disimpan', street);
                                prefs.setString('suite_disimpan', suite);
                                prefs.setString('city_disimpan', city);
                                prefs.setString('zipcode_disimpan', zipcode);
                                prefs.setString('longitude_disimpan', long);
                                prefs.setString('latitude_disimpan', lat);

                                // Navigasi ke PrintviewPage
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => PrintviewPage()),
                                );
                              }
                            },
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 5.0,),
                                        Text(
                                          jwtData[index]['name'] ?? '',
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(height: 5.0,),
                                        Text(
                                          jwtData[index]['username'] ?? '',
                                          style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.black54
                                          ),
                                        ),
                                        SizedBox(height: 5.0,),
                                        Text(
                                          jwtData[index]['email'] ?? '',
                                          style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.black54
                                          ),
                                        ),
                                        SizedBox(height: 5.0,),
                                      ],
                                    ),
                                    Spacer(),
                                    Container(
                                      width: 90.0,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Color(0XFFF6AC3D),
                                      ),
                                      child: const Center(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Pick Me',
                                              style: TextStyle(color: Colors.white),
                                            ),
                                            SizedBox(width: 5.0,),
                                            Icon(CupertinoIcons.arrow_right, size: 20, color: Colors.white,),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                if (index < jwtData.length - 1)
                                  const Divider(
                                    color: Color(0XFFDDDDDD),  // Ganti dengan warna yang diinginkan
                                    thickness: 2.0,     // Ganti dengan ketebalan yang diinginkan
                                  ),
                                SizedBox(height: 10.0,),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
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
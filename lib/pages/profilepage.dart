import 'package:flutter/material.dart';
import 'package:avatar_view/avatar_view.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:animate_gradient/animate_gradient.dart';
import 'package:page_route_transition/page_route_transition.dart';
import 'package:sekawanmedia/pages/githubpage.dart';
import 'package:typewritertext/typewritertext.dart';
import 'package:url_launcher/url_launcher.dart';

import 'homepage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  final Uri _urlinstagramsgn = Uri.parse('https://www.instagram.com/asamarsal/');
  final Uri _urlfacebooksgn = Uri.parse('https://www.facebook.com/people/Sinergi-Gula-Nusantara/100086951187087/');
  final Uri _urlyoutubesgn = Uri.parse('https://www.youtube.com/@sinergigulanusantara');
  final Uri _urllinkedinsgn = Uri.parse('https://www.linkedin.com/in/asamarsal');

  Future<void> _launchUrlinstagramsgn() async {
    if (!await launchUrl(_urlinstagramsgn)) {
      throw Exception('Could not launch $_urlinstagramsgn');
    }
  }

  Future<void> _launchUrlfacebooksgn() async {
    if (!await launchUrl(_urlfacebooksgn)) {
      throw Exception('Could not launch $_urlfacebooksgn');
    }
  }

  Future<void> _launchUrllinkedinsgn() async {
    if (!await launchUrl(_urllinkedinsgn)) {
      throw Exception('Could not launch $_urllinkedinsgn');
    }
  }

  Future<void> _launchUrlyoutubesgn() async {
    if (!await launchUrl(_urlyoutubesgn)) {
      throw Exception('Could not launch $_urlyoutubesgn');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            AnimateGradient(
              primaryColors: const [
                Color(0XFF105D38),
                Color(0XFF105D38),
                Color(0xFF2C8C6D),
              ],
              secondaryColors: const [
                Color(0xFF38BF93),
                Color(0XFF105D38),
                Color(0XFF105D38),
              ],
              child: Container(
                decoration: const BoxDecoration(),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: () async {
                  PageRouteTransition.effect = TransitionEffect.rightToLeft;
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
                        child: Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 25.0),
                      ),
                      Text('Back', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text('Profile', style: TextStyle(fontSize: 30, color: Colors.white)),
                  ),
                  SizedBox(height: 20.0),
                  AvatarView(
                    radius: 70,
                    borderColor: Colors.white,
                    borderWidth: 1,
                    avatarType: AvatarType.CIRCLE,
                    backgroundColor: Colors.red,
                    imagePath: "https://i.ibb.co/DDs5sjG/pasfoto.png",
                    placeHolder: Container(
                      child: Icon(Icons.person, size: 70),
                    ),
                    errorWidget: Container(
                      child: Icon(Icons.error, size: 70),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Text('Hallo, Nama Saya Asa Salsabila Marsal', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w400)),
                  ),
                  SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: BouncingWidget(
                      duration: Duration(milliseconds: 100),
                      scaleFactor: 1.5,
                      onPressed: () async {
                        PageRouteTransition.effect = TransitionEffect.bottomToTop;
                        PageRouteTransition.push(context, GithubPage());
                      },
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.blue,
                              Colors.lightBlueAccent,
                            ],
                          ),
                          border: Border.all(
                            color: Colors.black12, // Warna border
                          ),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0xFF80000000),
                              blurRadius: 5.0,
                              offset: Offset(5, 5),
                            )
                          ],
                        ),
                        child: const Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Github',
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(width: 6),
                              ],
                            )

                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.0),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //Instagram
                        InkWell(
                          onTap: _launchUrlinstagramsgn,
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black12,
                              ),
                              shape: BoxShape.circle,
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0xFF80000000),
                                  blurRadius: 5.0,
                                  offset: Offset(3, 3),
                                )
                              ],
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.blue,
                                  Colors.lightBlueAccent,
                                ],
                              ),
                            ),
                            child: const ImageIcon(
                              AssetImage('assets/icons/logo_ig.png'),
                              color: Colors.black,
                              size: 5.0,
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        //Facebook
                        InkWell(
                          onTap: _launchUrlfacebooksgn,
                          child : Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black12,
                              ),
                              shape: BoxShape.circle,
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0xFF80000000),
                                  blurRadius: 5.0,
                                  offset: Offset(3, 3),
                                )
                              ],
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.blue,
                                  Colors.lightBlueAccent,
                                ],
                              ),
                            ),
                            child: Icon(Icons.facebook, color: Colors.black, size: 25.0),
                          ),
                        ),
                        SizedBox(width: 10,),
                        //Linked In
                        InkWell(
                          onTap: _launchUrllinkedinsgn,
                          child : Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black12,
                              ),
                              shape: BoxShape.circle,
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0xFF80000000),
                                  blurRadius: 5.0,
                                  offset: Offset(3, 3),
                                )
                              ],
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.blue,
                                  Colors.lightBlueAccent,
                                ],
                              ),
                            ),
                            child: const ImageIcon(
                              AssetImage('assets/icons/logo_linkedin.png'),
                              color: Colors.black,
                              size: 5.0,
                            ),

                          ),
                        ),
                        SizedBox(width: 10,),
                        //Youtube
                        InkWell(
                          onTap: _launchUrlyoutubesgn,
                          child : Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black12,
                              ),
                              shape: BoxShape.circle,
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0xFF80000000),
                                  blurRadius: 5.0,
                                  offset: Offset(3, 3),
                                )
                              ],
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.blue,
                                  Colors.lightBlueAccent,
                                ],
                              ),
                            ),
                            child: const ImageIcon(
                              AssetImage('assets/icons/logo_youtube.png'),
                              color: Colors.black,
                              size: 5.0,
                            ),

                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text('Profile', style: TextStyle(fontSize: 30, color: Colors.white)),
                  ),
                  SizedBox(height: 20.0),
                  AvatarView(
                    radius: 70,
                    borderColor: Colors.white,
                    borderWidth: 1,
                    avatarType: AvatarType.CIRCLE,
                    backgroundColor: Colors.red,
                    imagePath: "https://i.ibb.co/DDs5sjG/pasfoto.png",
                    placeHolder: Container(
                      child: Icon(Icons.person, size: 70),
                    ),
                    errorWidget: Container(
                      child: Icon(Icons.error, size: 70),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Text('Hallo, Nama Saya Asa Salsabila Marsal', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w400)),
                  ),
                  SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: BouncingWidget(
                      duration: Duration(milliseconds: 100),
                      scaleFactor: 1.5,
                      onPressed: () async {
                        PageRouteTransition.effect = TransitionEffect.bottomToTop;
                        PageRouteTransition.push(context, GithubPage());
                      },
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          border: Border.all(
                            color: Colors.black12, // Warna border
                          ),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0xFF80000000),
                              blurRadius: 5.0,
                              offset: Offset(5, 5),
                            )
                          ],
                        ),
                        child: const Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Github',
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(width: 6),
                              ],
                            )

                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.0),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //Instagram
                        InkWell(
                          onTap: _launchUrlinstagramsgn,
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black12,
                              ),
                              shape: BoxShape.circle,
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0xFF80000000),
                                  blurRadius: 5.0,
                                  offset: Offset(3, 3),
                                )
                              ],
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.blue,
                                  Colors.lightBlueAccent,
                                ],
                              ),
                            ),
                            child: const ImageIcon(
                              AssetImage('assets/icons/logo_ig.png'),
                              color: Colors.black,
                              size: 5.0,
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        //Facebook
                        InkWell(
                          onTap: _launchUrlfacebooksgn,
                          child : Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black12,
                              ),
                              shape: BoxShape.circle,
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0xFF80000000),
                                  blurRadius: 5.0,
                                  offset: Offset(3, 3),
                                )
                              ],
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.blue,
                                  Colors.lightBlueAccent,
                                ],
                              ),
                            ),
                            child: Icon(Icons.facebook, color: Colors.black, size: 25.0),
                          ),
                        ),
                        SizedBox(width: 10,),
                        //Linked In
                        InkWell(
                          onTap: _launchUrllinkedinsgn,
                          child : Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black12,
                              ),
                              shape: BoxShape.circle,
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0xFF80000000),
                                  blurRadius: 5.0,
                                  offset: Offset(3, 3),
                                )
                              ],
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.blue,
                                  Colors.lightBlueAccent,
                                ],
                              ),
                            ),
                            child: const ImageIcon(
                              AssetImage('assets/icons/logo_linkedin.png'),
                              color: Colors.black,
                              size: 5.0,
                            ),

                          ),
                        ),
                        SizedBox(width: 10,),
                        //Youtube
                        InkWell(
                          onTap: _launchUrlyoutubesgn,
                          child : Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black12,
                              ),
                              shape: BoxShape.circle,
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0xFF80000000),
                                  blurRadius: 5.0,
                                  offset: Offset(3, 3),
                                )
                              ],
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.blue,
                                  Colors.lightBlueAccent,
                                ],
                              ),
                            ),
                            child: const ImageIcon(
                              AssetImage('assets/icons/logo_youtube.png'),
                              color: Colors.black,
                              size: 5.0,
                            ),

                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:audioplayer/homepage.dart';
import 'package:url_launcher/url_launcher.dart';

class PlaylistPage extends StatefulWidget {
  const PlaylistPage({super.key, required this.title});
  final String title;

  @override
  State<PlaylistPage> createState() => _PlaylistPageState();
}

class _PlaylistPageState extends State<PlaylistPage> {
  static const _PATH = "assets/images";
  static const _sexophone = "$_PATH/saxophone.jpg";
  static const _Joohomin = "$_PATH/joohomin_profile.png";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget> [
                    Stack(
                      children: [
                        // background
                        Opacity(
                          opacity: 0.4,
                          child: Container(
                            height: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(_sexophone,),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 15, left: 10),
                          child: IconButton(
                            onPressed: () {Navigator.pop(context);},
                            icon: Icon(Icons.arrow_back_ios_new),
                            color: Colors.white,
                          ),
                          alignment: Alignment.topLeft,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 70,),
                              Text("All about JAZZ", style: TextStyle(fontFamily: 'neo', fontWeight: FontWeight.w600, fontSize: 25, color: Colors.white),),
                              SizedBox(height: 15,),
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.white70,
                                  borderRadius: BorderRadius.circular(60)
                                ),
                                child: CircleAvatar(
                                  backgroundColor: Colors.black,
                                  backgroundImage: AssetImage(_Joohomin),
                                  radius: 30,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget> [
                        Container(
                          padding: EdgeInsets.only(top: 20, bottom: 20, left: 20),
                          child: Text("재즈가 뭐라고 생각하세요?", style: TextStyle(fontSize: 15, fontFamily: 'neo', fontWeight: FontWeight.w500, color: Colors.white),),
                        ),
                        SizedBox(width: 40,),
                        Container(
                          padding: EdgeInsets.only(right: 20),
                          child: ElevatedButton(
                            onPressed: () async {
                              final url = Uri.parse(
                                'https://youtube.com/shorts/18OYMT2qUSY?feature=share',
                              );
                              if (await canLaunchUrl(url)) {
                                launchUrl(url);
                              } else {
                                // ignore: avoid_print
                                print("Can't launch $url");
                              }
                            },
                            style: ElevatedButton.styleFrom(primary: Colors.deepPurpleAccent),
                            child: const Text('Link'),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget> [
                        Container(
                          padding: EdgeInsets.only(top: 20, bottom: 20, left: 20),
                          child: Text("쭈펄 재즈 페스티벌", style: TextStyle(fontSize: 15, fontFamily: 'neo', fontWeight: FontWeight.w500, color: Colors.white),),
                        ),
                        SizedBox(width: 40,),
                        Container(
                          padding: EdgeInsets.only(right: 20),
                          child: ElevatedButton(
                            onPressed: () async {
                              final url = Uri.parse(
                                'https://www.youtube.com/watch?v=a12ZwB37mTo',
                              );
                              if (await canLaunchUrl(url)) {
                                launchUrl(url);
                              } else {
                                // ignore: avoid_print
                                print("Can't launch $url");
                              }
                            },
                            style: ElevatedButton.styleFrom(primary: Colors.deepPurpleAccent),
                            child: const Text('Link'),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget> [
                        Container(
                          padding: EdgeInsets.only(top: 20, bottom: 20, left: 20),
                          child: Text("Piano Version", style: TextStyle(fontSize: 15, fontFamily: 'neo', fontWeight: FontWeight.w500, color: Colors.white),),
                        ),
                        SizedBox(width: 40,),
                        Container(
                          padding: EdgeInsets.only(right: 20),
                          child: ElevatedButton(
                            onPressed: () async {
                              final url = Uri.parse(
                                'https://youtube.com/shorts/_asqNXy4hyM?feature=share',
                              );
                              if (await canLaunchUrl(url)) {
                                launchUrl(url);
                              } else {
                                // ignore: avoid_print
                                print("Can't launch $url");
                              }
                            },
                            style: ElevatedButton.styleFrom(primary: Colors.deepPurpleAccent),
                            child: const Text('Link'),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget> [
                        Container(
                          padding: EdgeInsets.only(top: 20, bottom: 20, left: 20),
                          child: Text("브라움 Version", style: TextStyle(fontSize: 15, fontFamily: 'neo', fontWeight: FontWeight.w500, color: Colors.white),),
                        ),
                        SizedBox(width: 40,),
                        Container(
                          padding: EdgeInsets.only(right: 20),
                          child: ElevatedButton(
                            onPressed: () async {
                              final url = Uri.parse(
                                'https://youtu.be/aSt7sHLC_SM',
                              );
                              if (await canLaunchUrl(url)) {
                                launchUrl(url);
                              } else {
                                // ignore: avoid_print
                                print("Can't launch $url");
                              }
                            },
                            style: ElevatedButton.styleFrom(primary: Colors.deepPurpleAccent),
                            child: const Text('Link'),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget> [
                        Container(
                          padding: EdgeInsets.only(top: 20, bottom: 20, left: 20),
                          child: Text("서울예대 Version", style: TextStyle(fontSize: 15, fontFamily: 'neo', fontWeight: FontWeight.w500, color: Colors.white),),
                        ),
                        SizedBox(width: 40,),
                        Container(
                          padding: EdgeInsets.only(right: 20),
                          child: ElevatedButton(
                            onPressed: () async {
                              final url = Uri.parse(
                                'https://youtube.com/shorts/95ifKbU-Es4?feature=share',
                              );
                              if (await canLaunchUrl(url)) {
                                launchUrl(url);
                              } else {
                                // ignore: avoid_print
                                print("Can't launch $url");
                              }
                            },
                            style: ElevatedButton.styleFrom(primary: Colors.deepPurpleAccent),
                            child: const Text('Link'),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget> [
                        Container(
                          padding: EdgeInsets.only(top: 20, bottom: 20, left: 20),
                          child: Text("모델링 Version", style: TextStyle(fontSize: 15, fontFamily: 'neo', fontWeight: FontWeight.w500, color: Colors.white),),
                        ),
                        SizedBox(width: 40,),
                        Container(
                          padding: EdgeInsets.only(right: 20),
                          child: ElevatedButton(
                            onPressed: () async {
                              final url = Uri.parse(
                                'https://youtu.be/IgTgI4ULE6w',
                              );
                              if (await canLaunchUrl(url)) {
                                launchUrl(url);
                              } else {
                                // ignore: avoid_print
                                print("Can't launch $url");
                              }
                            },
                            style: ElevatedButton.styleFrom(primary: Colors.deepPurpleAccent),
                            child: const Text('Link'),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget> [
                        Container(
                          padding: EdgeInsets.only(top: 20, bottom: 20, left: 20),
                          child: Text("BTS's JAZZ", style: TextStyle(fontSize: 15, fontFamily: 'neo', fontWeight: FontWeight.w500, color: Colors.white),),
                        ),
                        SizedBox(width: 40,),
                        Container(
                          padding: EdgeInsets.only(right: 20),
                          child: ElevatedButton(
                            onPressed: () async {
                              final url = Uri.parse(
                                'https://youtu.be/Sh0_Urb6UEo',
                              );
                              if (await canLaunchUrl(url)) {
                                launchUrl(url);
                              } else {
                                // ignore: avoid_print
                                print("Can't launch $url");
                              }
                            },
                            style: ElevatedButton.styleFrom(primary: Colors.deepPurpleAccent),
                            child: const Text('Link'),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget> [
                        Container(
                          padding: EdgeInsets.only(top: 20, bottom: 20, left: 20),
                          child: Text("태연's JAZZ", style: TextStyle(fontSize: 15, fontFamily: 'neo', fontWeight: FontWeight.w500, color: Colors.white),),
                        ),
                        SizedBox(width: 40,),
                        Container(
                          padding: EdgeInsets.only(right: 20),
                          child: ElevatedButton(
                            onPressed: () async {
                              final url = Uri.parse(
                                'https://youtube.com/shorts/86ftNRUkL5I?feature=share',
                              );
                              if (await canLaunchUrl(url)) {
                                launchUrl(url);
                              } else {
                                // ignore: avoid_print
                                print("Can't launch $url");
                              }
                            },
                            style: ElevatedButton.styleFrom(primary: Colors.deepPurpleAccent),
                            child: const Text('Link'),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget> [
                        Container(
                          padding: EdgeInsets.only(top: 20, bottom: 20, left: 20),
                          child: Text("선우정아's JAZZ", style: TextStyle(fontSize: 15, fontFamily: 'neo', fontWeight: FontWeight.w500, color: Colors.white),),
                        ),
                        SizedBox(width: 40,),
                        Container(
                          padding: EdgeInsets.only(right: 20),
                          child: ElevatedButton(
                            onPressed: () async {
                              final url = Uri.parse(
                                'https://youtube.com/shorts/SCry61hxzNc?feature=share',
                              );
                              if (await canLaunchUrl(url)) {
                                launchUrl(url);
                              } else {
                                // ignore: avoid_print
                                print("Can't launch $url");
                              }
                            },
                            style: ElevatedButton.styleFrom(primary: Colors.deepPurpleAccent),
                            child: const Text('Link'),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget> [
                        Container(
                          padding: EdgeInsets.only(top: 20, bottom: 20, left: 20),
                          child: Text("NCT's JAZZ", style: TextStyle(fontSize: 15, fontFamily: 'neo', fontWeight: FontWeight.w500, color: Colors.white),),
                        ),
                        SizedBox(width: 40,),
                        Container(
                          padding: EdgeInsets.only(right: 20),
                          child: ElevatedButton(
                            onPressed: () async {
                              final url = Uri.parse(
                                'https://youtu.be/f6H9M5yu2Rs',
                              );
                              if (await canLaunchUrl(url)) {
                                launchUrl(url);
                              } else {
                                // ignore: avoid_print
                                print("Can't launch $url");
                              }
                            },
                            style: ElevatedButton.styleFrom(primary: Colors.deepPurpleAccent),
                            child: const Text('Link'),
                          ),
                        )
                      ],
                    ),
                  ],
                )
              ),
            ),
          ),
        ),
    );
  }
}



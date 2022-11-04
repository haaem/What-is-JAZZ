import 'package:flutter/material.dart';
import 'package:audioplayer/homepage.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audioplayer/playlist.dart';

void main() {
  AssetsAudioPlayer.setupNotificationsOpenAction((notification) {
    return true;
  });
  runApp(const MyApp(),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'What is JAZZ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      home: AnimatedSplashScreen(
        backgroundColor: Colors.black,
        splashIconSize: 350,
        splash: Column(
          children: [
            Lottie.asset('assets/json/81966-girl-listening-to-music.json', width: 300, height: 300,),
            const Text(
                '재즈가 뭐라고 생각하세요?',
              style: TextStyle(fontFamily: 'neo', fontWeight: FontWeight.w400, fontSize: 27, color: Colors.white),
            ),
          ],
        ),
        nextScreen: const MusicPage(title: 'What is Jazz?',),
        //nextScreen: const PlaylistPage(title: 'playlist',),
        splashTransition: SplashTransition.fadeTransition,
        duration: 2500,
      )
    );
  }
}


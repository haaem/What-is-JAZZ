import 'package:audioplayer/playlist.dart';
import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'dart:math';

class MusicPage extends StatefulWidget {
  const MusicPage({super.key, required this.title});
  final String title;
  @override
  State<MusicPage> createState() => _MusicPageState();
}
class _MusicPageState extends State<MusicPage> with SingleTickerProviderStateMixin {
  static const _PATH = "assets/images";
  static const _LP = "$_PATH/LP.png";
  static const _Joohomin = "$_PATH/joohomin_profile.png";
  static const _Joohomin_pic = "$_PATH/joohomin_pic.png";
  static const _Joohomin_trio = '$_PATH/joohomin_trio.png';
  static const _whatisjazz = "assets/audio/assets_audio_what_is_jazz.mp3";
  static const _joohomin_jazz = "assets/audio/assets_audio_joohomin_jazz.mp3";
  static const _joohomin_jazz_remix = "assets/audio/assets_audio_joohomin_jazz_remix.mp3";
  late AssetsAudioPlayer player;
  late AnimationController _animationController;
  bool _isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  final audio = <Audio> [
    Audio(
      _whatisjazz,
      metas: Metas(
        id: 'what_is_jazz?',
        title: 'What is Jazz',
        artist: '주펄',
        album: 'from. YouTube',
        image: MetasImage.asset(_Joohomin),
      ),
    ),
    Audio(
      _joohomin_jazz,
      metas: Metas(
        id: 'joohominjazz',
        title: 'Joohomin\'s Jazz',
        artist: '주펄',
        album: 'from. YouTube',
        image: MetasImage.asset(_Joohomin_pic),
      ),
    ),
    Audio(
      _joohomin_jazz_remix,
      metas: Metas(
        id: 'joohominjazzremix',
        title: 'Joohomin\'s Jazz Remix',
        artist: '주펄',
        album: 'from. YouTube',
        image: MetasImage.asset(_Joohomin_trio),
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    player = AssetsAudioPlayer.newPlayer();
    _animationController = AnimationController(duration: const Duration(milliseconds: 100), vsync: this);
    _isPlaying = !_isPlaying;
    setAudio();
  }

  void setAudio() async {
    await player.open(
      Playlist(audios: audio, startIndex : 0),
      showNotification: true,
      autoStart: false,
      loopMode: LoopMode.playlist,
    );
  }

  @override
  void dispose() {
    player.dispose();
    print('dispose');
    super.dispose();
    _animationController.dispose();
  }

  Audio find(List<Audio> source, String fromPath) {
    return source.firstWhere((element) => element.path == fromPath);
  }

  void playpauseAudio() async {
    await player.playOrPause();
  }

  void playAudio() async {
    await player.play();
  }

  void pauseAudio() async {
    await player.pause();
  }

  void seekAudio(int n) async {
    await player.seekBy(Duration(seconds: n));
  }

  void setVolume() async {
    await player.setVolume(0.5);
  }

  void nextAudio() async {
    await player.next();
  }

  void prevAudio() async {
    await player.previous();
  }

  void loopAudio() async {
    await player.toggleLoop();
  }

  void playlist() async {
    await player.playlist;
  }

  //hero
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 48),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget> [
                  Container(
                    height: 70,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => PlaylistPage(title: 'playlist',)));},
                          icon: Icon(Icons.playlist_play, color: Colors.white, size: 35,),
                        ),
                        Text("Now Playing", style: TextStyle(fontFamily: 'neo', fontWeight: FontWeight.w400, fontSize: 17, color: Colors.white),),
                        Icon(Icons.piano, color: Colors.white, size: 35,),
                      ],
                    ),
                  ),
                      SizedBox(height: 80,),
                      StreamBuilder (
                          stream: player.current,
                          builder: (context, AsyncSnapshot playing) {
                            if (playing.hasData) {
                              final myAudio = find(audio, playing.data!.audio.assetAudioPath);
                              player.current.listen((playing) {
                                duration = playing!.audio.duration;
                                position = player.currentPosition.value;
                              });
                              print("duration : " + duration.toString());
                              print("position : " + position.toString());
                              return Container(
                                  child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: <Widget>[
                                      Center(
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: <Widget> [
                                            Container(
                                              width: 250,
                                              height: 250,
                                              child: Image.asset(_LP, fit: BoxFit.fill,),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                                                      blurRadius: 20,
                                                      spreadRadius: 1,
                                                    ),
                                                  ],
                                                ),
                                            ),
                                            ClipOval(
                                              child: Image.asset(
                                                myAudio.metas.image!.path,
                                                width: 160,
                                                height: 160,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                        ],
                                      )),
                                      SizedBox(height: 20,),
                                      Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget> [
                                            Text(myAudio.metas.title!.toString(),
                                              style: TextStyle(fontFamily: 'neo', fontSize: 25, color: Colors.white,),),
                                            Text(myAudio.metas.artist!.toString(),
                                              style: TextStyle(fontFamily: 'neo', fontSize: 14, color: Colors.grey,),),
                                          ]
                                      ),
                                      SizedBox(height: 15,),
                                      Container(
                                        constraints: BoxConstraints(maxWidth: 290),
                                        child: Slider(value: player.currentPosition.value.inSeconds.toDouble(),
                                          min: 0.0,
                                          max: duration.inSeconds.toDouble(),
                                          onChanged: (value) async {
                                            final Duration newPosition = Duration(seconds: value.toInt());
                                            await player.seek(newPosition);
                                            value = value;
                                          },
                                          activeColor: Colors.deepPurpleAccent,
                                          inactiveColor: Colors.white70,),),
                                      SizedBox(height: 20,),
                                      Container(
                                        constraints: BoxConstraints(maxWidth: 300),
                                        child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          IconButton(
                                              onPressed : () { prevAudio();},
                                              icon: Icon(Icons.skip_previous, color: Colors.white, size: 35,)
                                          ),
                                          IconButton(
                                              onPressed : () { seekAudio(-10);},
                                              icon: Icon(Icons.fast_rewind, color: Colors.white,size: 35,)
                                          ),
                                          CircleAvatar(
                                            backgroundColor: Colors.deepPurpleAccent,
                                            radius: 30,
                                            child: IconButton(
                                              // padding: EdgeInsets.symmetric(horizontal: 10),
                                              icon: AnimatedIcon(icon: AnimatedIcons.play_pause, progress: _animationController, color: Colors.white, size: 35,),
                                              onPressed : () {
                                                if (_isPlaying) {
                                                  _animationController.forward();
                                                  _isPlaying = false;
                                                } else {
                                                  _animationController.reverse();
                                                  _isPlaying = true;
                                                }
                                                playpauseAudio();},
                                          ),),
                                          IconButton(
                                              onPressed : () { seekAudio(10);},
                                              icon: Icon(Icons.fast_forward, color: Colors.white,size: 35,)
                                          ),
                                          IconButton(
                                              onPressed : () { nextAudio();},
                                              icon: Icon(Icons.skip_next, color: Colors.white,size: 35,)
                                          ),
                                        ],
                                      ),),
                                      SizedBox(
                                        height: 20,
                                      ),
                                    ]),
                              );}return SizedBox.shrink();}),],
                  ),
        )
    ),
    )
    ));
  }
}
import 'package:auto_size_text/auto_size_text.dart';
import 'package:elearn_app/models/course_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoScreen extends StatefulWidget {
  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  var videoDetails;
  YoutubePlayerController _controller;
  PlayerState _playerState;
  var _isInit = false;
  final textcontroller = TextEditingController();

  YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;

  bool _isPlayerReady = false;

  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) {
      setState(() {
        videoDetails = ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
        if (videoDetails != null)
          _controller = YoutubePlayerController(
            initialVideoId: YoutubePlayer.convertUrlToId(videoDetails['videoUrl']),
            flags: const YoutubePlayerFlags(
              mute: false,
              autoPlay: true,
              //disableDragSeek: false,
              loop: false,

              isLive: false,
              forceHD: false,
              enableCaption: true,
            ),
          )..addListener(checkIfFinished);
        _playerState = PlayerState.unknown;
        _videoMetaData = const YoutubeMetaData();
      });
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {}
    _isInit = false;
    super.didChangeDependencies();
  }

  void checkIfFinished() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    textcontroller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(videoDetails);

    return YoutubePlayerBuilder(
      onExitFullScreen: () {
        // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      },
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: videoDetails['isWatched'] ? false : true,
        progressIndicatorColor: Colors.blueAccent,
        topActions: <Widget>[
          const SizedBox(width: 8.0),
          Expanded(
            child: Text(
              _controller.metadata.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
              size: 25.0,
            ),
            onPressed: () {
              print('Settings Tapped!');
            },
          ),
        ],
        onReady: () {
          _isPlayerReady = true;
        },
        onEnded: (data) async {
          videoDetails['isWatched'] = true;
          SharedPreferences pref = await SharedPreferences.getInstance();
          if (pref.containsKey('rewards')) {
            pref.setInt('rewards', pref.getInt('rewards') + 10);

            Provider.of<Courses>(context, listen: false).setRewards(pref.getInt('rewards'));
            print(pref.getInt('rewards'));
          } else {
            pref.setInt('rewards', 10);
            Provider.of<Courses>(context, listen: false).setRewards(pref.getInt('rewards'));
            print(pref.getInt('rewards'));
          }

          setState(() {
            _playerState = PlayerState.ended;
          });
          Navigator.of(context).pop();
        },
      ),
      builder: (ctx, player) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            toolbarHeight: 70,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              splashRadius: 25,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            elevation: 0,
            title: Text(
              videoDetails['videoTitle'],
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                player,
                Container(
                  margin: EdgeInsets.all(10),
                  child: AutoSizeText(
                    'Tap the grey area to take Notes here.',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Colors.grey[100],
                    child: TextField(
                      maxLines: 20,
                      // decoration: const InputDecoration(
                      //   contentPadding: const EdgeInsets.symmetric(vertical: 80.0),

                      // ),
                      controller: textcontroller,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

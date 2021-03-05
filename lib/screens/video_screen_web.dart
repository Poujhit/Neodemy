import 'package:auto_size_text/auto_size_text.dart';
import 'package:elearn_app/models/course_provider.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoScreenWeb extends StatefulWidget {
  @override
  _VideoScreenWebState createState() => _VideoScreenWebState();
}

class _VideoScreenWebState extends State<VideoScreenWeb> {
  var videoDetails;
  YoutubePlayerController _controller;
  // ignore: unused_field
  PlayerState _playerState;
  var _isInit;
  final notesText = TextEditingController();

  @override
  void initState() {
    _isInit = false;
    Future.delayed(Duration.zero).then((_) {
      setState(() {
        videoDetails = ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
        if (videoDetails != null)
          _controller = YoutubePlayerController(
            initialVideoId: YoutubePlayerController.convertUrlToId(videoDetails['videoUrl']),
            params: YoutubePlayerParams(
              desktopMode: true,
              enableJavaScript: true,
              loop: false,
              privacyEnhanced: true,
              autoPlay: true,
              showControls: true,
              playsInline: true,
            ),
          );
        _playerState = PlayerState.unknown;
        _controller.listen((event) async {
          if (event.playerState == PlayerState.unknown) {
            SharedPreferences pref = await SharedPreferences.getInstance();
            if (pref.containsKey('notesByUser${videoDetails['videoUrl']}'))
              notesText.text = pref.getString('notesByUser${videoDetails['videoUrl']}');
          }
          if (event.playerState == PlayerState.ended) {
            videoDetails['isWatched'] = true;
            SharedPreferences pref = await SharedPreferences.getInstance();
            if (pref.containsKey('rewards')) {
              pref.setInt('rewards', pref.getInt('rewards') + 10);
              Provider.of<Courses>(context, listen: false).setRewards(pref.getInt('rewards'));
            } else {
              pref.setInt('rewards', 10);
              Provider.of<Courses>(context, listen: false).setRewards(pref.getInt('rewards'));
            }
            pref.setString('notesByUser${videoDetails['videoUrl']}', notesText.text);

            Future.delayed(Duration(seconds: 5)).then((_) => Navigator.of(context).pop());
            Fluttertoast.showToast(
              msg: 'This Screen will be closed in 5 Secs. Your Notes Notes Will be saved.',
              toastLength: Toast.LENGTH_LONG,
              webPosition: "center",
            );
          }
        });
        _isInit = true;
      });
    });

    super.initState();
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.close();
    notesText.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const player = YoutubePlayerIFrame();
    return _isInit
        ? YoutubePlayerControllerProvider(
            controller: _controller,
            child: Scaffold(
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
                          controller: notesText,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }
}

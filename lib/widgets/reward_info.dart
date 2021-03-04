import 'package:auto_size_text/auto_size_text.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class RewardInfoWidget extends StatefulWidget {
  @override
  _RewardInfoWidgetState createState() => _RewardInfoWidgetState();
}

class _RewardInfoWidgetState extends State<RewardInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done && snapshot.data.containsKey('dontshowRewardinfoBanner'))
          return Container();
        if (snapshot.connectionState == ConnectionState.waiting) return Container();
        return Container(
          margin: const EdgeInsets.only(bottom: 15),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: AutoSizeText(
                    'Info about our Reward System',
                    style: Theme.of(context).textTheme.headline2,
                    maxLines: 1,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(
                    right: 10,
                  ),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      primary: const Color(0xAA1D9398),
                    ),
                    onPressed: () {
                      snapshot.data.setInt('dontshowRewardinfoBanner', 1);
                      setState(() {});
                    },
                    child: AutoSizeText(
                      'Close',
                      maxLines: 1,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(
                    right: 10,
                  ),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      textStyle: TextStyle(),
                      primary: const Color(0xAA1D9398),
                    ),
                    onPressed: () {
                      showGeneralDialog(
                          barrierDismissible: true,
                          barrierLabel: 'reward info',
                          context: context,
                          pageBuilder: (ctx, _, __) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(15),
                                    child: Text(
                                      'Rewards are given to the user as points when they finish watching a video in a course. 10 Points are awarded for each video when fully watched.\n Users can share it with their friends and family to show their involvement in learning new things everyday. \nCurrently our Reward System is limited in features but we ensure you that in future, your reward points will be more value and use to you(users).',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Divider(thickness: 1),
                                  GestureDetector(
                                    onTap: () => Navigator.of(ctx).pop(),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            margin: EdgeInsets.only(
                                              bottom: 5,
                                            ),
                                            child: TextButton(
                                              style: TextButton.styleFrom(
                                                primary: Colors.white,
                                              ),
                                              onPressed: () => Navigator.of(ctx).pop(),
                                              child: Text(
                                                'OK',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
                    },
                    child: AutoSizeText(
                      'Show',
                      maxLines: 1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

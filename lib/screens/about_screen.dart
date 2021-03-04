import 'package:flutter/material.dart';

import '../widgets/custom_appbar.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          CustomAppBar('About'),
          SliverFillRemaining(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      'About the App',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    subtitle: Text(
                      'Legal Information about the App',
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                    ),
                    onTap: () => showAboutDialog(
                      context: context,
                      applicationName: 'Neodemy',
                      applicationIcon: SizedBox(
                        height: 40,
                        width: 40,
                        child: Image.asset(
                          'assets/images/logo.png',
                        ),
                      ),
                      applicationVersion: '1.0.0',
                      applicationLegalese:
                          'An E-Learning Platform with a reward System integrated. \n\nMade by the team Chennai Sharks for the hackathon EASE THE ERROR 1.0!',
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      'Information on the Ratings System',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                    ),
                    onTap: () => showGeneralDialog(
                        barrierDismissible: true,
                        barrierLabel: 'lalala',
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
                                  child: const Text(
                                    'Ratings given in every course are not given by the users using the app. These Ratings are given by An External Pannel of Faculties and Students.',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
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
                        }),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      'Information on our Reward System',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                    ),
                    onTap: () => showGeneralDialog(
                        barrierDismissible: true,
                        barrierLabel: 'lalala',
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
                                  child: const Text(
                                    'Rewards are given to the user as points when they finish watching a video in a course. 10 Points are awarded for each video when fully watched.\n Users can share it with their friends and family to show their involvement in learning new things everyday. \nCurrently our Reward System is limited in features but we ensure you that in future, your reward points will be more value and use to you(users).',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
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
                        }),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

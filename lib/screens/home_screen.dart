import 'package:elearn_app/models/auth.dart';
import 'package:elearn_app/widgets/all_category.dart';
import 'package:elearn_app/widgets/reward_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/bottom_navbar.dart';
import '../models/course_provider.dart';
import '../widgets/my_courses_cards.dart';
import '../widgets/all_courses.dart';
import './auth_screen.dart';
import './view_all_mycourse_screen.dart';
import './view_allcourses_screem.dart';
import './profile_screen.dart';
import '../widgets/title_header.dart';

class HomeUi extends StatefulWidget {
  @override
  _HomeUiState createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {
  final String name = 'home';
  var _isInit = true;
  var _isLoading = false;
  Future<dynamic> _fun;

  Route _createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondAnimation) => page,
      transitionsBuilder: (context, animation, secondAnimation, child) {
        var begin = Offset(1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.easeInOut;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      _fun = Provider.of<Courses>(
        context,
      ).loadmycourse();
      Provider.of<Courses>(context, listen: false).fetchAndSetCourses().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final userInfo = Provider.of<Auth>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'HOME',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RewardInfoWidget(),
            FutureBuilder(
              future: _fun,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data)
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleHeader(
                          'My Courses',
                          () => Navigator.push(
                            context,
                            _createRoute(
                              ViewAllMyCourseScreen(),
                            ),
                          ),
                          true,
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        MyCourseCards(),
                        SizedBox(
                          height: 27,
                        ),
                      ],
                    );
                  else
                    return Text('');
                } else
                  return Text('');
              },
            ),
            _isLoading
                ? Center(child: CircularProgressIndicator())
                : TitleHeader(
                    'Courses',
                    () => Navigator.push(
                      context,
                      _createRoute(
                        ViewAllCourseScreen(),
                      ),
                    ),
                    true,
                  ),
            SizedBox(
              height: 7,
            ),
            AllCourseCard(),
            SizedBox(
              height: 27,
            ),
            _isLoading
                ? Center(child: CircularProgressIndicator())
                : TitleHeader(
                    'Economics Courses',
                    () => Navigator.push(
                      context,
                      _createRoute(
                        ViewAllCourseScreen(),
                      ),
                    ),
                    false,
                  ),
            SizedBox(
              height: 7,
            ),
            Category1(),
            SizedBox(
              height: 27,
            ),
            _isLoading
                ? Center(child: CircularProgressIndicator())
                : TitleHeader(
                    'Psychology Courses',
                    () => Navigator.push(
                      context,
                      _createRoute(
                        ViewAllCourseScreen(),
                      ),
                    ),
                    false,
                  ),
            SizedBox(
              height: 7,
            ),
            Category2(),
            SizedBox(
              height: 27,
            ),
            _isLoading
                ? Center(child: CircularProgressIndicator())
                : TitleHeader(
                    'Programming Courses',
                    () => Navigator.push(
                      context,
                      _createRoute(
                        ViewAllCourseScreen(),
                      ),
                    ),
                    false,
                  ),
            SizedBox(
              height: 7,
            ),
            Category3(),
            SizedBox(
              height: 27,
            ),
            _isLoading
                ? Center(child: CircularProgressIndicator())
                : TitleHeader(
                    'Socialogy Courses',
                    () => Navigator.push(
                      context,
                      _createRoute(
                        ViewAllCourseScreen(),
                      ),
                    ),
                    false,
                  ),
            SizedBox(
              height: 7,
            ),
            Category4(),
            SizedBox(
              height: 27,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (name != 'profile')
            Navigator.of(context)
                .push(
              MaterialPageRoute(
                builder: (ctx) => ProfileScreen(),
              ),
            )
                .then((value) {
              if (value != null)
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => AuthScreen()));
            });
        },
        elevation: 2,
        tooltip: 'Profile Page',
        backgroundColor: Colors.white,
        child: Container(
          width: 35,
          height: 35,
          child: Image.network(
            userInfo.profileUrl,
            fit: BoxFit.contain,
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(name),
    );
  }
}

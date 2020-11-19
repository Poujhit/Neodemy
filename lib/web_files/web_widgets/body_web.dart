import 'package:auto_size_text/auto_size_text.dart';
import 'package:elearn_app/models/course_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BodyWeb extends StatefulWidget {
  @override
  _BodyWebState createState() => _BodyWebState();
}

class _BodyWebState extends State<BodyWeb> {
  var _isInit = true;

  var _isLoading = false;
  double i = 230;
  double count = 0;
  final scrollcontrol = ScrollController();

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });

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
    final _courses = Provider.of<Courses>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          // height: 150,
          margin: EdgeInsets.only(
            left: 60,
            top: 40,
            bottom: 30,
          ),
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                flex: 7,
                child: Container(
                  margin: EdgeInsets.only(
                    left: 40,
                  ),
                  child: Text(
                    'All\nCourses',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    width: 50,
                    child: Row(
                      children: [
                        FlatButton(
                          onPressed: () {
                            i = count + 1 * 230 - 230;
                            scrollcontrol.animateTo(
                              i,
                              curve: Curves.easeInOut,
                              duration: Duration(milliseconds: 600),
                            );
                            print(i);
                          },
                          minWidth: 30,
                          height: 40,
                          color: Color(0xFF3e80ff),
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        FlatButton(
                          onPressed: () {
                            if (i < 230) i = 230;
                            scrollcontrol.animateTo(
                              i,
                              curve: Curves.easeInOut,
                              duration: Duration(milliseconds: 600),
                            );
                            i += 230;
                            count++;
                            print(i);
                          },
                          minWidth: 30,
                          height: 40,
                          color: Color(0xFF3e80ff),
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
        Container(
          height: 440,
          margin: EdgeInsets.only(
            bottom: 40,
          ),
          // color: Colors.green,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: 440,
                  child: Column(
                    children: [
                      Expanded(
                        child: FlatButton(
                          onPressed: () {},
                          child: Text(
                            'All Courses',
                          ),
                        ),
                      ),
                      Expanded(
                        child: FlatButton(
                          onPressed: () {},
                          child: Text(
                            'Programming',
                          ),
                        ),
                      ),
                      Expanded(
                        child: FlatButton(
                          onPressed: () {},
                          child: Text(
                            'Economics',
                          ),
                        ),
                      ),
                      Expanded(
                        child: FlatButton(
                          onPressed: () {},
                          child: Text(
                            'Psychology',
                          ),
                        ),
                      ),
                      Expanded(
                        child: FlatButton(
                          onPressed: () {},
                          child: Text(
                            "Sociology",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  height: 440,
                  child: _isLoading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : GridView.builder(
                          scrollDirection: Axis.horizontal,
                          controller: scrollcontrol,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 30,
                          ),
                          itemCount: _courses.courseData.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 200,
                              child: Card(
                                elevation: 7,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                //shadowColor: Colors.white,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Image.network(
                                        _courses.courseData[index].imageUrl,
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        width: 120,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: AutoSizeText(
                                                _courses.courseData[index].coursename,
                                                maxLines: 3,
                                                style: Theme.of(context).textTheme.subtitle1,
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            Expanded(
                                              child: AutoSizeText(
                                                'Rating - ${_courses.courseData[index].ratings}',
                                                maxLines: 3,
                                                style: Theme.of(context).textTheme.subtitle2,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

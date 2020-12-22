import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_me/Database_helper.dart';
import 'package:test_me/Screens/taskpage.dart';
import 'package:test_me/Screens/widgets.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  DatabaseHelper _dbHelper = DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: 24.0,
              //vertical: 32.0,
            ),
            color: Color(0xFFf6f6f6),
            child: Stack(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                        top: 32.0,
                        bottom: 32.0,
                      ),
                      child: Image(image: AssetImage('Assets/images/logo.png')),
                    ),
                    Expanded(
                      child: FutureBuilder(
                        initialData: [],
                        future: _dbHelper.getTasks(),
                        builder: (context, snapshot) {
                          return ScrollConfiguration(
                            behavior: NoGlowBehaviour(),
                            child: ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap:(){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Taskpage(
                                            task : snapshot.data[index],
                                          )),
                                    );

                                  },
                                  child: Taskcardwidget(
                                    title: snapshot.data[index].title,
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
                Positioned(
                  bottom: 24.0,
                  right: 0.0,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Taskpage( task : null,)),
                        ).then((value){
                          setState(() {});
                        });

                    },
                    child: Container(
                      width: 60.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF7349FE), Color(0xFF643FDE)],
                          begin: Alignment(0.0, -1.0),
                          end: Alignment(0.0, 1.0),
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Image(
                        image: AssetImage("Assets/images/add_icon.png"),
                      ),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}

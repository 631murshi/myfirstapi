import 'package:flutter/material.dart';
import 'package:myfirstapi/pages/modelclass.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hexcolor/hexcolor.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  List<Memberlist> memberlist = [];

  ModelClass? obj_modelclass;
  Future? obj_future;

  Future<ModelClass> myfirstapi() async {
    var myurl = Uri.parse(
        "https://run.mocky.io/v3/5ac9712a-d3a4-482b-883c-ab80e41f153a");
    var res = await http.get(myurl);
    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      obj_modelclass = ModelClass.fromJson(data);

      for (int i = 0; i < obj_modelclass!.memberlist!.length; i++) {
        memberlist.add(obj_modelclass!.memberlist![i]);
      }
    }
    return obj_modelclass!;
  }

  @override
  void initState() {
    obj_future = myfirstapi();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: obj_future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return mainwidget(memberlist);
          } else {
            return LinearProgressIndicator();
          }
        },
      ),
    );
  }
  Widget mainwidget(
      List<Memberlist> memberlist
      )
  {
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child:Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Expanded(
                      child: ListView.builder(
                          itemCount: obj_modelclass!.memberlist!.length,
                          itemBuilder: (context, index) {
                            return Container(
                                padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
                                height: (MediaQuery.of(context).size.width - 30) * .333,
                                width: MediaQuery.of(context).size.width - 30,
                                // color: Colors.blue,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  elevation: 4,
                                  color: HexColor("7DA7F3"),
                                  child: Container(
                                    padding: EdgeInsets.only(left: 20, top: 20),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(50),
                                            child: Image.network(
                                              memberlist[index].image.toString(),
                                              height: 50,
                                              width: 50,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: 10),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 4,
                                              ),
                                              Text(
                                                memberlist[index].name.toString(),
                                                style: TextStyle(color: Colors.white),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                memberlist[index].title.toString(),
                                                style: TextStyle(color: Colors.white),
                                              ),
                                              SizedBox(
                                                height: 16,
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Container(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                      children: [
                                                        Text(
                                              memberlist[index].popularity.toString(),
                                                          style: TextStyle(
                                                              color: Colors.white),
                                                        ),
                                                        Text(
                                                          "Popularity",
                                                          style: TextStyle(
                                                              color: Colors.white),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 10, right: 10),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                      children: [
                                                        Text(
                                                    memberlist[index].like.toString(),
                                                          style: TextStyle(
                                                              color: Colors.white),
                                                        ),
                                                        Text(
                                                          "Likes",
                                                          style: TextStyle(
                                                              color: Colors.white),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 10, right: 10),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                      children: [
                                                        Text(
                                                    memberlist[index].followers.toString(),
                                                          style: TextStyle(
                                                              color: Colors.white),
                                                        ),
                                                        Text(
                                                         "Followers" ,
                                                          style: TextStyle(
                                                              color: Colors.white),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        Expanded(child: SizedBox()),
                                        Container(
                                          margin: EdgeInsets.only(right: 20),
                                          //padding: EdgeInsets.only(left: 20),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                          memberlist[index].ranking.toString(),
                                                style: TextStyle(
                                                    color: Colors.white, fontSize: 24),
                                              ),
                                              Text(
                                                "Ranking",
                                                style: TextStyle(color: Colors.white),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ));

                          }),
                    ),
                  ),






                ]
            )
        )
    );
  }
}

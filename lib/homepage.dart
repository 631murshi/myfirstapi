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
        "https://run.mocky.io/v3/24309d1f-4cb3-4556-b717-8097d6866c5d");
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
                      padding: EdgeInsets.fromLTRB(10,30,10,0),
                      height: 150,
                      width: double.maxFinite,
                      // color: Colors.blue,
                      child: Card(
                        elevation: 5,
                        color:HexColor("7DA6F5"),
                        child: Container(
                          padding: EdgeInsets.only(left: 10,top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Image.network("https://hips.hearstapps.com/harpersbazaaruk.cdnds.net/15/37/original/original-sean-opry-jpg-ce0f89f.jpg?resize=480:*",
                                  height: 40,
                                  width: 50,),
                              ),
                              Container(
                                padding: EdgeInsets.only(),
                                child: Column(
                                  children: [
                                    Text(memberlist[0].name.toString(),
                                      style: TextStyle(
                                        color: Colors.white
                                    ),),
                                    SizedBox(height: 5,),
                                    Text(memberlist[0].title.toString(),style: TextStyle(
                                        color: Colors.white
                                    ),),
                                    SizedBox(height: 16,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Text("2342",style: TextStyle(
                                                  color: Colors.white
                                              ),),
                                              Text(memberlist[0].popularity.toString(),style: TextStyle(
                                                   color: Colors.white
                                              ),)
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 10,right: 10),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Text("4352",style: TextStyle(
                                                  color: Colors.white
                                              ),),
                                              Text(memberlist[0].like.toString(),style: TextStyle(
                                                  color: Colors.white
                                              ),)
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 10,right: 10),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Text("352",style: TextStyle(
                                                  color: Colors.white
                                              ),),
                                              Text(memberlist[0].followers.toString(),style: TextStyle(
                                                  color: Colors.white
                                              ),)
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
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("1",style: TextStyle(
                                        color: Colors.white,fontSize: 24
                                    ),),
                                    Text(memberlist[0].rank.toString(),style: TextStyle(
                                        color: Colors.white
                                    ),)
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),

                      )
                  ),
                  Container(
                      padding: EdgeInsets.fromLTRB(10,30,10,0),
                      height: 150,
                      width: double.maxFinite,
                      // color: Colors.blue,
                      child: Card(
                        elevation: 5,
                        color:HexColor("F0A15E"),
                        child: Container(
                          padding: EdgeInsets.only(left: 10,top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Image.network("data:image/jpeg;base64,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",
                                  height: 40,
                                  width: 50,),
                              ),
                              Container(
                                padding: EdgeInsets.only(),
                                child: Column(
                                  children: [
                                    Text(memberlist[1].name.toString(),style: TextStyle(
                                        color: Colors.white
                                    ),),
                                    SizedBox(height: 5,),
                                    Text(memberlist[1].title.toString(),style: TextStyle(
                                        color: Colors.white
                                    ),),
                                    SizedBox(height: 16,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Text("2562",style: TextStyle(
                                                  color: Colors.white
                                              ),),
                                              Text(memberlist[1].popularity.toString(),style: TextStyle(
                                                  color: Colors.white
                                              ),)
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 10,right: 10),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Text("4762",style: TextStyle(
                                                  color: Colors.white
                                              ),),
                                              Text(memberlist[1].like.toString(),style: TextStyle(
                                                  color: Colors.white
                                              ),)
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 10,right: 10),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Text("332",style: TextStyle(
                                                  color: Colors.white
                                              ),),
                                              Text(memberlist[1].followers.toString(),style: TextStyle(
                                                  color: Colors.white
                                              ),)
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
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("2",style: TextStyle(
                                        color: Colors.white,fontSize: 24
                                    ),),
                                    Text(memberlist[1].rank.toString(),style: TextStyle(
                                        color: Colors.white
                                    ),)
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),

                      )
                  ),
                  Container(
                      padding: EdgeInsets.fromLTRB(10,30,10,0),
                      height: 150,
                      width: double.maxFinite,
                      // color: Colors.blue,
                      child: Card(
                        elevation: 5,
                        color:HexColor("EA5976"),
                        child: Container(
                          padding: EdgeInsets.only(left: 10,top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmRtg_cPjtzbtLPFtyy6tXVQtiAD0pm3G6QFtvm_iNi70l-6Z4-QuT4y0TEcpMmvPbL_0&usqp=CAU",
                                  height: 40,
                                  width: 50,),
                              ),
                              Container(
                                padding: EdgeInsets.only(),
                                child: Column(
                                  children: [
                                    Text(memberlist[2].name.toString(),style: TextStyle(
                                        color: Colors.white
                                    ),),
                                    SizedBox(height: 5,),
                                    Text(memberlist[2].title.toString(),style: TextStyle(
                                        color: Colors.white
                                    ),),
                                    SizedBox(height: 16,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Text("2262",style: TextStyle(
                                                  color: Colors.white
                                              ),),
                                              Text(memberlist[2].popularity.toString(),style: TextStyle(
                                                  color: Colors.white
                                              ),)
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 10,right: 10),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Text("4262",style: TextStyle(
                                                  color: Colors.white
                                              ),),
                                              Text(memberlist[2].like.toString(),style: TextStyle(
                                                  color: Colors.white
                                              ),)
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 10,right: 10),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Text("282",style: TextStyle(
                                                  color: Colors.white
                                              ),),
                                              Text(memberlist[2].followers.toString(),style: TextStyle(
                                                  color: Colors.white
                                              ),)
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
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("3",style: TextStyle(
                                        color: Colors.white,fontSize: 24
                                    ),),
                                    Text(memberlist[2].rank.toString(),style: TextStyle(
                                        color: Colors.white
                                    ),)
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),

                      )
                  ),

                ]
            )
        )
    );
  }
}

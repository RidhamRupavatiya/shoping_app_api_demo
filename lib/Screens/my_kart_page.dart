import 'dart:convert';

import 'package:api_demo/Api/model.dart';
import 'package:api_demo/Assets/insert_items.dart';
import 'package:api_demo/Screens/product_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class MyCartPage extends StatefulWidget {
  MyCartPage({Key? key}) : super(key: key);

  @override
  State<MyCartPage> createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Kart',
        ),
        backgroundColor: Colors.lightBlueAccent,
        actions: [IconButton(onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return InsertItems(map: null,);
          },)).then((value) {
            if(value == true){
              setState(() {
              });
            }
          });
        }, icon: Icon(Icons.add))],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: FutureBuilder<http.Response>(
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                dynamic jsonData = jsonDecode(snapshot.data!.body.toString());
                return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            const EdgeInsets.only(left: 18, top: 15, right: 18),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                              return ProductPage(map: jsonData[index],);
                            },));
                          },
                          child: Container(
                            height: 140,
                            width: width * 0.9,
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(11)),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 11,
                                          right: 11,
                                          top: 19,
                                          bottom: 17),
                                      child: Container(
                                        height: 100,
                                        width: 120,
                                        decoration: BoxDecoration(
                                            color: Colors.green[100],
                                            borderRadius:
                                                BorderRadius.circular(11)),
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 2, bottom: 2),
                                            child: Container(
                                                child: Image(
                                              image: NetworkImage(
                                                  jsonData[index]["image"]),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 1, right: 6, top: 18),
                                      child: Text(
                                        jsonData[index]["name"],
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 1, right: 6, top: 14),
                                      child: Row(
                                        children: [
                                          Icon(Icons.currency_rupee),
                                          Text(jsonData[index]["price"],
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(child: Container()),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 15, top: 18),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Size : M',
                                            style: TextStyle(fontSize: 15),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 18),
                                      child: Container(
                                        height: 35,
                                        width: 70,
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.orange),
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(left: 12),
                                              child: Text('-',
                                                  style: TextStyle(
                                                      fontSize: 25,
                                                      color: Colors.orange)),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5, right: 5),
                                              child: Text('1',
                                                  style: TextStyle(fontSize: 25)),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(right: 5),
                                              child: Text('+',
                                                  style: TextStyle(
                                                      fontSize: 25,
                                                      color: Colors.orange)),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                   Row(
                                     children: [
                                      InkWell(onTap: () {
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                                          //print(shopingApi[index]);
                                          return InsertItems(map: jsonData[index]);
                                        },),).then((value) {
                                          setState(() {

                                          });
                                        },);
                                      },child: Icon(Icons.edit)),
                                       IconButton(
                                         icon: Icon(Icons.delete,color: Colors.red,),
                                         onPressed: () {
                                           showDeleteAlert(jsonData[index]["id"]);
                                         },
                                       ),
                                     ],
                                   ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: jsonData.length);
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
            future: getData()),
      ),
    );
  }
  //get By All
  Future<http.Response> getData() async {
    http.Response res = await http.get(Uri.parse('https://63ef2b5d4d5eb64db0c4414a.mockapi.io/shopingapp/'));
    print(res.body);
    return res;
  }

  Future<dynamic> getById(id) async {
    final response1 = await http.get(
        Uri.parse("https://63ef2b5d4d5eb64db0c4414a.mockapi.io/shopingapp/$id"));
    Exception("Exception raise");
    return response1;
  }

  // DeleteBYId
  Future<dynamic> deleteById(id) async {
    final response2 = await http.delete(
        Uri.parse("https://63ef2b5d4d5eb64db0c4414a.mockapi.io/shopingapp/$id"));
    return response2;
  }

  // showDeleteAlertBox
  void showDeleteAlert(id) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Are you sure"),
          content: Text("it will be delete parmanetaly"),
          actions: [
            TextButton(
                onPressed: () {
                  deleteById(id).then((value) {
                    setState(() {
                    });
                  },);
                  Navigator.of(context).pop();
                },
                child: Text("yes")),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("no")),
          ],
        );
      },
    );
  }
}
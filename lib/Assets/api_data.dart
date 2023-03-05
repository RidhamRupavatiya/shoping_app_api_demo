import 'dart:convert';

import 'package:api_demo/Api/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiData extends StatelessWidget {
  ApiData({Key? key}) : super(key: key);
  List<ShopingApi> shopingApi = [];

  @override
  void initState(){
    getDataFromApi();
  }
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return FutureBuilder<List<ShopingApi>>(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 290,
                    crossAxisCount: 2,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 2
                  ),
                  itemCount: shopingApi.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 9,
                      color: Colors.grey.shade200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 20,top: 5,bottom: 5),
                                child: Text('50 % off',style: TextStyle(fontWeight: FontWeight.bold,),),
                              ),
                              CircleAvatar(child: Icon(Icons.favorite,color: Colors.grey.shade400),backgroundColor: Colors.grey.shade200)
                            ],
                          ),
                          Center(
                            child: Image(
                              image: NetworkImage(shopingApi[index].image),
                              fit: BoxFit.fill,
                              height: 160,
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0),
                            child: Text('Name : ${shopingApi[index].name}',
                                style: TextStyle(fontSize: 18)),
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 17.0),
                                child: Icon(Icons.currency_rupee,size: 18),
                              ),
                              Text(shopingApi[index].price,
                                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 18.0,),
                                child: Icon(Icons.currency_rupee,size: 14),
                              ),
                              Text("1000",
                                style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,decoration: TextDecoration.lineThrough),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
        future: getDataFromApi());
  }

  Future<List<ShopingApi>> getDataFromApi() async {
    // Get Method
    final response = await http.get(
        Uri.parse("https://63ef2b5d4d5eb64db0c4414a.mockapi.io/shopingapp"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        shopingApi.add(ShopingApi.fromJson(index));
      }
    }
    // Get By Id
    // final response1 = await http.get(Uri.parse(('https://63ef2b5d4d5eb64db0c4414a.mockapi.io/shopingapp/')));
    return shopingApi;
  }
}
import 'dart:convert';
import 'package:api_demo/Api/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class GridViewDemo extends StatelessWidget {
  GridViewDemo({Key? key}) : super(key: key);
  @override
  List<ShopingApi> shopingApi = [];

  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: FutureBuilder<List<ShopingApi>>(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: shopingApi.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 9,
                      color: Colors.grey.shade200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(
                            image: NetworkImage(shopingApi[index].image),
                            fit: BoxFit.fill,
                          ),
                          Text('ID :${shopingApi[index].id}',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          Text('Porduct Name : ${shopingApi[index].name}',
                              style: TextStyle(fontSize: 16)),
                          Row(
                            children: [
                              Icon(Icons.currency_rupee),
                              Text(shopingApi[index].price,
                                  style: TextStyle(fontSize: 16)),
                            ],
                          ),
                        ],
                      ),
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
          future: getDataFromApi()),
    );
  }

  Future<List<ShopingApi>> getDataFromApi() async {
    final response = await http.get(
        Uri.parse("https://63ef2b5d4d5eb64db0c4414a.mockapi.io/shopingapp"));

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        shopingApi.add(ShopingApi.fromJson(index));
      }
    } else {
      shopingApi;
    }
    return shopingApi;
  }
}

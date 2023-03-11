import 'dart:convert';

import 'package:api_demo/Api/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class InsertItems extends StatefulWidget {

  Map? map;

  InsertItems({super.key , this.map});

  @override
  State<InsertItems> createState() => _InsertItemsState();
}

class _InsertItemsState extends State<InsertItems> {

  var formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();

  var imageController = TextEditingController();

  var priceController = TextEditingController();
  @override
  void initState() {
    super.initState();
    nameController.text = widget.map==null?"":widget.map!["name"];
    imageController.text = widget.map==null?"":widget.map!["image"];
    priceController.text = widget.map==null?"":widget.map!["price"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0,top: 5,right: 8),
          child: Card(
            elevation: 9,
            child: Container(
              height: 230,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 6.0,right: 6.0,top: 8),
                    child: TextFormField(decoration: const InputDecoration(hintText: "Enter Name"),validator: (value) {
                      if(value==null && value!.isEmpty){
                        return "Enter Valid Name";
                      }
                    },controller: nameController),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 6.0,right: 6.0,top: 8),
                    child: TextFormField(decoration: const InputDecoration(hintText: "Enter Image Url"),validator: (value) {
                      if(value==null && value!.isEmpty){
                        return "Enter Valid Image Url";
                      }
                    },controller: imageController),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 6.0,right: 6.0,top: 8),
                    child: TextFormField(decoration: const InputDecoration(hintText: "Enter Price"),validator: (value) {
                      if(value==null && value!.isEmpty){
                        return "Enter Valid Price";
                      }
                    },controller: priceController),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 6.0,right: 6.0,top: 8),
                    child: TextButton(onPressed: () {
                      if(formKey.currentState!.validate()){
                        if(widget.map==null){
                          insertItem().then((value) => Navigator.of(context).pop(true));
                          print("Insert");
                        }else{
                          upDateItem(widget.map!['id']).then((value) => Navigator.of(context).pop(true));
                          print("Update");
                          print(widget.map);
                        }
                      }
                    }, child: Text("Submit",style: TextStyle(fontSize: 18),)),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Insert Data
  Future<dynamic> insertItem() async {
    Map map = {};
    map["name"] = nameController.text;
    map["image"] = imageController.text;
    map["price"] = priceController.text;
    var response1 = await http.post(Uri.parse('https://63ef2b5d4d5eb64db0c4414a.mockapi.io/shopingapp'),body: map);
    print(response1.body);
    return response1;
  }
  //Update Data
  Future<dynamic> upDateItem(id) async {
    Map map = {};
    map["name"] = nameController.text;
    map["image"] = imageController.text;
    map["price"] = priceController.text;
    final response2 = await http.put(
        Uri.parse("https://63ef2b5d4d5eb64db0c4414a.mockapi.io/shopingapp/$id"),body: map);
    return response2;
  }

}

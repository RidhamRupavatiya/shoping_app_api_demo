import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProductPage extends StatelessWidget {
  ProductPage({super.key , this.map});
  Map? map;
  // const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(200),
                          bottomLeft: Radius.circular(200),
                        ),
                        color: Colors.grey[200]),
                    height: 420,
                    width: width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: InkWell(
                              onTap: (){
                                Navigator.of(context).pop();
                              },
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.black,
                                size: 40,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 2,right: 2),
                          child: Center(
                            child: Container(
                              height: 270,
                              child: Image.network(
                                // 'assets/Images/Noise-colorFit-Qube.webp',
                                map!["image"],
                                // height: 320,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 6),
                                      child: Icon(Icons.circle,
                                          color: Colors.white),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 3, right: 3),
                                      child: Icon(Icons.circle,
                                          color: Colors.orange[300]),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 6),
                                      child: Icon(
                                        Icons.circle,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18, top: 25, right: 18),
              child: Row(
                children: [
                  Container(
                    child: Text(
                      // 'Noise Color Fit Series 6',
                      map!["name"],
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18, top: 15, right: 18),
              child: Row(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber),
                        Icon(Icons.star, color: Colors.amber),
                        Icon(Icons.star, color: Colors.amber),
                        Icon(Icons.star, color: Colors.amber),
                        Icon(Icons.star, color: Colors.amber),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18, top: 15, right: 18),
              child: Row(
                children: [
                  Icon(Icons.currency_rupee, size: 35),
                  Padding(
                    padding: const EdgeInsets.only(left: 2),
                    child: Text(map!["price"], style: TextStyle(fontSize: 35)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Icon(Icons.currency_rupee,
                        size: 20, color: Colors.grey),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 2),
                    child: Text('5,500',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Text('Available Stock',
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18, top: 15, right: 18),
              child: Row(
                children: [
                  Text(
                    'About',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18, top: 15, right: 18),
              child: Row(
                children: const [
                  Text(
                    'This is upgradade S6 Sip runs up to 20 percent\n faster,'
                        'allowing apps to also launch 20\n percent faster,'
                        'while maintainng the\n same all-day 18-hour battery life.',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 18, top: 15, right: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Container(
                        height: 50,
                        width: 50,
                        color: Colors.grey[200],
                        child: Center(
                            child: Text(
                              '35',
                              style: TextStyle(fontSize: 20),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 20),
                      child: Container(
                        height: 50,
                        width: 50,
                        color: Colors.grey[200],
                        child: Center(
                            child: Text(
                              '36',
                              style: TextStyle(fontSize: 20),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 20),
                      child: Container(
                        height: 50,
                        width: 50,
                        color: Colors.deepOrange[100],
                        child: Center(
                            child: Text(
                              '37',
                              style:
                              TextStyle(fontSize: 20, color: Colors.deepOrange),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 20),
                      child: Container(
                        height: 50,
                        width: 50,
                        color: Colors.grey[200],
                        child: Center(
                            child: Text(
                              '38',
                              style: TextStyle(fontSize: 20),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 20),
                      child: Container(
                        height: 50,
                        width: 50,
                        color: Colors.grey[200],
                        child: Center(
                            child: Text(
                              '39',
                              style: TextStyle(fontSize: 20),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 20),
                      child: Container(
                        height: 50,
                        width: 50,
                        color: Colors.grey[200],
                        child: Center(
                            child: Text(
                              '40',
                              style: TextStyle(fontSize: 20),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18, top: 15, right: 18),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.deepOrange,
                    ),
                    height: 55,
                    width: width * 0.9,
                    child: Center(
                      child: Text(
                        'Add to cart',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

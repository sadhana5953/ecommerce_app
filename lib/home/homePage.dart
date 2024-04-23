import 'package:ecommerce_app/global/global%20variable.dart';
import 'package:ecommerce_app/home/List.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blueGrey,
                  image: DecorationImage(
                      image: AssetImage('assets/image/splashScreen/user.jpg')),
                ),
              ),
              Icon(
                Icons.location_on,
                color: Colors.green,
                size: 30,
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: 'Delivery to\n',
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 11,
                        fontWeight: FontWeight.bold)),
                TextSpan(
                    text: 'Danyore ,main chok',
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 13)),
              ])),
              Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Colors.blueGrey,
                size: 25,
              ),
              SizedBox(
                width: 150,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.of(context).pushNamed('/cartPage');
                },
                child: Icon(
                  Icons.shopping_cart,
                  color: Colors.green,
                  size: 27,
                ),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              height: screenSize.height * 0.06,
              width: screenSize.width * 0.9,
              color: Color(0xFFF1F1F1),
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.all(15),
              alignment: Alignment.center,
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    color: Colors.green,
                    size: 30,
                  ),
                  Text(
                    '  Search Food and Kitchen',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Categories',
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic),
                ),
                Text(
                  'See all',
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                      foodlist.length,
                      (index) => categories(
                          img: foodlist[index]['image'],
                          name: foodlist[index]['name'])),
                )),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                      bk.length, (index) => box(img: bk[index]['image'])),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Kitchen near your',
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 23,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic),
                ),
                Text(
                  'See all',
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            Expanded(
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Wrap(
                        children: List.generate(
                            food.length,
                            (index) => GestureDetector(
                              onTap: (){
                                selectedIndex=index;
                                Navigator.of(context).pushNamed('/detailPage');
                              },
                              child: FoodList(
                                  name: food[index]['name'],
                                  img: food[index]['image']),
                            )))))
          ],
        ),
      ),
    );
  }
}

Widget FoodList({required String name, required String img}) {
  return Container(
    height: 230,
    width: 170,
    margin: EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(color: Colors.grey, blurRadius: 10, spreadRadius: 2)
      ],
      color: Color(0xFFE8E8E8),
    ),
    alignment: Alignment.center,
    child: Column(
      children: [
        SizedBox(
          height: 120,
          width: 170,
          child: Image(
            image: AssetImage(img),
          ),
        ),
        RichText(
            textAlign: TextAlign.left,
            text: TextSpan(children: [
              TextSpan(
                  text: '$name\n',
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 25,
                      fontWeight: FontWeight.w500)),
              TextSpan(
                  text: '🛵 Free delivery',
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 18,
                      fontWeight: FontWeight.w500)),
            ])),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.watch_later,
              color: Colors.grey,
              size: 22,
            ),
            Text(
              '  | 10 - 15 min',
              style: TextStyle(color: Colors.grey, fontSize: 17),
            ),
          ],
        )
      ],
    ),
  );
}

Widget box({required String img}) {
  return Container(
    height: 150,
    width: 320,
    margin: EdgeInsets.only(top: 15, right: 20, bottom: 8),
    decoration: BoxDecoration(
      color: Colors.green,
      borderRadius: BorderRadius.circular(15),
      image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover),
    ),
  );
}

Widget categories({required String img, required String name}) {
  return Column(
    children: [
      Container(
        height: 100,
        width: 100,
        margin: EdgeInsets.only(top: 15, right: 25, bottom: 10, left: 10),
        decoration: BoxDecoration(
          color: Colors.green,
          shape: BoxShape.circle,
          image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover),
        ),
      ),
      Text(
        name,
        style: TextStyle(
            fontWeight: FontWeight.w500, color: Colors.black87, fontSize: 20),
      ),
    ],
  );
}

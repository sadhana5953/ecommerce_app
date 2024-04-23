import 'package:ecommerce_app/global/global%20variable.dart';
import 'package:ecommerce_app/home/List.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class detailScreen extends StatefulWidget {
  const detailScreen({super.key});

  @override
  State<detailScreen> createState() => _detailScreenState();
}

class _detailScreenState extends State<detailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.green,
            size: 25,
          ),
        ),
        title: Text(
          'Food',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Icon(
            Icons.menu,
            color: Colors.green,
            size: 30,
          )
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(
              height: 230,
              width: double.infinity,
              child: Image(
                image: AssetImage(food[selectedIndex]['image']),
              ),
            ),
            Container(
              height: 540,
              width: double.infinity,
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xFFE8E8E8),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      height: 40,
                      width: 150,
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.green,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                num++;
                                food[selectedIndex]['number']=num;
                              });
                            },
                              child: Icon(Icons.add)),
                          Text(
                            '$num',
                            style: TextStyle(fontSize: 25),
                          ),
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                num--;
                              });
                            },
                              child: Icon(Icons.remove))
                        ],
                      ),
                    ),
                  ),
                  Text(
                    food[selectedIndex]['name'],
                    style: TextStyle(
                        color: Color(0xFF010935),
                        fontWeight: FontWeight.bold,
                        fontSize: 27,
                        letterSpacing: 1),
                  ),
                  Text(
                    'Price: ${food[selectedIndex]['price']}/-',
                    style: TextStyle(
                        color: Color(0xFF010935),
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 30,
                        width: 100,
                        margin: EdgeInsets.symmetric(vertical: 25),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        alignment: Alignment.center,
                        child: Text('⭐  4.5'),
                      ),
                      Container(
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        alignment: Alignment.center,
                        child: Text('🔥  300 cal'),
                      ),
                      Container(
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        alignment: Alignment.center,
                        child: Text('15-20 min'),
                      ),
                    ],
                  ),
                  Text(
                    'Detail',
                    style: TextStyle(
                        color: Color(0xFF010935),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        letterSpacing: 1),
                  ),
                  Text(
                    'One of the most delicious food from  our chef,\nFresh and rich taste !',
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  Text('Cook time : 15 min',
                      style: TextStyle(color: Colors.blueGrey, fontSize: 15)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 45,
                        width: 150,
                        margin: EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                          color: Color(0xFF4CAE50),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Cals: 350 kcal',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        height: 45,
                        width: 150,
                        margin: EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                          color: Color(0xFF4CAE50),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Dish Weight: 400g',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      bool m1 = false;
                      for (int i = 0; i < cartList.length; i++) {
                        if (cartList[i]['name'] ==
                            food[selectedIndex]['name']) {
                          m1 = true;
                        }
                      }
                      if (m1 == true) {
                        error();
                      } else {
                        num=1;
                        cartList.add(food[selectedIndex]);
                      }
                    },
                    child: Container(
                      height: 70,
                      width: 350,
                      margin: EdgeInsets.only(top: 30),
                      decoration: BoxDecoration(
                        color: Color(0xFF26942A),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Add to cart',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
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

void error() {
  OverlayEntry overlayEntry;
  overlayEntry=OverlayEntry(builder: (context) => Align(child: Stack(children: [Container(
    height: 200,
    width: 350,
    color: Colors.lightGreen,
    alignment: Alignment.center,
    child: Text(
      'You already add this food in cart',
      style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
    ),
  ),],),),);
}

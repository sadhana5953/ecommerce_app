import 'package:ecommerce_app/global/global%20variable.dart';
import 'package:ecommerce_app/home/List.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class cartScreen extends StatefulWidget {
  const cartScreen({super.key});

  @override
  State<cartScreen> createState() => _cartScreenState();
}

class _cartScreenState extends State<cartScreen> {
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
            )),
        title: Text(
          'Cart',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Icon(
            Icons.menu,
            color: Colors.green,
            size: 25,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: List.generate(cartList.length, (index) =>container(img: cartList[index]['image'], name: cartList[index]['name'], price: cartList[index]['price'], num: cartList[index]['number']) ),
                  )
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              for(int i=0;i<cartList.length;i++)
                {
                  amount=(amount+cartList[i]['price']*cartList[i]['number']).toInt();
                }
              gst=(amount*18/100);
              total=gst+amount;
              Navigator.of(context).pushNamed('/checkout');
            },
            child: Container(
              height: 60,
              width: 355,
              color: Colors.green,
              margin: EdgeInsets.all(20),
              alignment: Alignment.center,
              child: Text('Checkout',style: TextStyle(color: Colors.white,fontSize: 23,fontWeight: FontWeight.bold),),
            ),
          ),
        ],
      ),
    );
  }
}

Widget container({required String img ,required String name,required int price,required int num}) {
  return Container(
    height: 150,
    width: 350,
    margin: EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Colors.grey.shade300,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.green.shade300,
            shape: BoxShape.circle,
            image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontSize: 22)),
            Text('Price: ${price}/-',
                style: TextStyle(color: Colors.black87, fontSize: 20)),
            Container(
              height: 40,
              width: 150,
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.green,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.add),
                  Text(
                    '$num',
                    style: TextStyle(fontSize: 25),
                  ),
                  Icon(Icons.remove)
                ],
              ),
            ),
          ],
        ),
        Icon(
          Icons.delete,
          color: Colors.green,
          size: 30,
        )
      ],
    ),
  );
}

import 'package:ecommerce_app/global/global%20variable.dart';
import 'package:ecommerce_app/home/List.dart';
import 'package:flutter/material.dart';
class checkout extends StatefulWidget {
  const checkout({super.key});

  @override
  State<checkout> createState() => _checkoutState();
}

class _checkoutState extends State<checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Checkout Screen'),
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                height: 150,
                width: 350,
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Amount: $amount',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Quantity: ${cartList.length}',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Gst: $gst',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Total: $total',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Message'),
                        content: Text('The payment was completed successfully.',style: TextStyle(fontSize: 20),),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Container(
                  height: 70,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Color(0xFF049D0A),
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.wallet,color: Colors.white,size: 30,),
                      Text('Pay',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
                      Text('$total',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),)
                    ],),
                ),
              ),
            ],
          ),
        ));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/helper/helper.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});
  
  @override
  State<CartView> createState() => _CartViewState();
}
int count = 0;
String sumLuy(){
  int sum = 0;
  for(var item in items){
    sum += int.parse(item["Price"].toString());
    print(item["Price"].toString());
  }
  return sum.toString();
}
class _CartViewState extends State<CartView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.arrow_back),
                  Text("My Cart", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  Icon(Icons.notifications),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Container(
                    margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey.shade300,
                        )
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey.shade300,
                          ),
                          child: Image.asset(
                            item["image"],
                            height: 90,
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 125,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(item["name"],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                                          Icon(Icons.close),
                                        ],
                                      ),
                                      Text("Apple",style: TextStyle(color: Colors.grey.shade600),),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text("\$${item["Price"].toString()}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                                      Row(
                                        children: [
                                          GestureDetector(
                                             onTap: () {
                                               setState(() {
                                                 count--;
                                               });
                                             },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                border: Border.all(
                                                  color: Colors.grey.shade600,
                                                ),
                                              ),
                                              child: Row(
                                                children: [
                                                  Icon(CupertinoIcons.minus,size: 20,),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            width: 30,
                                            child: Text(
                                                "$count",
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                count++;
                                              });
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                border: Border.all(
                                                  color: Colors.grey.shade600,
                                                ),
                                              ),
                                              child: Row(
                                                children: [
                                                  Icon(CupertinoIcons.add,size: 20,),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      _buildText(title: "Sub-total", value: "\$${sumLuy()}"),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: _buildText(title: "VAT (%)", value: "\$0.00"),
                      ),
                      _buildText(title: "Shopping fee", value: "\$80"),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "total",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 16
                            ),
                          ),
                          Text(
                            "\$${int.parse(sumLuy()) + 80}",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 16,
                                fontWeight: FontWeight.w600
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50,bottom: 15),
                        child: IconButton(
                          alignment: Alignment.center,
                          style: IconButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              )
                          ),
                          padding: EdgeInsets.all(15),
                          onPressed: () {},
                          icon: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Go To Checkout   ",style: TextStyle(color: Colors.white),),
                              Icon(Icons.arrow_forward,color: Colors.white,)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Row _buildText({required String title, required String value}){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: TextStyle(color: Colors.grey,fontSize: 16),),
        Text(value.toString()),
      ],
  );
}
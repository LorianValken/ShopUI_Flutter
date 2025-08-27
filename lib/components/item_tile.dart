import 'package:flutter/material.dart';
import 'package:shop_app/helper/helper.dart';

class ItemTile extends StatefulWidget {
  final  Map<String, dynamic> item;
  final Function refresh;
  const ItemTile({super.key,required this.item, required this.refresh});


  @override
  State<ItemTile> createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Stack(
    alignment: Alignment.topRight,
    children: [
    Container(
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(
    color: Colors.grey.shade300,
    borderRadius: BorderRadius.circular(15),
    ),
    child: Image.asset(widget.item["image"].toString(),)),
    Padding(
    padding: const EdgeInsets.all(8.0),
    child: GestureDetector(
    onTap: () {
    setState(() {
    widget.item["isFav"] = !widget.item["isFav"];
    if(widget.item["isFav"] == true){
      favoritesLst.add(widget.item);
    }else{
      favoritesLst.remove(widget.item);
    }
    widget.refresh();
    // if(isFav == false){
    //   isFav = true;
    // }else{
    //   isFav = false;
    // }
    });
    },
    child: Container(
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
    BoxShadow(
    color: Colors.grey,
    spreadRadius: 1,
    blurRadius: 10,
    offset: Offset(4, 5),
    ),
    ],
    ),
    child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Icon(
    widget.item["isFav"] == true
    ? Icons.favorite
        : Icons.favorite_border,
    color: widget.item["isFav"] == true
    ? Colors.pink
        : Colors.black,
    size: 20,
    ),
    ),
    ),
    ),
    ),
    ],
    ),
    Padding(padding: EdgeInsets.symmetric(vertical: 3)),
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Text(widget.item["name"].toString(),
    style: TextStyle(
    color: Colors.grey.shade600,
    ),
    ),
    Row(
    children: [
    Icon(Icons.star,color: Colors.amber,size: 16),
    Text(widget.item["rate"].toString(),
    style: TextStyle(
    fontWeight: FontWeight.w600,
    ),
    ),
    ],
    )
    ],
    ),
    Text("\$${widget.item["Price"].toString()}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
    ],
    );
  }
}

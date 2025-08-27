import 'package:flutter/material.dart';
import 'package:shop_app/components/item_tile.dart';
import 'package:shop_app/helper/helper.dart';

class SaveView extends StatefulWidget {
  const SaveView({super.key});

  @override
  State<SaveView> createState() => _SaveViewState();
}

class _SaveViewState extends State<SaveView> {
  void reFresh(){
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.arrow_back),
                    Text("Saved Items",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                    Icon(Icons.notifications)
                  ],
                ),
              ),
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.75,
                ),
                itemCount: favoritesLst.length,
                itemBuilder: (context, index) {
                  final favItem = favoritesLst[index];
                  return ItemTile(
                      item: favItem,
                      refresh: reFresh,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

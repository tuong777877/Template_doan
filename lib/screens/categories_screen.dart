import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import '../util/categories.dart';
import '../util/foods.dart';
import '../widgets/badge.dart';
import '../widgets/grid_product.dart';
import '../widgets/home_category.dart';
import 'notifications.dart';


class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {

  String catie = "Drinks";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_backspace,
          ),
          onPressed: ()=>Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          "Categories",
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Badge(
              child:const Icon(Icons.notifications,
              size: 22.0,)
            ),
            onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context){
                    return const Notifications();
                  },
                ),
              );
            },
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0,0,10.0,0),
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 10.0),
            SizedBox(
              height: 65.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: categories == null?0:categories.length,
                itemBuilder: (BuildContext context, int index) {
                  Map cat = categories[index];
                  return HomeCategory(
                    icon: cat['icon'],
                    title: cat['name'],
                    items: cat['items'].toString(),
                    isHome: false,
                    tap: (){
                      setState((){catie = "${cat['name']}";});
                    },
                  );
                },
              ),
            ),

            const SizedBox(height: 20.0),

            Text(
              catie,
              style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w800,
              ),
            ),
            const Divider(),
            const SizedBox(height: 10.0),

            GridView.builder(
              shrinkWrap: true,
              primary: false,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 1.25),
              ),
              itemCount: foods == null ? 0 :foods.length,
              itemBuilder: (BuildContext context, int index) {
                Map food = foods[index];
                return GridProduct(
                  img: food['img'],
                  isFav: false,
                  name: food['name'],
                  rating: 5.0,
                  raters: 23,
                );
              },
            ),

          ],
        ),
      ),
    );
  }
}

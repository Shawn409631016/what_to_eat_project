import 'package:flutter/material.dart';
import 'Taiwan_food_page.dart';
import 'Japan_food_page.dart';
import 'Korea_food_page.dart';
import 'Tai_food_page.dart';
import 'American_food_page.dart';

class StatefullFoodTypePage extends StatefulWidget {
  const StatefullFoodTypePage({super.key});

  @override
  State<StatefullFoodTypePage> createState() {
    return FoodTypePage();
  }
}

class FoodTypePage extends State<StatefullFoodTypePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('選取類別'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Container(
        color: const Color.fromARGB(255, 239, 239, 239),
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                horizontalTitleGap: 25,
                contentPadding: const EdgeInsets.all(15),
                leading: Image.asset('images/1.png'),
                title: const Text(
                  '台式料理',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const StatefulTaiwanFoodPage()));
                },
              ),
            ),
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                horizontalTitleGap: 25,
                contentPadding: const EdgeInsets.all(15),
                leading: Image.asset('images/1.png'),
                title: const Text(
                  '日式料理',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const StatefulJapanFoodPage()));
                },
              ),
            ),
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                horizontalTitleGap: 25,
                contentPadding: const EdgeInsets.all(15),
                leading: Image.asset('images/1.png'),
                title: const Text(
                  '韓式料理',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const StatefulKoreaFoodPage()));
                },
              ),
            ),
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                horizontalTitleGap: 25,
                contentPadding: const EdgeInsets.all(15),
                leading: Image.asset('images/1.png'),
                title: const Text(
                  '泰式料理',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const StatefulTaiFoodPage()));
                },
              ),
            ),
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                horizontalTitleGap: 25,
                contentPadding: const EdgeInsets.all(15),
                leading: Image.asset('images/1.png'),
                title: const Text(
                  '美式料理',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const StatefulAmericanFoodPage()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

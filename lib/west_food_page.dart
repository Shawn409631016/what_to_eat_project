import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class StatefulWestFoodPage extends StatefulWidget {
  const StatefulWestFoodPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return WestFoodPage();
  }
}

class WestFoodPage extends State<StatefulWestFoodPage> {
  List<String> foodNames = [];
  List<String> foodCals = [];
  List<String> foodCarbs = [];
  List<String> foodProteins = [];
  List<String> foodUris = [];
  List<String> foodImgSrcs = [];
  String currentName = "墨西哥捲餅";
  String currentCal = "206大卡";
  String currentCarb = "33公克";
  String currentProtein = "6公克";
  String currentUri =
      "https://ifoodie.tw/explore/%E5%8F%B0%E5%8C%97%E5%B8%82/list/%E5%A2%A8%E8%A5%BF%E5%93%A5%E6%8D%B2%E9%A4%85%E5%8F%B0%E5%8C%97";
  Image currentImg = Image.network(
      'https://images.unsplash.com/photo-1568106690101-fd6822e876f6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1333&q=80');

  Future<void> _launchUrl(uri) async {
    Uri uriToLaunch = Uri.parse(uri);

    if (!await launchUrl(uriToLaunch)) {
      throw 'Could not launch $uri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('西式料理'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shadowColor: const Color.fromARGB(255, 248, 248, 248),
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: StreamBuilder(
          stream:
              FirebaseFirestore.instance.collection('West Food').snapshots(),
          builder: (_, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            int count = 0;
            for (var doc in snapshot.data!.docs) {
              foodNames.add(doc["name"]);
              foodCals.add(doc["calories"]);
              foodCarbs.add(doc["碳水化合物"]);
              foodProteins.add(doc["蛋白質"]);
              foodUris.add(doc["uri"]);
              foodImgSrcs.add(doc["img"]);
              count++;
            }

            return Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 350,
                          child: Card(
                            child: currentImg,
                          ),
                        ),
                        SizedBox(
                          width: 500,
                          height: 250,
                          child: Card(
                            color: const Color.fromARGB(255, 250, 212, 151),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(currentName,
                                    style: const TextStyle(fontSize: 28)),
                                Text('熱量: $currentCal',
                                    style: const TextStyle(fontSize: 20)),
                                Text('蛋白質: $currentCarb',
                                    style: const TextStyle(fontSize: 20)),
                                Text('碳水化合物: $currentProtein',
                                    style: const TextStyle(fontSize: 20)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    OutlinedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(150, 50),
                        maximumSize: const Size(150, 50),
                      ),
                      child: const Text(
                        '再抽一次',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        setState(() {
                          int index = Random().nextInt(count);
                          currentImg = Image.network(foodImgSrcs[index]);
                          currentName = foodNames[index];
                          currentCal = foodCals[index];
                          currentCarb = foodCarbs[index];
                          currentProtein = foodProteins[index];
                          currentUri = foodUris[index];
                        });
                      },
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(150, 50),
                        maximumSize: const Size(150, 50),
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text(
                        '更多資訊',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        _launchUrl(currentUri);
                      },
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

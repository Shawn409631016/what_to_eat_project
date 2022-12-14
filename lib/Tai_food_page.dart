import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class StatefulTaiFoodPage extends StatefulWidget {
  const StatefulTaiFoodPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return TaiFoodPage();
  }
}

class TaiFoodPage extends State<StatefulTaiFoodPage> {
  List<String> foodNames = [];
  List<String> foodCals = [];
  List<String> foodCarbs = [];
  List<String> foodProteins = [];
  List<String> foodUris = [];
  List<String> foodImgSrcs = [];
  String currentName = "泰式炒河粉";
  String currentCal = "800大卡";
  String currentCarb = "70公克";
  String currentProtein = "40公克";
  String currentUri =
      "https://ifoodie.tw/explore/%E5%8F%B0%E5%8C%97%E5%B8%82/list/%E6%B3%B0%E5%BC%8F%E7%82%92%E6%B2%B3%E7%B2%89";
  Image currentImg = Image.network(
      'https://angelala.tw/webp/wp-content/uploads/2022/03/don1.jpg.webp');

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
        title: const Text('泰式料理'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shadowColor: const Color.fromARGB(255, 248, 248, 248),
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Tai Food').snapshots(),
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
              foodCarbs.add(doc["carbohydrates"]);
              foodProteins.add(doc["protein"]);
              foodUris.add(doc["uri"]);
              foodImgSrcs.add(doc["img"]);
              count++;
            }

            return SingleChildScrollView(
              child: Column(
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
                            height: 300,
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
              ),
            );
          },
        ),
      ),
    );
  }
}

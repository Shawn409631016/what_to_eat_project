import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class StatefulTaiwanFoodPage extends StatefulWidget {
  const StatefulTaiwanFoodPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return TaiwanFoodPage();
  }
}

class TaiwanFoodPage extends State<StatefulTaiwanFoodPage> {
  List<String> foodNames = [];
  List<String> foodCals = [];
  List<String> foodUris = [];
  List<String> foodImgSrcs = [];
  String currentName = "牛肉麵";
  String currentCal = "900大卡";
  String currentUri = "https://www.storm.mg/lifestyle/3871508?page=1";
  Image currentImg = Image.network(
      'https://rs.joo.com.tw/website/uploads_product/website_794/P0079400074152_3_287162.jpg?_5966');

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
        title: const Text('台式料理'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shadowColor: const Color.fromARGB(255, 248, 248, 248),
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: StreamBuilder(
          stream:
              FirebaseFirestore.instance.collection('Taiwan Food').snapshots(),
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
                                // Text('蛋白質: ${foodDocument["蛋白質"]}',
                                //     style: const TextStyle(fontSize: 20)),
                                // Text('碳水化合物: ${foodDocument["碳水化合物"]}',
                                //     style: const TextStyle(fontSize: 20)),
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

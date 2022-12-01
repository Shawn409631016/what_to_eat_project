import 'dart:math';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class StatefulKoreaFoodPage extends StatefulWidget {
  const StatefulKoreaFoodPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return KoreaFoodPage();
  }
}

class KoreaFoodPage extends State<StatefulKoreaFoodPage> {
  List<Image> images = [
    Image.asset('images/1.png'),
    Image.asset('images/2.png'),
    Image.asset('images/3.png'),
  ];
  List<String> names = [
    '吐司:',
    '牛肉麵:',
    '炒泡麵:',
  ];
  List<String> calories = [
    '熱量: 600大卡',
    '熱量: 300大卡',
    '熱量: 400大卡',
  ];
  List<String> uris = [
    'https://www.ubereats.com/tw/store/%E5%95%83%E5%90%90%E5%8F%B8/5f5xXitMWBKa65Ai1MjMvg?utm_campaign=place-action-link&utm_medium=organic&utm_source=google',
    'https://www.ubereats.com/tw/store/%E4%BA%AC%E8%8F%AF%E7%89%9B%E8%82%89%E9%BA%B5%E9%A4%A8/vsgpUOh3RxCIB9KOItQxeg?utm_campaign=place-action-link&utm_medium=organic&utm_source=google',
    'https://www.ubereats.com/tw/store/juicy%E7%82%92%E6%B3%A1%E9%BA%B5/YfO3fRTMWYOzxcsabl4X9Q?utm_campaign=place-action-link&utm_medium=organic&utm_source=google',
  ];

  Image currentImg = Image.asset('images/1.png');
  String currentDis = '吐司';
  String currentCalorie = '熱量: 600大卡';
  String currentUri =
      'https://www.ubereats.com/tw/store/%E5%95%83%E5%90%90%E5%8F%B8/5f5xXitMWBKa65Ai1MjMvg?utm_campaign=place-action-link&utm_medium=organic&utm_source=google';

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
        title: const Text('韓式料理'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shadowColor: const Color.fromARGB(255, 248, 248, 248),
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(10),
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
                    currentImg,
                    Text(currentDis, style: const TextStyle(fontSize: 25)),
                    Text(currentCalorie, style: const TextStyle(fontSize: 25)),
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
                      int index = Random().nextInt(images.length);
                      currentImg = images[index];
                      currentDis = names[index];
                      currentCalorie = calories[index];
                      currentUri = uris[index];
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
                    '外送資訊',
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
      ),
    );
  }
}

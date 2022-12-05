import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
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
    //朝鮮冷麵
    Image.network(
        'http://foodyap.co.kr/shopimages/goldplate1/072004000001.jpg?1655101693'),
    //泡菜
    Image.network(
        'https://www.gqfood.com.tw/archive/image/product1/images/kimchi_04.jpg'),
    //炸醬麵
    Image.network(
        'https://image.edaily.co.kr/images/photo/files/NP/S/2022/08/PS22083100011.jpg'),
    //蔘雞湯
    Image.network(
        'http://www.foodnews.news/data/photos/20220727/art_16569022358566_304954.jpg'),
    //辣炒年糕
    Image.network(
        'https://cdn.kihoilbo.co.kr/news/photo/202008/880134_302005_3430.png'),
    //韓式拌飯
    Image.network(
        'https://phoebedaily.com/wp-content/uploads/2019/04/DSC00302.jpg'),
    //韓式火鍋
    Image.network(
        'https://thingool123.godohosting.com/gd5replace/thingotr4652/data/editor/goods/210617/285f14f889d5eb44a9e691f9f0ac985f_174805.jpg'),
    //韓式炸雞
    Image.network(
        'https://d1ralsognjng37.cloudfront.net/9f602599-9365-4e76-884a-30819bd65859.jpeg'),
    //韓式燒肉
    Image.network(
        'https://cc.tvbs.com.tw/img/program/upload/2020/04/16/20200416154834-6f86836d.jpg'),
    //飯捲
    Image.network(
        'https://www.masterpon.com/wp-content/uploads/honggimbap11.jpg'),
  ];

  List<String> docs = [
    '朝鮮冷麵',
    '泡菜',
    '炸醬麵',
    '蔘雞湯',
    '辣炒年糕',
    '韓式拌飯',
    '韓式火鍋',
    '韓式炸雞',
    '韓式燒肉',
    '飯捲',
  ];

  String currentDoc = '朝鮮冷麵';
  Image currentImg = Image.network(
      'http://foodyap.co.kr/shopimages/goldplate1/072004000001.jpg?1655101693');

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
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('Korea Food')
              .doc(currentDoc)
              .snapshots(),
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              var foodDocument = snapshot.data;
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
                          currentImg,
                          Text(foodDocument!["name"],
                              style: const TextStyle(fontSize: 25)),
                          Text(foodDocument["calories"],
                              style: const TextStyle(fontSize: 25)),
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
                            currentDoc = docs[index];
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
                          _launchUrl(foodDocument["uri"]);
                        },
                      ),
                    ],
                  ),
                ],
              );
            }
            if (snapshot.hasError) {
              return Text('Error = ${snapshot.error}');
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

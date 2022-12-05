import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class StatefulJapanFoodPage extends StatefulWidget {
  const StatefulJapanFoodPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return JapanFoodPage();
  }
}

class JapanFoodPage extends State<StatefulJapanFoodPage> {
  List<Image> images = [
    //和風醬烤雞腿定食"
    Image.network(
        'https://www.tonkatsu.com.tw/Files/Menu/13/%E5%92%8C%E9%A2%A8%E9%86%AC%E7%83%A4%E9%9B%9E%E8%85%BF%E5%AE%9A%E9%A3%9F-%E5%AE%9A%E9%A3%9F%E5%9C%96%E7%89%87--600-%C3%97-443.jpg'),
    //壽司
    Image.network(
        'https://umeda-sc.jp/wp/wp-content/uploads/2020/08/sushi_xex_2.jpg'),
    //天婦羅丼飯
    Image.network(
        'https://www.tenkichiya.com.tw/upload_image/about/about_213.jpg'),
    //拉麵
    Image.network(
        'https://photo.518.com.tw/selfmedia/articles/1822/166184379235038.jpeg'),
    //日式燒肉
    Image.network(
        'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/course-kodawari-img-pc-min-1-1603687106.png?crop=0.563xw:0.537xh;0.437xw,0&resize=980:*'),
    //炸豬排丼飯
    Image.network(
        'https://www.yayoi.com.tw/upload/images/Menu/%E5%85%A7%E7%94%A8%E7%82%B8%E8%B1%AC%E9%A3%AF_210626.jpg'),
    //烏龍麵
    Image.network('https://www.yayoi.com.tw/upload/images/Menu/200929_01.jpg'),
    //生魚片丼飯
    Image.network(
        'https://static.bg3.co/imgs/202106/4238ef9089574503a61f09b276dcaee3.jpg'),
    //鰻魚蓋飯
    Image.network(
        'https://www.yayoi.com.tw/upload/images/Menu/%E9%B0%BB%E4%B8%BC%E4%B8%AD_210625.jpg'),
    //鹽烤鯖魚定食
    Image.network(
        'https://www.tonkatsu.com.tw/Files/Menu/14/%E9%B9%BD%E7%83%A4%E9%AF%96%E9%AD%9A%E5%AE%9A%E9%A3%9F-%E5%AE%9A%E9%A3%9F%E5%9C%96%E7%89%87--600-%C3%97-443.jpg'),
  ];

  List<String> docs = [
    '和風醬烤雞腿定食',
    '壽司',
    '天婦羅丼飯',
    '拉麵',
    '日式燒肉',
    '炸豬排丼飯',
    '烏龍麵',
    '生魚片丼飯',
    '鰻魚蓋飯',
    '鹽烤鯖魚定食',
  ];

  String currentDoc = '日式燒肉';
  Image currentImg = Image.network(
      'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/course-kodawari-img-pc-min-1-1603687106.png?crop=0.563xw:0.537xh;0.437xw,0&resize=980:*');

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
        title: const Text('日式料理'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shadowColor: const Color.fromARGB(255, 248, 248, 248),
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('All Food')
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

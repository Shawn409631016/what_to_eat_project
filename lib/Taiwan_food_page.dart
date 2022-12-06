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
  List<Image> images = [
    //刈包
    Image.network(
        'https://www.wecook123.com/wp-content/uploads/2017/05/%E7%BE%8E%E5%91%B3%E7%B4%A0%E5%89%B2%E5%8C%85_qIENndHSIq.jpg'),
    //大腸包小腸
    Image.network(
        'https://taiwan.sharelife.tw/tw-feat-store-img/44721/c840130617285911.jpg'),
    //大腸麵線
    Image.network(
        'https://tokyo-kitchen.icook.network/uploads/recipe/cover/411787/9eafdeb926cf6d63.jpg'),
    //小籠包
    Image.network(
        'https://www.gomaji.com/blog/wp-content/uploads/2021/01/109694519_132704988503810_8168813254334701819_n-1068x801.jpg'),
    //滷肉飯
    Image.network(
        'https://lordcat.tw/wp-content/uploads/2021/09/1631538408-378fce845ce05de4c29be3e870b50e13.jpg'),
    //牛肉麵
    Image.network(
        'https://rs.joo.com.tw/website/uploads_product/website_794/P0079400074152_3_287162.jpg?_5966'),
    //珍珠奶茶
    Image.network(
        'https://server.newslab.pts.org.tw/uploads/News/94/5d5b7874e5272.jpg'),
    //臭豆腐
    Image.network(
        'https://1.bp.blogspot.com/-yNzqY9ymHPI/Xl0M7c66e_I/AAAAAAAAElA/A5D2mwWmd8s4RxK6_8EFsDlMkePjP4FEgCNcBGAsYHQ/s1600/1507044454-3089444673_l.jpg'),
    //蚵仔煎
    Image.network(
        'https://i0.wp.com/bobotravel.tw/wp-content/uploads/2022/10/JianJiaOysterPancake9.jpg?w=1280&ssl=1'),
    //豬血糕
    Image.network(
        'https://yukiblog.tw/wp-content/uploads/2020/04/20200412222626_64.jpg'),
  ];

  List<String> docs = [
    '刈包',
    '大腸包小腸',
    '大腸麵線',
    '小籠包',
    '滷肉飯',
    '牛肉麵',
    '珍珠奶茶',
    '臭豆腐',
    '蚵仔煎',
    '豬血糕',
  ];

  String currentDoc = '牛肉麵';
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
                          SizedBox(
                            height: 350,
                            child: Card(
                              child: currentImg,
                            ),
                          ),
                          Text(foodDocument!["name"],
                              style: const TextStyle(fontSize: 28)),
                          Text('熱量: ${foodDocument["calories"]}',
                              style: const TextStyle(fontSize: 20)),
                          Text('蛋白質: ${foodDocument["蛋白質"]}',
                              style: const TextStyle(fontSize: 20)),
                          Text('碳水化合物: ${foodDocument["碳水化合物"]}',
                              style: const TextStyle(fontSize: 20)),
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

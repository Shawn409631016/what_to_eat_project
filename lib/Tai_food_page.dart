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
  List<Image> images = [
    //打拋豬
    Image.network(
        'https://yijiefood.com.tw/wp-content/uploads/2020/06/%E6%B3%B0%E5%BC%8F%E6%89%93%E6%8B%8B%E8%B1%AC.jpg'),
    //月亮蝦餅
    Image.network(
        'https://www.majitreats.com/uploads/userfiles/images/recipe-001.jpg'),
    //椒麻雞
    Image.network(
        'https://images.chinatimes.com/newsphoto/2020-05-08/1024/20200508005482.jpg'),
    //椰子燉雞湯
    Image.network('https://onlinekaki.com/wp-content/uploads/2020/08/1.7.jpg'),
    //泰式炒河粉
    Image.network(
        'https://angelala.tw/webp/wp-content/uploads/2022/03/don1.jpg.webp'),
    //泰式炒飯
    Image.network(
        'https://www.unileverfoodsolutions.tw/dam/global-ufs/mcos/na/taiwan/calcmenu/recipes/TW-recipes/general/%E6%B3%B0%E5%BC%8F%E9%85%B8%E8%BE%A3%E6%B5%B7%E9%AE%AE%E7%82%92%E9%A3%AF/main-header.jpg'),
    //紅咖哩
    Image.network(
        'https://img.ltn.com.tw/Upload/food/page/2016/09/11/160911-3372-7-dQasC.jpg'),
    //綠咖哩雞
    Image.network(
        'https://angelala.tw/webp/wp-content/uploads/2020/09/th17.jpg.webp'),
    //腰果炒雞肉
    Image.network(
        'https://tokyo-kitchen.icook.network/uploads/step/cover/1122398/884af4c88d137ead.jpg'),
    //辛辣牛肉沙拉
    Image.network(
        'https://cp1.douguo.com/upload/caiku/6/0/b/690x390_6047acde97f9d525bf4213fe7de70bab.jpg'),
    //辣味青木瓜沙拉
    Image.network(
        'https://i.epochtimes.com/assets/uploads/2019/11/Fotolia_43883026_Subscription_L-600x402.jpg'),
    //辣蝦湯
    Image.network(
        'https://www.unileverfoodsolutions.com.sg/dam/global-ufs/mcos/SEA/calcmenu/recipes/SG-recipes/soups/%E6%B3%B0%E5%BC%8F%E5%86%AC%E8%8D%AB%E6%B1%A4/main-header.jpg'),
  ];

  List<String> docs = [
    '打拋豬',
    '月亮蝦餅',
    '椒麻雞',
    '椰子燉雞湯',
    '泰式炒河粉',
    '泰式炒飯',
    '紅咖哩',
    '綠咖哩雞',
    '腰果炒雞肉',
    '辛辣牛肉沙拉',
    '辣味青木瓜沙拉',
    '辣蝦湯',
  ];

  String currentDoc = '泰式炒河粉';
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
                          SizedBox(
                            width: 500,
                            height: 250,
                            child: Card(
                              color: Color.fromARGB(255, 250, 212, 151),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
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

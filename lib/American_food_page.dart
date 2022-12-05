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
  List<Image> images = [
    //奶油夾心海綿蛋糕
    Image.network(
        'https://upload.wikimedia.org/wikipedia/commons/thumb/6/67/Hostess-Twinkies.jpg/375px-Hostess-Twinkies.jpg'),
    //玉米餡餅
    Image.network(
        'https://pic.pimg.tw/inraydesign/1610291083-2233839670-g_n.jpg'),
    //玉米熱狗
    Image.network('https://img95.699pic.com/xsj/07/0c/fv.jpg!/fh/300'),
    //巨無霸
    Image.network(
        'https://www.gannett-cdn.com/authoring/2016/11/07/NFTU/ghows-LK-47249bbe-b323-473a-89f2-f3f603e35ce1-4fa35a93.jpeg'),
    //雞炸牛排
    Image.network(
        'https://tblg.k-img.com/restaurant/images/Rvw/143183/640x640_rect_143183921.jpg'),
    //斯帕姆午餐肉
    Image.network(
        'https://img.ien.com/files/base/indm/ien/image/2019/11/iStock_483839884.5dd6a594aa163.png?auto=format%2Ccompress&dpr=2&fit=max&q=70&w=700'),
    //特大啃
    Image.network(
        'https://www.outsideonline.com/wp-content/uploads/2022/11/Turducken-h.jpg'),
    //薯條
    Image.network(
        'https://cw-image-resizer.cwg.tw/resize/uri/https%3A%2F%2Fstorage.googleapis.com%2Fwww-cw-com-tw%2Farticle%2F202209%2Farticle-633153d69e7e1.jpg/?w=1260&format=webp'),
    //墨西哥捲餅
    Image.network(
        'https://images.unsplash.com/photo-1568106690101-fd6822e876f6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1333&q=80'),
  ];

  List<String> docs = [
    '奶油夾心海綿蛋糕',
    '玉米餡餅',
    '玉米熱狗',
    '巨無霸',
    '雞炸牛排',
    '斯帕姆午餐肉',
    '特大啃',
    '薯條',
    '墨西哥捲餅',
  ];

  String currentDoc = '墨西哥捲餅';
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

import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class StatefulAllFoodPage extends StatefulWidget {
  const StatefulAllFoodPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return AllFoodPage();
  }
}

class AllFoodPage extends State<StatefulAllFoodPage> {
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
    //泰式
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
    //台式
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
    //韓式
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
    //日式
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
        title: const Text('所有料理'),
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

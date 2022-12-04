import 'package:flutter/material.dart';
import 'Taiwan_food_page.dart';
import 'Japan_food_page.dart';
import 'Korea_food_page.dart';
import 'Tai_food_page.dart';
import 'American_food_page.dart';

class StatefullFoodTypePage extends StatefulWidget {
  const StatefullFoodTypePage({super.key});

  @override
  State<StatefullFoodTypePage> createState() {
    return FoodTypePage();
  }
}

class FoodTypePage extends State<StatefullFoodTypePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            backgroundColor: const Color.fromARGB(189, 41, 225, 48),
            expandedHeight: 240,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                '選擇類別',
              ),
              background: Image.network(
                'https://images.deliveryhero.io/image/fd-tw/LH/ka7a-hero.jpg',
                fit: BoxFit.cover,
              ),
            ),
            floating: true,
            snap: true,
            pinned: true,
          )
        ],
        body: Container(
          color: const Color.fromARGB(255, 239, 239, 239),
          padding: const EdgeInsets.all(1),
          margin: const EdgeInsets.symmetric(horizontal: 1),
          child: ListView(
            children: <Widget>[
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  horizontalTitleGap: 25,
                  contentPadding: const EdgeInsets.all(15),
                  leading: Image.network(
                      'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F19%2F2017%2F08%2F17%2FGettyImages-545286388-2000.jpg'),
                  title: const Text(
                    '台式料理',
                    style: TextStyle(fontSize: 20),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const StatefulTaiwanFoodPage()));
                  },
                ),
              ),
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  horizontalTitleGap: 25,
                  contentPadding: const EdgeInsets.all(15),
                  leading: Image.network(
                      'https://i.pinimg.com/564x/1b/da/39/1bda3923e4a84406a001fbec41e54703.jpg'),
                  title: const Text(
                    '日式料理',
                    style: TextStyle(fontSize: 20),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const StatefulJapanFoodPage()));
                  },
                ),
              ),
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  horizontalTitleGap: 25,
                  contentPadding: const EdgeInsets.all(15),
                  leading: Image.network(
                      'https://i.pinimg.com/564x/64/b1/26/64b126a96d968305ce5cff1b2329bcaa.jpg'),
                  title: const Text(
                    '韓式料理',
                    style: TextStyle(fontSize: 20),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const StatefulKoreaFoodPage()));
                  },
                ),
              ),
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  horizontalTitleGap: 25,
                  contentPadding: const EdgeInsets.all(15),
                  leading: Image.network(
                      'https://www.majitreats.com/uploads/userfiles/images/recipe-001.jpg'),
                  title: const Text(
                    '泰式料理',
                    style: TextStyle(fontSize: 20),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const StatefulTaiFoodPage()));
                  },
                ),
              ),
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  horizontalTitleGap: 25,
                  contentPadding: const EdgeInsets.all(15),
                  leading: Image.network(
                      'https://images.chinatimes.com/newsphoto/2020-07-08/1024/20200708001669.jpg'),
                  title: const Text(
                    '美式料理',
                    style: TextStyle(fontSize: 20),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const StatefulAmericanFoodPage()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

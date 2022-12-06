import 'package:flutter/material.dart';
import 'Taiwan_food_page.dart';
import 'Japan_food_page.dart';
import 'Korea_food_page.dart';
import 'Tai_food_page.dart';
import 'west_food_page.dart';
import 'All_food_page.dart';

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
            // backgroundColor: const Color.fromARGB(189, 41, 225, 48),
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            expandedHeight: 240,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                '選擇類別',
              ),
              background: Image.asset(
                'images/foodTypePageImg.jpg',
                fit: BoxFit.cover,
              ),
            ),
            floating: true,
            snap: true,
            pinned: false,
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
                    'https://images.unsplash.com/photo-1608835291093-394b0c943a75?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1172&q=80',
                    width: 80,
                  ),
                  title: const Text(
                    '所有類別',
                    style: TextStyle(fontSize: 20),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const StatefulAllFoodPage()));
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
                    'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F19%2F2017%2F08%2F17%2FGettyImages-545286388-2000.jpg',
                    width: 80,
                  ),
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
                    'https://i.pinimg.com/564x/1b/da/39/1bda3923e4a84406a001fbec41e54703.jpg',
                    width: 80,
                  ),
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
                    'https://ct.yimg.com/xd/api/res/1.2/7vhSAGDh8vYD_OAeeSfuag--/YXBwaWQ9eXR3YXVjdGlvbnNlcnZpY2U7aD00NTI7cT04NTtyb3RhdGU9YXV0bzt3PTcwMA--/https://s.yimg.com/ob/image/54511f03-7820-4e76-8735-6ece739fb30b.jpg',
                    width: 80,
                  ),
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
                      'https://www.majitreats.com/uploads/userfiles/images/recipe-001.jpg',
                      width: 80),
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
                      'https://images.chinatimes.com/newsphoto/2020-07-08/1024/20200708001669.jpg',
                      width: 80),
                  title: const Text(
                    '西式料理',
                    style: TextStyle(fontSize: 20),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const StatefulWestFoodPage()));
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

import 'package:flutter/material.dart';
import 'package:food/common/colors.dart';
import 'package:food/common/textStyle.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:food/screens/foodDetail.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  void navigateToDetail() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const FoodDetailPage(),
      ),
    );
  }

  Widget headerBar() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 10,
          ),
          const Text(
            "Favorites",
            style: FoodAppTextStyles.headerTextStyle,
          ),
          Image.asset(
            'assets/images/notif.png',
            fit: BoxFit.fitHeight,
          ),
        ],
      ),
    );
  }

  Widget searchBox() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      decoration: BoxDecoration(
        color: FoodAppThemeColors.White,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: FoodAppThemeColors.BorderColor, width: 0.75),
      ),
      child: TextField(
        autofocus: false,
        textAlign: TextAlign.left,
        cursorColor: FoodAppThemeColors.Blue,
        style: FoodAppTextStyles.labelTextStyle,
        maxLines: 1,
        decoration: InputDecoration(
            filled: true,
            fillColor: FoodAppThemeColors.White,
            labelStyle: FoodAppTextStyles.labelTextStyle,
            prefixIcon: const Icon(
              Icons.search,
              color: FoodAppThemeColors.UniGray,
              size: 25,
            ),
            suffixIcon: SizedBox(
              width: 50,
              height: 25,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 12, bottom: 12),
                    decoration: const BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: FoodAppThemeColors.BorderColor,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Image.asset(
                      'assets/images/filter.png',
                      fit: BoxFit.fitHeight,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            contentPadding: const EdgeInsets.fromLTRB(20, 5, 30, 5),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(50),
            ),
            hintText: "Search recipe"),
      ),
    );
  }

  Widget recipeCard(image, title) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.only(bottom: 25),
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          navigateToDetail();
        },
        child: SizedBox(
          width: MediaQuery.of(context).size.width - 40,
          height: 230,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 40,
                  child: Image.asset(
                    image,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 40,
                  height: 75,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: FoodAppThemeColors.White,
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title, style: FoodAppTextStyles.titleTextStyle),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(0.95, 0.15),
                child: SizedBox(
                  width: 80,
                  height: 27,
                  child: Container(
                    decoration: BoxDecoration(
                      color: FoodAppThemeColors.White,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(
                          Octicons.clock,
                          color: FoodAppThemeColors.UniGray,
                          size: 18,
                        ),
                        Text("46 min", style: FoodAppTextStyles.labelTextStyle)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget cardScroll() {
    return Expanded(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          children: <Widget>[
            recipeCard("assets/images/recipe1.png",
                "Lotus Leaf Glutinous Rice Lotus Leaf Glutinous Rice"),
            recipeCard("assets/images/recipe2.png", "BBQ Pork Puff"),
            recipeCard("assets/images/recipe3.png", "Title"),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: FoodAppThemeColors.Background,
        body: Column(
          children: [
            headerBar(),
            searchBox(),
            cardScroll(),
          ],
        ),
      ),
    );
  }
}

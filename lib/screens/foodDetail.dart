import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:food/common/colors.dart';
import 'package:food/common/textStyle.dart';

class FoodDetailPage extends StatefulWidget {
  const FoodDetailPage({super.key});

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  bool isChecked = false;

  Widget headerBar() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const SizedBox(
              width: 30,
              height: 30,
              child: Icon(AntDesign.arrowleft),
            ),
          ),
          const Text(
            "Recipe details",
            style: FoodAppTextStyles.headerTextStyle,
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }

  Widget mainImageContent() {
    return Stack(
      children: [
        Align(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 270,
            child: Image.asset(
              "assets/images/lotus_detail.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
        Align(
          heightFactor: 6,
          alignment: const Alignment(0.85, 0.85),
          child: InkWell(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                color: FoodAppThemeColors.White,
                borderRadius: BorderRadius.circular(50),
              ),
              padding: const EdgeInsets.all(10),
              child: const Icon(Feather.share_2),
            ),
          ),
        ),
      ],
    );
  }

  Widget handleButton() {
    return Container(
      width: 100,
      height: 35,
      padding: const EdgeInsets.fromLTRB(7, 0, 7, 0),
      decoration: BoxDecoration(
        color: FoodAppThemeColors.White,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: FoodAppThemeColors.BorderColor, width: 0.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          InkWell(
            child: Icon(
              AntDesign.minus,
              size: 25,
              color: FoodAppThemeColors.Yellow,
            ),
          ),
          Text("2", style: FoodAppTextStyles.mediumLabelTextStyle),
          InkWell(
            child: Icon(
              AntDesign.plus,
              size: 25,
              color: FoodAppThemeColors.Yellow,
            ),
          ),
        ],
      ),
    );
  }

  Widget statusRow(icon, text) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: FoodAppThemeColors.UniGray,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: FoodAppTextStyles.mediumLabelTextStyle,
        )
      ],
    );
  }

  Widget recipePropertyRow() {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              statusRow(Octicons.clock, "46 min"),
              const SizedBox(
                width: 20,
              ),
              statusRow(SimpleLineIcons.fire, "250 cal"),
            ],
          ),
          handleButton(),
        ],
      ),
    );
  }

  Widget categoryTile(category) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 6, 15, 6),
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: FoodAppThemeColors.White,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: FoodAppThemeColors.BorderColor, width: 0.5),
      ),
      child: Text(category, style: FoodAppTextStyles.tinyLabelTextStyle),
    );
  }

  Widget recipeCategoryRow() {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          categoryTile("Daily"),
          categoryTile("Salad"),
          categoryTile("Breakfast"),
          categoryTile("Light Food"),
        ],
      ),
    );
  }

  Widget ingredientRow(no, name, purpose) {
    return Container(
      padding: const EdgeInsets.only(top: 7, bottom: 7),
      decoration: const BoxDecoration(
          border: Border(
        bottom: BorderSide(
          color: FoodAppThemeColors.BorderColor,
          width: 0.5,
        ),
      )),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            no,
            style: FoodAppTextStyles.mediumLabelTextStyle,
          ),
          const SizedBox(
            width: 10,
          ),
          Checkbox(
            value: isChecked,
            onChanged: (bool? value) {
              setState(() {
                isChecked = value!;
              });
            },
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: FoodAppTextStyles.mediumLabelTextStyle,
              ),
              Text(
                purpose,
                style: FoodAppTextStyles.tinyLabelDisableTextStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget ingredientContainer() {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(top: 10),
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Container(
            decoration: BoxDecoration(
                color: FoodAppThemeColors.White,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                    color: FoodAppThemeColors.BorderColor, width: 0.5)),
            padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Ingredients",
                  style: FoodAppTextStyles.titleTextStyle,
                ),
                ingredientRow("1", "Sate Ayam", "For lunch"),
                ingredientRow("2", "Bakso", "For Sauce"),
                ingredientRow("3", "Nasi padang", "For Meat"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget detailContent() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Lotus Leaf Glutinous Rice",
            style: FoodAppTextStyles.titleTextStyle,
          ),
          recipePropertyRow(),
          recipeCategoryRow(),
          ingredientContainer(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: FoodAppThemeColors.Background,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            headerBar(),
            mainImageContent(),
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: detailContent(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

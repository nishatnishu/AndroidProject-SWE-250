import 'package:trek_mate/models/homePage_model.dart';
import 'package:trek_mate/widgets/popularPlace.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trek_mate/const.dart'; // Make sure this import is correct


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //for popular
  List<TravelDestination> popular =
      myDestination.where((element) => element.category == "popular").toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgroundColor,
      appBar: headerParts(),
      body: Column( // Removed const here
        children: [ // Removed const here
          const SizedBox(height: 20), // Added const here
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15), // Added const here
            child: Row( // Added const here
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [ // Added const here
                Text(
                  "Popular Place",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "See all",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: blueTextColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15), // Added const here
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(bottom: 40), // Added const here
            child: Row(
              children: List.generate(popular.length,
              (index)=> Padding(padding: EdgeInsets.symmetric(horizontal: 15),
              child: GestureDetector(
                onTap: () {},
                child: PopularPlace(destination: popular[index],
                
                 ),
              ),
              )
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar headerParts() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leadingWidth: 180,
      leading: const Row(
        children: [
          SizedBox(width: 15),
          Icon(
            Iconsax.location,
            color: Colors.black,
          ),
          SizedBox(width: 5),
          Text(
            "Bangladesh",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          Icon(
            Icons.keyboard_arrow_down,
            size: 30,
            color: Colors.black26,
          ),
        ],
      ),
      actions: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.black12,
            ),
          ),
          padding: const EdgeInsets.all(7),
          child: const Stack(
            children: [
              Icon(
                Iconsax.notification,
                color: Colors.black,
                size: 30,
              ),
              Positioned(
                top: 5,
                right: 5,
                child: CircleAvatar(
                  radius: 5,
                  backgroundColor: Colors.red,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 15),
      ],
    );
  }
}
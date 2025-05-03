import 'package:flutter/material.dart';
import 'package:trek_mate/models/homePage_model.dart';
import 'package:trek_mate/pages/placeDetailsScreen.dart';
import 'package:trek_mate/widgets/popularPlace.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trek_mate/const.dart';
import 'package:trek_mate/widgets/recommend.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // User Profile Data
  final Map<String, dynamic> userProfile = {
    'name': 'JERRY',
    'email': 'abcd@gmail.com',
    'photoUrl': 'https://i.pinimg.com/736x/e9/cd/33/e9cd3310df0be9dad8b64c2fa887d690.jpg',
    'isOnline': true,
  };

  int selectedPage = 0;
  String searchQuery = "";
  bool isSearching = false;
  bool showAllPopular = false;
  bool showAllRecommend = false;

  final TextEditingController searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  List<IconData> icons = [
    Iconsax.home1,
    Icons.confirmation_number_outlined,
    Icons.bookmark_outline,
    Icons.person_outline,
  ];

  List<TravelDestination> popular = myDestination
      .where((element) => element.category == "popular")
      .toList();

  List<TravelDestination> recommend = myDestination
      .where((element) => element.category == "recommend")
      .toList();

  List<TravelDestination> get filteredPopular {
    return popular
        .where((place) => place.name.toLowerCase().contains(searchQuery.toLowerCase()))
        .take(showAllPopular ? popular.length : 4)
        .toList();
  }

  List<TravelDestination> get filteredRecommend {
    return recommend
        .where((place) => place.name.toLowerCase().contains(searchQuery.toLowerCase()))
        .take(showAllRecommend ? recommend.length : 5)
        .toList();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    searchController.dispose();
    super.dispose();
  }

  void _showNotificationPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/Notification.gif',
                height: 150,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 20),
              const Text(
                'NO NOTIFICATIONS 🔔',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'You have no new notifications',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                ),
                child: const Text(
                  'OK',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leadingWidth: 170,
        leading: const Row(
          children: [
            SizedBox(width: 13),
            Icon(Iconsax.location, color: Color.fromARGB(237, 224, 23, 8), size: 24),
            SizedBox(width: 5),
            Text("Bangladesh",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: Colors.black)),
            Icon(Icons.keyboard_arrow_down, size: 30, color: Colors.black26),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(isSearching ? Icons.close : Iconsax.search_normal, color: Colors.black),
            onPressed: () {
              setState(() {
                isSearching = !isSearching;
                if (!isSearching) {
                  searchQuery = "";
                  searchController.clear();
                }
              });
            },
          ),
          // Notification Button
          GestureDetector(
            onTap: () => _showNotificationPopup(context),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.black12),
              ),
              padding: const EdgeInsets.all(7),
              child: const Stack(
                children: [
                  Icon(Iconsax.notification, color: Colors.black, size: 30),
                  Positioned(
                    top: 5, 
                    right: 5, 
                    child: CircleAvatar(
                      radius: 3,
                      backgroundColor: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          // User Profile Avatar
          GestureDetector(
            onTap: () => _showProfileMenu(context),
            child: Container(
              padding: const EdgeInsets.only(right: 15),
              child: CircleAvatar(
                radius: 18,
                backgroundImage: NetworkImage(userProfile['photoUrl']),
                child: userProfile['isOnline']
                    ? Positioned(
                        bottom: 5,
                        right: 4,
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                        ),
                      )
                    : null,
              ),
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          if (isSearching)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: TextField(
                  controller: searchController,
                  onChanged: (value) => setState(() => searchQuery = value),
                  decoration: InputDecoration(
                    hintText: "Search destinations...",
                    prefixIcon: const Icon(Iconsax.search_normal),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),
                ),
              ),
            ),

          // Popular Section
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Popular Place",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => setState(() => showAllPopular = !showAllPopular),
                        child: Text(
                          showAllPopular ? "Show less" : "See all",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: blueTextColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 240,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(bottom: 40),
                    itemCount: filteredPopular.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: PopularPlace(
                        destination: filteredPopular[index],
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlaceDetailsPage(destination: filteredPopular[index]),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Recommendation Section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Recommendation for you♡",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => setState(() => showAllRecommend = !showAllRecommend),
                    child: Text(
                      showAllRecommend ? "Show less" : "See all",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: blueTextColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: RecommendedPlace(
                  destination: filteredRecommend[index],
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlaceDetailsPage(destination: filteredRecommend[index]),
                    ),
                  ),
                ),
              ),
              childCount: filteredRecommend.length,
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 80)),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 9),
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: ButtonColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            icons.length,
            (index) => GestureDetector(
              onTap: () => setState(() => selectedPage = index),
              child: Icon(
                icons[index],
                size: 32,
                color: selectedPage == index ? Colors.white : Colors.white.withOpacity(0.4),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showProfileMenu(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        contentPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(userProfile['photoUrl']),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    userProfile['name'],
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    userProfile['email'],
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('My Profile'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Sign Out'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
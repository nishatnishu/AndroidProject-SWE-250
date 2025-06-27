import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:trek_mate/models/homePage_model.dart';
import 'package:trek_mate/pages/placeDetailsScreen.dart';
import 'package:trek_mate/widgets/popularPlace.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trek_mate/const.dart';
import 'package:trek_mate/widgets/recommend.dart';
import 'package:trek_mate/pages/user_profile.dart';
import 'package:trek_mate/pages/onboard_travel.dart';
import 'package:trek_mate/others/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final User? user = FirebaseAuth.instance.currentUser;
  String _selectedCountry = 'Bangladesh';
  final List<String> _countries = [
    'Bangladesh', 'Nepal', 'India', 'Bhutan',
    'Thailand', 'Indonesia', 'Malaysia', 'Vietnam'
  ];

  String searchQuery = "";
  bool isSearching = false;
  bool showAllPopular = false;
  bool showAllRecommend = false;

  final TextEditingController searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  List<TravelDestination> popular = myDestination
      .where((element) => element.category == "popular")
      .toList();

  List<TravelDestination> recommend = myDestination
      .where((element) => element.category == "recommend")
      .toList();

  @override
  void initState() {
    super.initState();
    // No need to load from SharedPreferences anymore
  }

  void _showCountrySelection() {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const Text(
              'Select Country',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _countries.length,
                itemBuilder: (context, index) {
                  final country = _countries[index];
                  final isSelected = _selectedCountry == country;
                  
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.blue.withOpacity(0.1) : Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: Icon(Iconsax.location, color: isSelected ? Colors.blue : Colors.grey),
                      title: Text(
                        country,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: isSelected ? Colors.blue : Colors.black,
                        ),
                      ),
                      trailing: isSelected
                          ? const Icon(Icons.check, color: Colors.blue)
                          : null,
                      onTap: () {
                        setState(() => _selectedCountry = country);
                        Navigator.pop(context);
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    },
  );
}

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

  Future<void> _signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const TravelOnBoardingScreen()),
        (Route<dynamic> route) => false,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error signing out: ${e.toString()}')),
      );
    }
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
        leading: GestureDetector(
          onTap: _showCountrySelection,
          child: Padding(
            padding: const EdgeInsets.only(left: 13),
            child: Row(
              children: [
                const Icon(Iconsax.location, color: Color.fromARGB(237, 224, 23, 8), size: 24),
                const SizedBox(width: 5),
                Text(
                  _selectedCountry,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Colors.black
                  ),
                ),
                const Icon(Icons.keyboard_arrow_down, size: 30, color: Colors.black26),
              ],
            ),
          ),
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
          GestureDetector(
            onTap: () => _showProfileMenu(context),
            child: Container(
              padding: const EdgeInsets.only(right: 15),
              child: CircleAvatar(
                radius: 18,
                backgroundImage: NetworkImage(
                  user?.photoURL ?? 'https://i.pinimg.com/736x/e9/cd/33/e9cd3310df0be9dad8b64c2fa887d690.jpg'
                ),
                child: user != null ? Positioned(
                  bottom: 5,
                  right: 10,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: user?.emailVerified ?? false ? Colors.green : Colors.orange,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                  ),
                ) : null,
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
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
        ],
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
            if (user != null) ...[
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
                      backgroundImage: NetworkImage(
                        user!.photoURL ?? 'https://i.pinimg.com/736x/e9/cd/33/e9cd3310df0be9dad8b64c2fa887d690.jpg'
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      user!.displayName ?? 'Guest User',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      user!.email ?? 'No email available',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    if (user!.emailVerified) ...[
                      const SizedBox(height: 8),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.verified, color: Colors.green, size: 16),
                          SizedBox(width: 4),
                          Text('Verified', style: TextStyle(color: Colors.green)),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('My Profile'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserProfileScreen(user: user!),
                    ),
                  );
                },
              ),
            ListTile(
  leading: const Icon(Icons.settings),
  title: const Text('Settings'),
  onTap: () {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SettingsScreen()),
    );
  },
),

              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.red),
                title: const Text('Sign Out', style: TextStyle(color: Colors.red)),
                onTap: () async {
                  Navigator.pop(context);
                  await _signOut(context);
                },
              ),
            ] else ...[
              ListTile(
                leading: const Icon(Icons.login),
                title: const Text('Sign In'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/login');
                },
              ),
              ListTile(
                leading: const Icon(Icons.person_add),
                title: const Text('Create Account'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/createAccount');
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}
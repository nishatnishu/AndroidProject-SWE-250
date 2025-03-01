import 'package:flutter/material.dart';
import 'package:trek_mate/models/homePage_model.dart';

class PlaceDetailsPage extends StatefulWidget {
  final TravelDestination destination;

  const PlaceDetailsPage({super.key, required this.destination});

  @override
  _PlaceDetailsPageState createState() => _PlaceDetailsPageState();
}

class _PlaceDetailsPageState extends State<PlaceDetailsPage> {
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  title: Text(widget.destination.name),
  backgroundColor: const Color.fromARGB(255, 213, 236, 237), 
  elevation: 0, 
  toolbarHeight: 30,
  titleTextStyle: TextStyle(
    color: const Color.fromARGB(255, 75, 72, 72), 
    fontSize: 16,
    // fontStyle: FontStyle.italic,
    fontFamily: "Haloberry"
  ),
),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            child: PageView.builder(
              itemCount: widget.destination.image?.length ?? 0,
              onPageChanged: (index) {
                setState(() {
                  _currentPageIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Image.asset(
                  widget.destination.image![index],
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          // Dots Indicator
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.destination.image?.length ?? 0,
                (index) => Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPageIndex == index ? Colors.blue : Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildCategoryIcon(Icons.info, "Overview"),
                  _buildCategoryIcon(Icons.map, "Map"),
                  _buildCategoryIcon(Icons.restaurant, "Food & Restaurants"),
                  _buildCategoryIcon(Icons.landscape, "Adventures"),
                  _buildCategoryIcon(Icons.hotel, "Accommodation"),
                  _buildCategoryIcon(Icons.people, "Culture & Local Experience"),
                  _buildCategoryIcon(Icons.tips_and_updates, "Travel Tips & Safety"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryIcon(IconData icon, String label) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {
          //  navigation logic ...:)
        },
        borderRadius: BorderRadius.circular(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.blue),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:trek_mate/models/homePage_model.dart';

class AdventureOverview extends StatelessWidget {
  final TravelDestination destination;

  const AdventureOverview({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Adventure Activities",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        // Adventure activities list
        _buildAdventureList(),
        const SizedBox(height: 24),
        Text(
          "About ${destination.name} Adventures",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          _getAdventureDescription(destination.name),
          style: TextStyle(fontSize: 16, height: 1.5),
        ),
      ],
    );
  }

  Widget _buildAdventureList() {
    // Get activities specific to this destination
    final activities = _getDestinationActivities(destination.name);

    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: activities.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Column(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.blue[100],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      activities[index]['imageUrl'], // Use 'imageUrl' key
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        // Optional: Display a placeholder if the image fails to load
                        return Center(child: Icon(Icons.image_not_supported));
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  activities[index]['name'],
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  String _getAdventureDescription(String placeName) {
    switch (placeName) {
      case "Mt. Everest":
        return "Experience the ultimate adventure with Everest Base Camp trekking, high-altitude climbing, and breathtaking Himalayan views. Suitable for experienced trekkers, this journey takes you through Sherpa villages and glacial valleys.";
      case "Pokhara":
        return "Pokhara offers paragliding, zip-lining, and stunning views of the Annapurna range. Enjoy boating on Phewa Lake or embark on short treks to nearby viewpoints.";
      case "Langtang Valley":
        return "The Langtang region offers trekking through beautiful rhododendron forests, with opportunities to see rare wildlife and experience Tamang culture. The trek is moderately difficult.";
      case "Annapurna":
        return "The Annapurna Circuit offers diverse trekking experiences from lush valleys to high mountain passes. Activities include trekking, mountain biking, and cultural tours.";
      case "Chitwan National Park":
        return "Adventure in Chitwan includes jungle safaris, elephant rides, canoe trips, and bird watching. Experience the thrill of spotting rhinos, tigers, and other wildlife.";
      case "Upper Mustang":
        return "Explore the forbidden kingdom with its unique Tibetan culture. Adventures include trekking through arid landscapes, visiting ancient monasteries, and experiencing local festivals.";
      default:
        return "This destination offers various adventure activities including trekking, hiking, and cultural experiences. Contact us for more information about specific adventure packages.";
    }
  }

  List<Map<String, dynamic>> _getDestinationActivities(String placeName) {
    switch (placeName) {
      case "Mt. Everest":
        return [
          {'name': 'Trekking', 'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVFvVuW5nHkER3aGQVsBHMRhpV8l7HM_0JxQ&s'},
          {'name': 'Climbing', 'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvMLjHfg-b7xUZ_jzUon0S0Xak7Zk2CkCuIfhkc1QFvLQp1IwFaZ5OaKJs8yAoa-IeFFE&usqp=CAU'},
          {'name': 'Heli Tour', 'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSlof7vQTRXGCCLoRSCGR8G2cIKKM_aRIZVw&s'},
        ];
      case "Pokhara":
        return [
          {'name': 'Paragliding', 'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQajiOvz8QStpaXq2ChvmI6J6jQknBj4PS-kw&s'},
          {'name': 'Zip Line', 'imageUrl': 'https://assets-excellenttrek.b-cdn.net/wp-content/uploads/2017/03/superman-zipline-pokhara-500x254.gif'},
          {'name': 'Boating', 'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPnMVxFkfhtVMr59susl0VAWhd9JCeCTMNfJonRwFriSFTqo_QRvP2mxtYXWdHsvyV0_w&usqp=CAU'},
        ];
      case "Chitwan National Park":
        return [
          {'name': 'Safari', 'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTarUVnce49LUEisHscfxpA7dyUiT7vbds1YA&s'},
          {'name': 'Elephant', 'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_xdcKnlxn7nNgT-ggVMzPD15EwRnQceS7Lw&s'},
          {'name': 'Birding', 'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlyXtbFfcIKICrEmu_aZArgesVb-l949lFqw&s'},
        ];
         case "Kathmandu Valley":
      return [
        {'name': 'Heritage Walk', 'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWwgLa2DfnOrC_V0I_r-9iQ8LqOlzb5_4TuA&s'},
        {'name': 'Temple Tour', 'imageUrl': 'https://www.chandragirihills.com/wp-content/themes/yootheme/cache/ea/Top-Sightseeing-place-in-Kathmandu-2-ea6cb1e4.jpeg'},
        {'name': 'Shopping', 'imageUrl': 'https://i0.wp.com/www.tusktravel.com/blog/wp-content/uploads/2021/03/Thamel-Market-Kathmandu-Nepal.jpg?resize=1000%2C667&ssl=1'},
      ];
    
    case "Bhaktapur":
      return [
        {'name': 'Pottery Square', 'imageUrl': 'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-480x320/06/8d/68/3d.jpg'},
        {'name': 'Nyatapola', 'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQj4wMr8bbFaN4OMDrGtfxjBeBlX5CICEtDzQ&s'},
        {'name': 'Juju Dhau', 'imageUrl': 'https://whatthenepal.com/wp-content/uploads/2024/01/256.jpg'},
      ];
      default:
        return [
          {'name': 'Trekking', 'imageUrl': 'https://t3.ftcdn.net/jpg/01/96/01/82/360_F_196018299_moUD9nFRL1OWaVTUG7YgsdCk3gCQVzj7.jpg'},
          {'name': 'Hiking', 'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSr3qz8BZUxmUbv4u69gi3vFMSvuRqam08IPYXQea1XBj5w9DoX1lPnLOnTEfmV1zK_EAY&usqp=CAU'},
          {'name': 'Sightsee', 'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4BLLCpLWRVSqEHkbo42TlhRvyTuZ6h-J1fw&s'},
        ];
    }
  }
}
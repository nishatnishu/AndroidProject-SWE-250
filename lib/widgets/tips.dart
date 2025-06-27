import 'package:flutter/material.dart';
import 'package:trek_mate/models/homePage_model.dart';

class TipsOverview extends StatelessWidget {
  final TravelDestination destination;

  const TipsOverview({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Essential Tips for ${destination.name}",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _buildTipCard(
            icon: Icons.health_and_safety,
            title: "Health & Safety",
            content: _getHealthTips(destination.name),
          ),
          _buildTipCard(
            icon: Icons.calendar_today,
            title: "Best Time to Visit",
            content: _getBestTime(destination.name),
          ),
          _buildTipCard(
            icon: Icons.directions_walk,
            title: "Getting Around",
            content: _getTransportTips(destination.name),
          ),
          _buildTipCard(
            icon: Icons.attach_money,
            title: "Budget Tips",
            content: _getBudgetTips(destination.name),
          ),
          _buildTipCard(
            icon: Icons.people,
            title: "Cultural Etiquette",
            content: _getCulturalTips(destination.name),
          ),
          const SizedBox(height: 20),
          Text(
            "Emergency Contacts",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.red[700],
            ),
          ),
          const SizedBox(height: 10),
          _buildEmergencyContacts(),
        ],
      ),
    );
  }

  Widget _buildTipCard({
    required IconData icon,
    required String title,
    required String content,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.blue),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              content,
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmergencyContacts() {
    return Card(
      color: Colors.red[50],
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildContactRow("Police", "100"),
            _buildContactRow("Ambulance", "102"),
            _buildContactRow("Tourist Police", "1144"),
            _buildContactRow("CIWEC Clinic (Kathmandu)", "+977-1-4424111"),
          ],
        ),
      ),
    );
  }

  Widget _buildContactRow(String label, String number) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          SizedBox(
            width: 150,
            child: Text(
              label,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Text(number),
          const Spacer(),
          IconButton(
            icon: Icon(Icons.phone, color: Colors.blue),
            onPressed: () {
        
            },
          ),
        ],
      ),
    );
  }

  String _getHealthTips(String placeName) {
    switch (placeName) {
      case "Mt. Everest":
        return "• Acclimatize properly to avoid altitude sickness\n"
               "• Carry Diamox for altitude sickness prevention\n"
               "• Stay hydrated and avoid alcohol\n"
               "• Pack a comprehensive first aid kit\n"
               "• Get travel insurance that covers high-altitude trekking";
      case "Chitwan National Park":
      case "Bardiya National Park":
        return "• Get vaccinated against Japanese Encephalitis and Typhoid\n"
               "• Use mosquito repellent to prevent malaria and dengue\n"
               "• Maintain safe distance from wildlife\n"
               "• Follow all safety instructions during jungle activities";
      default:
        return "• Drink only bottled or purified water\n"
               "• Carry basic medications for diarrhea, fever, and pain\n"
               "• Use sunscreen and wear hats to protect from sun\n"
               "• Be cautious with street food - choose freshly cooked items";
    }
  }

  String _getBestTime(String placeName) {
    switch (placeName) {
      case "Mt. Everest":
      case "Annapurna":
      case "Langtang Valley":
      case "Upper Mustang":
        return "Best months: March-May and September-November\n"
               "Avoid: June-August (monsoon) and December-February (extreme cold)";
      case "Chitwan National Park":
      case "Bardiya National Park":
        return "Best months: October-March (pleasant weather, good wildlife sightings)\n"
               "Avoid: April-June (very hot) and July-September (heavy rains)";
      case "Pokhara":
        return "Best months: October-November (clear mountain views)\n"
               "Good alternative: February-April (spring flowers)\n"
               "Avoid: June-September (cloudy and rainy)";
      default:
        return "Best months: October-November and February-April\n"
               "Monsoon (June-September) can be humid with occasional showers\n"
               "Winter (December-January) is pleasant but can be chilly at night";
    }
  }

  String _getTransportTips(String placeName) {
    switch (placeName) {
      case "Kathmandu Valley":
      case "Bhaktapur":
      case "Pashupatinath Temple":
        return "• Taxis are widely available but insist on meter or agree on fare first\n"
               "• Use ride-hailing apps like Pathao or Tootle\n"
               "• Public buses are cheap but crowded\n"
               "• Walking is good for short distances in city centers";
      case "Pokhara":
        return "• Rent bicycles or scooters to explore at your own pace\n"
               "• Taxis are available near tourist areas\n"
               "• Local buses connect to major attractions\n"
               "• Boats can be hired for lake crossings";
      case "Lumbini":
      case "Janakpur":
        return "• Hire a car with driver for day trips\n"
               "• Cycle rickshaws are good for short distances\n"
               "• Local buses connect to nearby towns\n"
               "• Domestic flights available from Kathmandu";
      default:
        return "• For remote areas, 4WD vehicles are recommended\n"
               "• Domestic flights connect major tourist destinations\n"
               "• Long-distance buses are economical but can be slow\n"
               "• Private jeep hires are good for group travel";
    }
  }

  String _getBudgetTips(String placeName) {
    switch (placeName) {
      case "Mt. Everest":
      case "Annapurna":
      case "Upper Mustang":
        return "• Trekking permits can be expensive - budget accordingly\n"
               "• Tea houses provide affordable accommodation\n"
               "• Pack snacks from Kathmandu to save on trail costs\n"
               "• Travel in groups to share guide/porter costs";
      case "Kathmandu Valley":
      case "Pokhara":
        return "• Mid-range hotels offer best value for money\n"
               "• Eat at local restaurants for authentic, affordable meals\n"
               "• Many temples and cultural sites have low entrance fees\n"
               "• Bargain politely in tourist markets";
      default:
        return "• Homestays offer affordable accommodation with local experience\n"
               "• Local buses are much cheaper than private transport\n"
               "• Street food is delicious and budget-friendly\n"
               "• Travel during shoulder seasons for better deals";
    }
  }

  String _getCulturalTips(String placeName) {
    switch (placeName) {
      case "Pashupatinath Temple":
      case "Lumbini":
      case "Janakpur":
        return "• Dress modestly when visiting religious sites\n"
               "• Remove shoes before entering temples\n"
               "• Ask permission before taking photos of people or rituals\n"
               "• Walk clockwise around stupas and temples";
      case "Upper Mustang":
      case "Langtang Valley":
        return "• Respect local Tibetan Buddhist customs\n"
               "• Don't touch religious objects without permission\n"
               "• Avoid pointing feet at people or sacred objects\n"
               "• Receive items with right hand or both hands";
      default:
        return "• Greet with 'Namaste' and folded hands\n"
               "• Avoid public displays of affection\n"
               "• Don't eat with your left hand\n"
               "• Remove shoes when entering homes\n"
               "• Dress modestly, especially in rural areas";
    }
  }
}
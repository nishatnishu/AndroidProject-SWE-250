import 'package:flutter/material.dart';
import 'package:trek_mate/models/homePage_model.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts

class RecommendedOverview extends StatelessWidget {
  final TravelDestination destination;

  const RecommendedOverview({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    // Custom overview for recommended places
    String overviewText = _getRecommendedOverview(destination.name);
    List<String> activities = _getActivities(destination.name);
    String bestTimeToVisit = _getBestTimeToVisitRecommended(destination.name);
    String localCuisine = _getLocalCuisine(destination.name);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
           Text(
          "Overview",
          style: TextStyle(
            fontFamily: 'Bitshow',
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: const Color.fromARGB(255, 5, 126, 156),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          overviewText,
          style: GoogleFonts.lato(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),

        
        const SizedBox(height: 15),
        if (activities.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Text(
                "Top Activities:",
                style: TextStyle(
                  fontFamily: 'CheeseOrange-Regular',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: const Color.fromARGB(255, 125, 2, 2),
                ),
              ),
              const SizedBox(height: 5),
              Wrap(
                spacing: 8,
                children: activities.map((activity) => Chip(label: Text(activity))).toList(),
              ),
              const SizedBox(height: 10),
            ],
          ),
        if (bestTimeToVisit.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "⏱️Best Time to Visit:",
                style: TextStyle(
                  fontFamily: 'CheeseOrange-Regular',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: const Color.fromARGB(255, 7, 114, 160),
                ),
              ),
              const SizedBox(height: 5),
              Text(bestTimeToVisit),
              const SizedBox(height: 10),
            ],
          ),
        if (localCuisine.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Local Cuisine:",
                style: TextStyle(
                  fontFamily: 'CheeseOrange-Regular',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: const Color.fromARGB(255, 95, 5, 12),
                ),
                
              ),
              const SizedBox(height: 5),
              Text(localCuisine),
              const SizedBox(height: 10),
            ],
          ),
        // Removed the Google link as requested
      ],
    );
  }

  String _getRecommendedOverview(String placeName) {
    switch (placeName) {
      case "Bhaktapur":
        return "Bhaktapur, the 'City of Devotees', is a well-preserved ancient city known for its exquisite architecture, pottery, and rich Newari culture. The city is a living museum of medieval art and architecture.";
      case "Annapurna":
        return "The Annapurna region offers some of Nepal's most diverse trekking routes, from short hikes to challenging circuits. The area features stunning mountain views, diverse ecosystems, and traditional Gurung villages.";
      case "Chitwan National Park":
        return "Chitwan National Park, Nepal's first national park, is home to Bengal tigers, one-horned rhinos, and over 500 bird species. The park offers jungle safaris, elephant rides, and Tharu cultural experiences.";
      case "Pashupatinath Temple":
        return "Pashupatinath Temple, a UNESCO World Heritage Site, is one of the most sacred Hindu temples dedicated to Lord Shiva. The temple complex on the Bagmati River is a center of Hindu pilgrimage and cremation rituals.";
      case "Upper Mustang":
        return "Upper Mustang, the former Kingdom of Lo, is a remote semi-autonomous region with Tibetan culture and dramatic desert landscapes. Often called 'Little Tibet', it was closed to foreigners until 1992.";
      case "Janakpur":
        return "Janakpur, the birthplace of Goddess Sita, is an important Hindu pilgrimage site. The city features beautiful Mithila art, the magnificent Janaki Temple, and celebrates the Vivah Panchami festival.";
      case "Bardiya National Park":
        return "Bardiya National Park in western Nepal is one of the most undisturbed protected areas, home to endangered species like Bengal tigers, wild elephants, and Gangetic dolphins in the Karnali River.";
      case "Ilam":
        return "Ilam, famous for its tea gardens, offers stunning views of the Eastern Himalayas. The region is known for its organic tea production, lush green hills, and tranquil environment.";
      case "Dharan":
        return "Dharan, a hill station in eastern Nepal, serves as a gateway to the Himalayas. It's known for its pleasant climate, religious sites, and as a starting point for treks to Kanchenjunga region.";
      case "Bandipur":
        return "Bandipur, a preserved Newar town, offers a blend of natural beauty and cultural heritage. This hilltop settlement features traditional houses, mountain views, and a peaceful atmosphere.";
      default:
        return "This recommended destination offers unique cultural experiences and beautiful landscapes worth exploring.";
    }
  }

  String _getKeyFeatures(String placeName) {
    switch (placeName) {
      case "Bhaktapur": return "Ancient architecture, pottery square, Nyatapola Temple";
      case "Annapurna": return "Trekking routes, mountain views, hot springs";
      case "Chitwan National Park": return "Wildlife safaris, Tharu culture, elephant breeding center";
      case "Pashupatinath Temple": return "Religious significance, cremation ghats, Sadhu sightings";
      case "Upper Mustang": return "Tibetan culture, Lo Manthang, cave monasteries";
      case "Janakpur": return "Janaki Temple, Mithila art, religious festivals";
      case "Bardiya National Park": return "Wildlife spotting, jungle walks, Tharu stick dance";
      case "Ilam": return "Tea gardens, mountain views, Antu Danda sunrise";
      case "Dharan": return "Religious sites, trekking gateway, pleasant climate";
      case "Bandipur": return "Newar architecture, mountain views, hiking trails";
      default: return "Unique cultural experiences and beautiful landscapes";
    }
  }

  List<String> _getActivities(String placeName) {
    switch (placeName) {
      case "Bhaktapur": return ["Exploring Durbar Square", "Pottery workshops", "Trying local yogurt"];
      case "Annapurna": return ["Trekking", "Sunrise views", "Visiting hot springs"];
      case "Chitwan National Park": return ["Jungle safari", "Bird watching", "Elephant ride"];
      case "Pashupatinath Temple": return ["Witnessing Aarti", "Exploring the complex", "Observing rituals"];
      case "Upper Mustang": return ["Exploring monasteries", "Trekking through canyons", "Experiencing Tibetan culture"];
      case "Janakpur": return ["Visiting Janaki Temple", "Exploring Mithila art", "Attending festivals"];
      case "Bardiya National Park": return ["Wildlife safari", "Canoeing", "Tharu cultural show"];
      case "Ilam": return ["Tea garden walks", "Sunrise viewing", "Exploring cardamom farms"];
      case "Dharan": return ["Visiting temples", "Hiking to viewpoints", "Enjoying the climate"];
      case "Bandipur": return ["Exploring the town", "Hiking to Siddha Gufa", "Enjoying mountain views"];
      default: return [];
    }
  }

  String _getBestTimeToVisitRecommended(String placeName) {
    switch (placeName) {
      case "Bhaktapur": return "October to April";
      case "Annapurna": return "March to May and September to November";
      case "Chitwan National Park": return "October to March";
      case "Pashupatinath Temple": return "Throughout the year, especially during festivals";
      case "Upper Mustang": return "April to October";
      case "Janakpur": return "October to March, especially during Vivah Panchami";
      case "Bardiya National Park": return "October to May";
      case "Ilam": return "October to December and March to May";
      case "Dharan": return "October to May";
      case "Bandipur": return "October to May";
      default: return "";
    }
  }

  String _getLocalCuisine(String placeName) {
    switch (placeName) {
      case "Bhaktapur": return "Juju Dhau (King Curd), Bara, Chatamari";
      case "Annapurna": return "Dal Bhat, Sel Roti, local Gurung dishes";
      case "Chitwan National Park": return "Tharu cuisine (Dhido, Ghonghi), wild edibles";
      case "Pashupatinath Temple": return "Vegetarian Nepali Thali";
      case "Upper Mustang": return "Tsampa, Tibetan butter tea, Thukpa";
      case "Janakpur": return "Mithila cuisine (fish curry, roti, sweets)";
      case "Bardiya National Park": return "Tharu cuisine, local fish preparations";
      case "Ilam": return "Different types of tea, local cheese, Tongba (millet beer)";
      case "Dharan": return "Local Newari and Rai dishes";
      case "Bandipur": return "Newari cuisine (Yomari, Momo)";
      default: return "Local Nepali cuisine";
    }
  }
}
import 'package:flutter/material.dart';
import 'package:trek_mate/models/homePage_model.dart';
import 'package:google_fonts/google_fonts.dart'; 

class PopularOverview extends StatefulWidget {
  final TravelDestination destination;

  const PopularOverview({super.key, required this.destination});

  @override
  State<PopularOverview> createState() => _PopularOverviewState();
}

class _PopularOverviewState extends State<PopularOverview> {
  String? selectedTag;

  @override
  Widget build(BuildContext context) {
    final destination = widget.destination;
    String overviewText = _getPopularOverview(destination.name);
    // String link = _getExternalLink(destination.name);
    List<String> tags = _getTags(destination.name);
    Map<String, String> tagDescriptions = _getTagDescriptions(destination.name);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
Text(
          "Overview",
           style: TextStyle(
            fontFamily: 'Bitshow',
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: const Color.fromARGB(255, 3, 51, 63),
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
        const SizedBox(height: 20),

        // Tags with tap support
        Wrap(
          spacing: 8,
          children: tags.map((tag) {
            return ActionChip(
              label: Text(
                tag,
                style: TextStyle(color: Colors.white), // White text on tag
              ),
              backgroundColor: selectedTag == tag ? Colors.blue.shade400 : Colors.grey[600],
              onPressed: () {
                setState(() {
                  selectedTag = selectedTag == tag ? null : tag;
                });
              },
            );
          }).toList(),
        ),

        // Show description of selected tag
        if (selectedTag != null && tagDescriptions[selectedTag!] != null)
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Text(
              tagDescriptions[selectedTag!]!,
              style: GoogleFonts.roboto( // Apply Roboto font
                fontSize: 15,
                fontStyle: FontStyle.italic,
                color: Colors.grey[700],
              ),
            ),
          ),

        const SizedBox(height: 20),
Text(
          "📅 Best Time to Visit:",
          style: TextStyle(
            fontFamily: 'CheeseOrange-Regular',
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: const Color.fromARGB(255, 8, 194, 194),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          _getBestTime(destination.name),
          style: GoogleFonts.lato( 
            fontSize: 16,
            color: Colors.black87,
          ),
        ),

        const SizedBox(height: 10),

      ],
    );
  }


  String _getPopularOverview(String placeName) {
    switch (placeName) {
      case "Mt. Everest":
        return "Mount Everest, standing at 8,848 meters, is Earth's highest mountain above sea level. Located in the Mahalangur Himal sub-range of the Himalayas, it offers breathtaking views and challenging climbs. The mountain straddles the border between Nepal and Tibet.";
      case "Kathmandu Valley":
        return "Kathmandu Valley, a UNESCO World Heritage Site, comprises three historic cities - Kathmandu, Patan, and Bhaktapur. Known for its rich culture, ancient temples, and vibrant streets, it's the cultural heart of Nepal.";
      case "Pokhara":
        return "Pokhara, Nepal's second largest city, is famous for its tranquil lakes and spectacular views of the Annapurna range. It's the gateway to the Annapurna Circuit and offers paragliding, boating, and trekking opportunities.";
      case "Langtang Valley":
        return "Langtang Valley, just north of Kathmandu, offers stunning Himalayan scenery and rich Tamang culture. Often called 'the valley of glaciers', it features high mountain passes, beautiful forests, and traditional villages.";
      case "Karnali River":
        return "The Karnali River, Nepal's longest river, offers some of the best whitewater rafting experiences. Flowing through remote western Nepal, it provides thrilling rapids and opportunities to spot wildlife.";
      case "Lumbini":
        return "Lumbini, the birthplace of Lord Buddha, is one of the most important spiritual sites in the world. The sacred garden and Mayadevi Temple are surrounded by monasteries from various Buddhist countries.";
      case "Manaslu Circuit":
        return "The Manaslu Circuit Trek circles Mount Manaslu, the world's eighth highest peak. This less-crowded alternative to Annapurna offers diverse landscapes from subtropical to arctic conditions.";
      default:
        return "This popular destination offers unique experiences and breathtaking views that attract travelers from around the world.";
    }
  }

  String _getBestTime(String placeName) {
    switch (placeName) {
      case "Mt. Everest":
      case "Langtang Valley":
      case "Manaslu Circuit":
        return "March to May and September to November";
      case "Kathmandu Valley":
      case "Pokhara":
      case "Lumbini":
        return "October to April";
      case "Karnali River":
        return "September to November and March to April for rafting";
      default:
        return "Spring (March to May) and Autumn (September to November)";
    }
  }

  List<String> _getTags(String placeName) {
    switch (placeName) {
      case "Mt. Everest":
        return ["Trekking", "Adventure", "World Record"];
      case "Pokhara":
        return ["Lakeside", "Paragliding", "Relaxation"];
      case "Lumbini":
        return ["Spiritual", "UNESCO Site", "Peaceful"];
      case "Manaslu Circuit":
        return ["Offbeat", "Trekking", "High Altitude"];
      case "Kathmandu Valley":
        return ["Culture", "UNESCO Heritage", "Historic Cities"];
      case "Langtang Valley":
        return ["Trekking", "Glaciers", "Tamang Culture"];
      case "Karnali River":
        return ["Rafting", "Remote", "Wildlife"];
      default:
        return ["Nature", "Travel", "Explore"];
    }
  }

  Map<String, String> _getTagDescriptions(String placeName) {
    switch (placeName) {
      case "Mt. Everest":
        return {
          "Trekking": "Experience world-renowned trekking routes like Everest Base Camp.",
          "Adventure": "Challenging climbs and extreme altitude await thrill-seekers.",
          "World Record": "Known as Earth's highest point at 8,848 meters.",
        };
      case "Kathmandu Valley":
        return {
          "Culture": "Explore ancient temples, stupas, and Newar traditions.",
          "UNESCO Heritage": "Home to 7 UNESCO World Heritage Sites.",
          "Historic Cities": "Includes Kathmandu, Patan, and Bhaktapur with rich histories.",
        };
      case "Pokhara":
        return {
          "Lakeside": "Chill by the peaceful Phewa Lake, lined with cafes and shops.",
          "Paragliding": "One of the best spots for tandem paragliding with mountain views.",
          "Relaxation": "Escape the chaos and enjoy peaceful vibes with nature.",
        };
      case "Langtang Valley":
        return {
          "Trekking": "Less-crowded treks with stunning mountain views.",
          "Glaciers": "Known as the valley of glaciers with icy wonders.",
          "Tamang Culture": "Immerse in the unique lifestyle of the Tamang people.",
        };
      case "Karnali River":
        return {
          "Rafting": "Wild whitewater rapids perfect for adventure lovers.",
          "Remote": "One of Nepal’s most untouched and raw regions.",
          "Wildlife": "Spot rare species while navigating scenic waters.",
        };
      case "Lumbini":
        return {
          "Spiritual": "Pilgrimage site and sacred ground for Buddhists worldwide.",
          "UNESCO Site": "Recognized for its global religious and cultural value.",
          "Peaceful": "Calm environment perfect for meditation and reflection.",
        };
      case "Manaslu Circuit":
        return {
          "Offbeat": "A less-traveled alternative to Annapurna with raw nature.",
          "Trekking": "Stunning trails circling the world's 8th highest mountain.",
          "High Altitude": "Traverse challenging passes and remote villages.",
        };
      default:
        return {
          "Nature": "Enjoy Nepal's rich and diverse natural beauty.",
          "Travel": "Explore scenic destinations and cultural landmarks.",
          "Explore": "Adventure through forests, peaks, and valleys.",
        };
    }
  }
}

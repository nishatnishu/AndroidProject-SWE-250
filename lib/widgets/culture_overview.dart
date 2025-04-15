import 'package:flutter/material.dart';
import 'package:trek_mate/models/homePage_model.dart';

class CultureOverview extends StatelessWidget {
  final TravelDestination destination;

  const CultureOverview({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    final culturalData = _getCulturalData(destination.name);
    
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Cultural Hero Section
          _buildHeroSection(context, culturalData),
          const SizedBox(height: 24),
          
          // Cultural Highlights
          _buildSectionTitle("Cultural Highlights"),
          const SizedBox(height: 8),
          Text(
            culturalData['highlights']!,
            style: const TextStyle(fontSize: 16, height: 1.6),
          ),
          const SizedBox(height: 24),

          // Cultural Sections
          _buildCultureSection(
            icon: Icons.people,
            title: "People & Traditions",
            content: culturalData['people']!,
          ),
          _buildCultureSection(
            icon: Icons.celebration,
            title: "Festivals",
            content: culturalData['festivals']!,
          ),
          _buildCultureSection(
            icon: Icons.restaurant,
            title: "Local Cuisine",
            content: culturalData['cuisine']!,
          ),
          _buildCultureSection(
            icon: Icons.emoji_people,
            title: "Cultural Etiquette",
            content: culturalData['etiquette']!,
            isLast: true,
          ),
        ],
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context, Map<String, String> culturalData) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: NetworkImage(culturalData['heroImage']!),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.3),
            BlendMode.darken,
          ),
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            culturalData['title']!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: [
                Shadow(
                  blurRadius: 10,
                  color: Colors.black,
                  offset: Offset(2, 2),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.blue[800],
      ),
    );
  }

  Widget _buildCultureSection({
    required IconData icon,
    required String title,
    required String content,
    bool isLast = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Row(
          children: [
            Icon(icon, color: Colors.orange[800], size: 28),
            const SizedBox(width: 12),
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.orange[800],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          content,
          style: const TextStyle(fontSize: 16, height: 1.6),
        ),
        if (!isLast) ...[
          const SizedBox(height: 24),
          const Divider(height: 1, color: Colors.grey),
        ],
      ],
    );
  }

  Map<String, String> _getCulturalData(String placeName) {
    final data = {
      "Mt. Everest": {
        'title': "Sherpa Culture of Khumbu",
        'heroImage': 'https://media.istockphoto.com/id/2158145684/photo/caucasian-woman-trekker-with-male-guide-stand-treks-on-path-high-viewpoint-in-sagarmatha.jpg?s=612x612&w=0&k=20&c=Hp9DJYDp-Ux3fsEvbpSZzUy8Y0XZhc3cMQ4hyygB5hk=',
        'highlights': "The Everest region...",
        'people': "• Sherpas are...",
        'festivals': "• Dumje (April/May)...",
        'cuisine': "• Tsampa: Roasted...",
        'etiquette': "• Walk clockwise..."
      },
      "Kathmandu Valley": {
        'title': "Newari Heritage of Kathmandu",
        'heroImage': 'https://media.gettyimages.com/id/619440490/photo/newari-people-observing-the-festival-from-traditional-window-during-newari-new-year-parade-nhu.jpg?s=612x612&w=gi&k=20&c=7rns-7TlwxOnJRdweJVDx0GhUFoTnnklrDyGIxmn5qI=',
        'highlights': "The Kathmandu Valley...",
        'people': "• Newars are...",
        'festivals': "• Indra Jatra (Sep)...",
        'cuisine': "• Newari Khaja Set...",
        'etiquette': "• Don't point..."
      },
      "Pokhara": {
        'title': "Mixed Cultures of Pokhara",
        'heroImage': 'https://tripjive.com/wp-content/uploads/2024/10/Pokhara-cultural-shows-and-performances.jpg',
        'highlights': "Pokhara blends...",
        'people': "• Gurung and Magar...",
        'festivals': "• Tamu Losar (Dec)...",
        'cuisine': "• Dal Bhat...",
        'etiquette': "• Respect monasteries..."
      },
      "Lumbini": {
        'title': "Birthplace of Buddha",
        'heroImage': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQT8u3bGDMrGSgaGxm_qrvQu_rfVOvqyqEGKA&s',
        'highlights': "As the birthplace...",
        'people': "• Tharu people...",
        'festivals': "• Buddha Jayanti (May)...",
        'cuisine': "• Dhindo...",
        'etiquette': "• Maintain silence..."
      },
      "Bhaktapur": {
        'title': "Medieval Newari City",
        'heroImage': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRJLlhlbdjis3XbBtQ-NXpd6NLfaV6mof-0VQqrjlpZux7A47u0hbUBtesnnrNmgo1LeM&usqp=CAU',
        'highlights': "Bhaktapur preserves ancient Newari culture with its well-preserved medieval architecture, pottery squares, and traditional crafts.",
        'people': "• Newari artisans specializing in woodcarving and pottery\n• Traditional farmers maintaining ancient agricultural practices\n• Cultural performers keeping ancient dance forms alive",
        'festivals': "• Bisket Jatra: New Year festival with chariot procession\n• Gai Jatra: Cow festival honoring the dead\n• Dashain: Nepal's biggest Hindu festival\n• Local pottery and craft festivals",
        'cuisine': "• Juju Dhau: King Curd, the famous Bhaktapur yogurt\n• Bara: Savory lentil pancakes\n• Yomari: Sweet rice flour dumplings\n• Newari feast platters with various meats and pickles",
        'etiquette': "• Remove shoes before entering temple areas\n• Ask permission before photographing artisans at work\n• Dress modestly in the old town area\n• Respect religious processions\n• Support local craftspeople by purchasing authentic goods"
      },

    };

    return data[placeName] ?? {
      'title': "Cultural Heritage of $placeName",
      'heroImage': 'https://www.footprintadventure.com/uploads/img/cover-small-.jpg',
      'highlights': "$placeName boasts a rich cultural heritage...",
      'people': "• Diverse ethnic communities...",
      'festivals': "• Local versions of major...",
      'cuisine': "• Local variations of...",
      'etiquette': "• Greet with 'Namaste'..."
    };
  }
}
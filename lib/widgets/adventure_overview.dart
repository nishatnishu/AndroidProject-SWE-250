import 'package:flutter/material.dart';
import 'package:trek_mate/models/homePage_model.dart';

class AdventureOverview extends StatefulWidget {
  final TravelDestination destination;

  const AdventureOverview({super.key, required this.destination});

  @override
  State<AdventureOverview> createState() => _AdventureOverviewState();
}

class _AdventureOverviewState extends State<AdventureOverview> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  bool _isBookingComplete = false;
  bool _showBookingForm = false;

@override
void dispose() {
  _nameController.dispose();
  _emailController.dispose();
  _phoneController.dispose();  
  super.dispose();
}
  void _handleBooking() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isBookingComplete = true;
      });
    }
  }

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
        _buildAdventureList(),
        const SizedBox(height: 24),
        Text(
          "About ${widget.destination.name} Adventures",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _getAdventureDescription(widget.destination.name),
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 8),
            Text(
              "Tour Guide: ${_getTourGuideInfo(widget.destination.name)}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "Contact: ${_getTourGuideContact(widget.destination.name)}",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        const SizedBox(height: 24),
        
        // Booking Section
        _isBookingComplete
            ? _buildBookingConfirmation()
            : _showBookingForm
                ? _buildBookingForm()
                : ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _showBookingForm = true;
                      });
                    },
                    child: const Text("Book Now"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Blue color for the button
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    ),
                  ),
      ],
    );
  }

  Widget _buildBookingForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Full Name',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!value.contains('@')) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
TextFormField(
  controller: _phoneController,
  decoration: const InputDecoration(
    labelText: 'Phone Number',
    border: OutlineInputBorder(),
  ),
  keyboardType: TextInputType.phone,
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    }
    if (value.length < 10) {
      return 'Please enter a valid phone number';
    }
    return null;
  },
),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: _handleBooking,
            child: const Text("Confirm Booking"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // Blue color for the button
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _showBookingForm = false;
              });
            },
            child: const Text("Cancel"),
          ),
        ],
      ),
    );
  }

 Widget _buildBookingConfirmation() {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.green[50],
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: Colors.green),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Booking is Done!",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
        const SizedBox(height: 8),
        Text("Destination: ${widget.destination.name}"),
        Text("Name: ${_nameController.text}"),
        Text("Email: ${_emailController.text}"),
        if (_phoneController.text.isNotEmpty)
          Text("Phone: ${_phoneController.text}"),
        const SizedBox(height: 16),
        const Text(
          "We'll contact you shortly with more details.",
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
        const SizedBox(height: 16),
        Center(
          child: SizedBox(
            width: 150, // Set your desired width here
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _isBookingComplete = false;
                  _showBookingForm = false;
                  _nameController.clear();
                  _emailController.clear();
                  _phoneController.clear();
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Text("Cancel Booking"),
            ),
          ),
        ),
      ],
    ),
  );
}
  // Add these new methods for tour guide information
  String _getTourGuideInfo(String placeName) {
    switch (placeName) {
      case "Mt. Everest":
        return "Sherpa Mingma (10+ years experience)";
      case "Pokhara":
        return "Adventure Guru Raj (Paragliding expert)";
      case "Langtang Valley":
        return "Tamang Guide Collective";
      case "Annapurna":
        return "ACAP Certified Guides";
      case "Chitwan National Park":
        return "Jungle Safari Experts";
      case "Upper Mustang":
        return "Local Mustangi Guides";
      default:
        return "Local Expert Guide";
    }
  }

  String _getTourGuideContact(String placeName) {
    switch (placeName) {
      case "Mt. Everest":
        return "+977 9801234567";
      case "Pokhara":
        return "+977 9807654321";
      case "Langtang Valley":
        return "+977 9812345678";
      case "Annapurna":
        return "+977 9823456789";
      case "Chitwan National Park":
        return "+977 9834567890";
      case "Upper Mustang":
        return "+977 9845678901";
      default:
        return "+977 9800000000";
    }
  }

  Widget _buildAdventureList() {
    final activities = _getDestinationActivities(widget.destination.name);

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
                      activities[index]['imageUrl'],
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
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
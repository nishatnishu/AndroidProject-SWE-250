import 'package:flutter/material.dart';
import 'package:trek_mate/models/homePage_model.dart';

class StayOverview extends StatefulWidget {
  final TravelDestination destination;

  const StayOverview({super.key, required this.destination});

  @override
  State<StayOverview> createState() => _StayOverviewState();
}

class _StayOverviewState extends State<StayOverview> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  String? _currentHotelName;
  bool _isBookingComplete = false;
  bool _showBookingForm = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _showBookingFormDialog(BuildContext context, String hotelName) {
    setState(() {
      _currentHotelName = hotelName;
      _showBookingForm = true;
      _isBookingComplete = false;
    });
  }

  Widget _buildBookingForm() {
    return AlertDialog(
      title: Text("Book $_currentHotelName"),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Full Name'),
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
                decoration: const InputDecoration(labelText: 'Email'),
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
                decoration: const InputDecoration(labelText: 'Phone Number'),
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
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            setState(() {
              _showBookingForm = false;
            });
          },
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              Navigator.of(context).pop();
              setState(() {
                _isBookingComplete = true;
                _showBookingForm = false;
              });
            }
          },
          child: const Text("Confirm"),
        ),
      ],
    );
  }

  Widget _buildBookingConfirmation() {
    return AlertDialog(
      title: const Text("Booking Confirmed"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Hotel: $_currentHotelName"),
          Text("Name: ${_nameController.text}"),
          Text("Email: ${_emailController.text}"),
          Text("Phone: ${_phoneController.text}"),
          const SizedBox(height: 16),
          const Text("We'll contact you shortly with more details."),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              _isBookingComplete = false;
              _nameController.clear();
              _emailController.clear();
              _phoneController.clear();
            });
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
          ),
          child: const Text("Cancel Booking"),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_showBookingForm) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          builder: (context) => _buildBookingForm(),
        );
      });
    }

    if (_isBookingComplete) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          builder: (context) => _buildBookingConfirmation(),
        );
      });
    }

    final stayOptions = _getStayOptions(widget.destination.name);
    
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Where to Stay in ${widget.destination.name}",
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          _buildAccommodationTypes(),
          const SizedBox(height: 24),
          _buildStayOptionsList(context, stayOptions),
          const SizedBox(height: 24),
          _buildStayTips(),
        ],
      ),
    );
  }

  Widget _buildAccommodationTypes() {
    final types = _getAccommodationTypes(widget.destination.name);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Accommodation Types:",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: types.map((type) => Chip(
            label: Text(type),
            backgroundColor: Colors.blue[50],
          )).toList(),
        ),
      ],
    );
  }

  Widget _buildStayOptionsList(BuildContext context, List<Map<String, dynamic>> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Recommended Stays:",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: options.length,
          separatorBuilder: (context, index) => const Divider(height: 24),
          itemBuilder: (context, index) {
            final option = options[index];
            return _buildStayCard(context, option);
          },
        ),
      ],
    );
  }

  Widget _buildStayCard(BuildContext context, Map<String, dynamic> option) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    option['imageUrl'] ?? 'https://via.placeholder.com/100',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        width: 100,
                        height: 100,
                        color: Colors.grey[200],
                        child: const Center(child: CircularProgressIndicator()),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 100,
                        height: 100,
                        color: Colors.grey[200],
                        child: const Icon(Icons.hotel, size: 40),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        option['name'] ?? 'Unnamed Hotel',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        option['type'] ?? 'Accommodation',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            option['price'] ?? 'Price not available',
                            style: TextStyle(
                              color: Colors.green[700],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          if (option['rating'] != null) ...[
                            const Icon(Icons.star, color: Colors.amber, size: 16),
                            const SizedBox(width: 4),
                            Text(option['rating'].toString()),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight, 
              child: SizedBox( 
                width: 90, 
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    minimumSize: const Size(0, 36),
                  ),
                  onPressed: () {
                    _showBookingFormDialog(context, option['name'] ?? 'Hotel');
                  },
                  child: const Text(
                    "Book now",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStayTips() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Stay Tips:",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          _getStayTips(widget.destination.name),
          style: TextStyle(color: Colors.grey[700]),
        ),
      ],
    );
  }

List<String> _getAccommodationTypes(String placeName) {
  switch (placeName) {
    // Popular Places
    case "Mt. Everest":
      return ["Teahouses", "Mountain Lodges", "Base Camp Tents"];
    case "Kathmandu Valley":
      return ["Luxury Hotels", "Boutique Guesthouses", "Hostels"];
    case "Pokhara":
      return ["Lakeside Resorts", "Budget Hotels", "Eco Lodges"];
    case "Langtang Valley":
      return ["Teahouses", "Village Homestays", "Mountain Huts"];
    case "Karnali River":
      return ["Riverside Lodges", "Camp Sites", "Eco Resorts"];
    case "Lumbini":
      return ["Pilgrim Guesthouses", "Meditation Centers", "Budget Hotels"];
    case "Manaslu Circuit":
      return ["Teahouses", "Mountain Lodges"];
    case "Rara Lake":
      return ["Lakeside Lodges", "Basic Guesthouses"];
    
    // Recommended Places  
    case "Bhaktapur":
      return ["Heritage Hotels", "Traditional Guesthouses"];
    case "Annapurna":
      return ["Mountain Lodges", "Teahouses", "Eco Resorts"];
    case "Chitwan National Park":
      return ["Jungle Lodges", "Wildlife Resorts", "Eco Retreats"];
    case "Pashupatinath Temple":
      return ["Pilgrim Hotels", "Spiritual Retreats"];
    case "Upper Mustang":
      return ["Traditional Inns", "Cave Guesthouses"];
    case "Janakpur":
      return ["Pilgrim Hotels", "Budget Stays"];
    case "Bardiya National Park":
      return ["Jungle Lodges", "Wildlife Resorts"];
    case "Ilam":
      return ["Tea Estate Bungalows", "Hill Resorts"];
    case "Dharan":
      return ["Hill Resorts", "Budget Hotels"];
    case "Bandipur":
      return ["Heritage Hotels", "Traditional Guesthouses"];
    default:
      return ["Hotels", "Guesthouses", "Homestays"];
  }
}

List<Map<String, dynamic>> _getStayOptions(String placeName) {
  switch (placeName) {
    // Popular Places
    case "Mt. Everest":
      return [
        {
          'name': 'Everest Summit Lodge',
          'type': 'Mountain Teahouse',
          'price': '₹2,500 - ₹4,000/night',
          'rating': 4.5,
          'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcf4k0BBVY0o3MG_hbJtqt2nrKwTDnWqg75g&s'
        },
        {
          'name': 'Namche Guest House',
          'type': 'Alpine Lodge',
          'price': '₹3,000 - ₹5,000/night',
          'rating': 4.2,
          'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsVtpIBzkxwZ2pYCAEotny2C4CqzupIH4Ryw&s'
        },
        {
          'name': 'Gorak Shep Inn',
          'type': 'Base Camp Lodge',
          'price': '₹3,500/night',
          'rating': 4.0,
          'imageUrl': 'https://www.vivaanadventure.com/wp-content/uploads/2019/12/Hotel-in-Gorakshep.jpg'
        }
      ];
    
    case "Kathmandu Valley":
      return [
        {
          'name': 'Dwarika\'s Hotel',
          'type': 'Luxury Heritage',
          'price': '₹15,000+/night',
          'rating': 4.8,
          'imageUrl': 'https://www.journeyera.com/wp-content/uploads/2022/01/luxury-5-star-hotels-kathmandu-thamel-251085752-1200x800.jpg'
        },
        {
          'name': 'Kathmandu Guest House',
          'type': 'Boutique Hotel',
          'price': '₹4,000 - ₹8,000/night',
          'rating': 4.3,
          'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRE6rD-2uh8hPA0_F_16OmInOQ0CQ1KlqKJZA&s'
        },
        {
          'name': 'Hotel Yak & Yeti',
          'type': 'Luxury Hotel',
          'price': '₹12,000+/night',
          'rating': 4.7,
          'imageUrl': 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/430692672.jpg?k=1dbf5fb08f623c5dd57b649fae789cab42b5703fdb2ca054ac1f8638db38974f&o=&hp=1'
        }
      ];
    
    case "Pokhara":
      return [
        {
          'name': 'Temple Tree Resort',
          'type': 'Lakeside Resort',
          'price': '₹8,000 - ₹12,000/night',
          'rating': 4.6,
          'imageUrl': 'https://pix10.agoda.net/hotelImages/5401118/-1/a3987abb3b54dbfc1fdddbf319fdcfbb.jpg?ca=8&ce=1&s=702x392'
        },
        {
          'name': 'Hotel Barahi',
          'type': 'Luxury Lakeside',
          'price': '₹10,000+/night',
          'rating': 4.5,
          'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-kVjfrUV2aZVegAxRmi9aP08kg9cgOw75FWIiA1Z3dP0uGQ57BPhxq1DVOgsPARfY8rM&usqp=CAU'
        },
        {
          'name': 'Zostel Pokhara',
          'type': 'Budget Hostel',
          'price': '₹1,200/night',
          'rating': 4.2,
          'imageUrl': 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/2d/97/10/b4/caption.jpg?w=1200&h=-1&s=1'
        }
      ];
    
    case "Langtang Valley":
      return [
        {
          'name': 'Langtang View Lodge',
          'type': 'Mountain Teahouse',
          'price': '₹2,000/night',
          'rating': 4.1,
          'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSl81ZTvZzDcoCfMmUPqX1f7PWz-k6uL3I2FA&s'
        },
        {
          'name': 'Lama Hotel village',
          'type': 'Alpine Lodge',
          'price': '₹2,500/night',
          'rating': 4.0,
          'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0qIb-0hHpVrb2WAm0wyLdSh8nzVKxKaGh3oPgVgHghzUfpnyuwRWWaARn2SEQzYpvyXs&usqp=CAU'
        }
      ];
    
    // Recommended Places
    case "Bhaktapur":
      return [
        {
          'name': 'Peacock Guest House',
          'type': 'Heritage Stay',
          'price': '₹3,500 - ₹6,000/night',
          'rating': 4.6,
          'imageUrl': 'https://www.weseektravel.com/wp-content/uploads/2023/03/Hotel-Heritage-1024x760.jpeg'
        },
        {
          'name': 'Pagoda Guest House',
          'type': 'Traditional Stay',
          'price': '₹2,500 - ₹4,500/night',
          'rating': 4.3,
          'imageUrl': 'https://ik.imgkit.net/3vlqs5axxjf/external/ik-seo/http://images.ntmllc.com/v4/hotel/T57/T57824/T57824_EXT_Z737AD/Hotel-Heritage-Exterior.JPG?tr=w-780%2Ch-437%2Cfo-auto'
        }
      ];
    
    case "Chitwan National Park":
      return [
        {
          'name': 'Tiger Tops Jungle Lodge',
          'type': 'Eco Resort',
          'price': '₹12,000+/night',
          'rating': 4.7,
          'imageUrl': 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/07/1f/8a/72/green-park-chitwan.jpg?w=1200&h=-1&s=1'
        },
        {
          'name': 'Green Park Chitwan',
          'type': 'Wildlife Resort',
          'price': '₹8,000/night',
          'rating': 4.4,
          'imageUrl': 'https://pix10.agoda.net/hotelImages/266/266800/266800_17032618440051873794.jpg?ca=6&ce=1&s=312x235&ar=16x9'
        }
      ];
    
    case "Upper Mustang":
      return [
        {
          'name': 'Lo Manthang Guest House',
          'type': 'Traditional Inn',
          'price': '₹4,000/night',
          'rating': 4.2,
          'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5uMpxLIlz6HRy6uey_Jl-gtv9zzfASUWamCylDdC6Nd87paxCQHHj8W3CDkkqiWGrfOA&usqp=CAU'
        },
        {
          'name': 'Mustang Eco Lodge',
          'type': 'Cave Hotel',
          'price': '₹5,000/night',
          'rating': 4.3,
          'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQU1j-UDGCPlzqMk-kXEpRYzbxEBeSDrwotj-fWMz14w-e_tV6imcngdxHR_PRwKQpGhao&usqp=CAU'
        }
      ];
    
   
    default:
      return [
        {
          'name': '${placeName.split(" ").first} Lodge',
          'type': 'Standard Hotel',
          'price': '₹2,000 - ₹5,000/night',
          'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQi2O5GJpxAfNqVGlk0j4Yu1_JT0H_xXFVt-l1DbVlFpWnyUSUNEPvZibfry2hCH_LJ2t4&usqp=CAU'
        },
        {
          'name': '${placeName.split(" ").first} Guest House',
          'type': 'Budget Stay',
          'price': '₹1,500 - ₹3,000/night',
          'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZJ5VPC_sSgKCAvF0hvSXkmmN5GmOjgqtGXOVlrrAUfJR1vjpC4apQ8K6HBphCCaDejHI&usqp=CAU'
        }
      ];
  }
}

String _getStayTips(String placeName) {
  switch (placeName) {
    case "Mt. Everest":
      return "Book teahouses in advance during peak seasons (March-May, Sept-Nov). Bring a sleeping bag for higher altitude stays.";
    case "Kathmandu Valley":
      return "Thamel area has the highest concentration of hotels. Consider staying in Patan or Bhaktapur for quieter experiences.";
    case "Pokhara":
      return "Lakeside area offers the best views and dining options. Book rooms with mountain views for sunrise experiences.";
    case "Chitwan National Park":
      return "Jungle lodges often include safari packages. Choose riverside properties for wildlife viewing opportunities.";
    case "Upper Mustang":
      return "Accommodation is basic due to remote location. Bring cash as credit cards are rarely accepted.";
    case "Langtang Valley":
      return "Teahouses provide basic amenities. Bring warm clothing as nights can be cold even in summer.";
    case "Bhaktapur":
      return "Stay within the old city to experience the medieval atmosphere. Many guesthouses offer rooftop views of the temples.";
    default:
      return "Consider booking accommodations that include breakfast. Check recent reviews for current conditions.";
  }
}
}
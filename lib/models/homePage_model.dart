import 'dart:math';

Random random = Random();

class TravelDestination {
  final int id, price, review;
  final List<String>? image;
  final String name, description, category, location;
  final double rate;

  TravelDestination({
    required this.id,
    required this.name,
    required this.price,
    required this.review,
    required this.image,
    required this.category,
    required this.location,
    required this.description,
    required this.rate,
  });
}

const String description =
    'Travel places offer a wide array of experiences, each with its own unique charm and appeal. From stunning natural landscapes to historic landmarks, there is something for every traveler. Coastal destinations like tropical beaches invite relaxation with crystal-clear waters, while mountainous regions offer adventurous hiking trails and breathtaking views.';

List<TravelDestination> myDestination = [
  TravelDestination(
    id: 2,
    name: "Mt. Everest",
    category: "popular",
    image: [
      "assets/images/homepageimg/Everest01.jpeg",
      "assets/images/homepageimg/Everest02.jpeg",
      "assets/images/homepageimg/Everest03.jpeg",
      "assets/images/homepageimg/Everest04.jpeg",
      "assets/images/homepageimg/Everest05.jpeg",
    ],
    location: "Sagarmatha, Nepal",
    review: random.nextInt(300) + 25,
    price: 999,
    description: description,
    rate: 4.9,
  ),
  TravelDestination(
    id: 10, 
    name: "Kathmandu Valley",
    category: "popular",
    image: [
      "assets/images/homepageimg/Kathmandu01.jpeg",
      "assets/images/homepageimg/Kathmandu02.jpeg",
      "assets/images/homepageimg/Kathmandu03.jpeg",
      "assets/images/homepageimg/Kathmandu04.jpeg",
      "assets/images/homepageimg/Kathmandu05.jpeg",
    ],
    location: "Kathmandu, Nepal",
    review: random.nextInt(300) + 25,
    price: 299,
    description: description,
    rate: 4.8,
  ),
  TravelDestination(
    id: 9, 
    name: "Karnali River",
    category: "popular",
    image: [
      "assets/images/homepageimg/KarnaliRiver01.jpeg",
      "assets/images/homepageimg/KarnaliRiver02.jpeg",
      "assets/images/homepageimg/KarnaliRiver03.jpeg",
      "assets/images/homepageimg/KarnaliRiver04.jpeg",
    ],
    location: "Kailali, Nepal",
    review: random.nextInt(300) + 25,
    price: 199,
    description: description,
    rate: 4.7,
  ),
  TravelDestination(
  id: 7,
  name: "Pashupatinath Temple",
  category: "recommend",
  image: [
    "assets/images/homepageimg/PashupatinathTemple01.jpeg",
    "assets/images/homepageimg/PashupatinathTemple02.jpeg",
    "assets/images/homepageimg/PashupatinathTemple03.jpeg",
  ],
  location: "Kathmandu, Nepal",
  review: random.nextInt(300) + 25,
  price: 100,
  description: description,
  rate: 4.8,
),
 TravelDestination(
  id: 4, 
  name: "Phewa Lake, Pokhara", 
  category: "recommend",
  image: [
    "assets/images/homepageimg/Pokhara01.jpeg", 
    "assets/images/homepageimg/Pokhara02.jpeg",
    "assets/images/homepageimg/Pokhara03.jpeg",
    "assets/images/homepageimg/Pokhara04.jpeg",
  ],
  location: "Pokhara, Nepal",
  review: random.nextInt(300) + 25,
  price: 699, 
  description: description,
  rate: 4.8, 
),
];
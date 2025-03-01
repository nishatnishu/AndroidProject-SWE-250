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
    id: 1,
    name: "Mt. Everest",
    category: "popular",
    image: [
      "assets/images/popularPlace/Everest01.jpeg",
      "assets/images/popularPlace/Everest02.jpeg",
      "assets/images/popularPlace/Everest03.jpeg",
      "assets/images/popularPlace/Everest04.jpeg",
      "assets/images/popularPlace/Everest05.jpeg",
    ],
    location: "Sagarmatha, Nepal",
    review: random.nextInt(300) + 25,
    price: 999,
    description: description,
    rate: 4.9,
  ),
  TravelDestination(
    id: 2, 
    name: "Kathmandu Valley",
    category: "popular",
    image: [
      "assets/images/popularPlace/Kathmandu01.jpeg",
      "assets/images/popularPlace/Kathmandu02.jpeg",
      "assets/images/popularPlace/Kathmandu03.jpeg",
      "assets/images/popularPlace/Kathmandu04.jpeg",
      "assets/images/popularPlace/Kathmandu05.jpeg",
    ],
    location: "Kathmandu, Nepal",
    review: random.nextInt(300) + 25,
    price: 299,
    description: description,
    rate: 4.8,
  ),
  TravelDestination(
    id: 4, 
    name: "Pokhara",
    category: "popular",
    image: [
      "assets/images/popularPlace/Pokhara01.jpeg",
      "assets/images/popularPlace/Pokhara02.jpeg",
      "assets/images/popularPlace/Pokhara03.jpeg",
      "assets/images/popularPlace/Pokhara04.jpeg",
    ],
    location: "Pokhara, Nepal",
    review: random.nextInt(300) + 25,
    price: 699,
    description: description,
    rate: 4.8,
  ),
  TravelDestination(
    id: 3, 
    name: "Karnali River",
    category: "popular",
    image: [
      "assets/images/popularPlace/KarnaliRiver01.jpeg",
      "assets/images/popularPlace/KarnaliRiver02.jpeg",
      "assets/images/popularPlace/KarnaliRiver03.jpeg",
      "assets/images/popularPlace/KarnaliRiver04.jpeg",
    ],
    location: "Kailali, Nepal",
    review: random.nextInt(300) + 25,
    price: 199,
    description: description,
    rate: 4.7,
  ),
  TravelDestination(
  id: 7,
  name: "Bhaktapur",
  category: "recommend",
  image: [
    "assets/images/recommendedPlace/Bhaktapur01.jpg",
    "assets/images/recommendedPlace/Bhaktapur02.jpeg",
    "assets/images/recommendedPlace/Bhaktapur03.jpeg",
    "assets/images/recommendedPlace/Bhaktapur04.jpeg",
    "assets/images/recommendedPlace/Bhaktapur05.jpeg",
  ],
  location: "Bhaktapur, Nepal",
  review: random.nextInt(300) + 25,
  price: 150,
  description: description,
  rate: 4.6,
),

TravelDestination(
  id: 9,
  name: "Chitwan National Park",
  category: "recommend",
  image: [
    "assets/images/recommendedPlace/Chitwan01.jpeg",
    "assets/images/recommendedPlace/Chitwan02.jpeg",
    "assets/images/recommendedPlace/Chitwan03.jpeg",
    "assets/images/recommendedPlace/Chitwan04.jpeg",
  ],
  location: "Chitwan, Nepal",
  review: random.nextInt(300) + 25,
  price: 250,
  description: description,
  rate: 4.5,
),
TravelDestination(
  id: 8,
  name: "Annapurna",
  category: "recommend",
  image: [
    "assets/images/recommendedPlace/Annapurna01.jpeg",
    "assets/images/recommendedPlace/Annapurna02.jpeg",
    "assets/images/recommendedPlace/Annapurna03.jpeg",
  ],
  location: "Gandaki, Nepal",
  review: random.nextInt(300) + 25,
  price: 799,
  description: description,
  rate: 4.8,
),

  TravelDestination(
  id: 10,
  name: "Pashupatinath Temple",
  category: "recommend",
 image: [
  "assets/images/recommendedPlace/Pushpatinath01.jpeg",
  "assets/images/recommendedPlace/Pushpatinath02.jpeg",
  "assets/images/recommendedPlace/Pushpatinath03.jpg", 
],
  location: "Kathmandu, Nepal",
  review: random.nextInt(300) + 25,
  price: 100,
  description: description,
  rate: 4.7,
),


];
import 'dart:math';

Random random = Random();

class TravelDestination {
  final int id, price, review;
  final List<dynamic>? media; 
  final String name, description, category, location;
  final double rate;

  TravelDestination({
    required this.id,
    required this.name,
    required this.price,
    required this.review,
    required this.media, 
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
    media: [ 
      "assets/images/popularPlace/Everest01.jpeg",
      "assets/videos/EverestVideo.mp4", 
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
    media: [
  
      "assets/images/popularPlace/Kathmandu01.jpeg",
          "assets/videos/Kathmandu.mp4",
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
    id: 3, 
    name: "Pokhara",
    category: "popular",
    media: [
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
    id: 4,
    name: "Langtang Valley",
    category: "popular",
    media: [
      "assets/images/popularPlace/Langtang01.jpg",
            "assets/videos/Langtang.mp4", 
      "assets/images/popularPlace/Langtang02.jpg",
    ],
    location: "Rasuwa District, Nepal",
    review: random.nextInt(300) + 25,
    price: 450,
        description: description,
            rate: 4.7,
  ),
  TravelDestination(
    id: 5, 
    name: "Karnali River",
    category: "popular",
    media: [
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
    id: 6,
    name: "Lumbini",
    category: "popular",
    media: [
      "assets/images/WorldPeacePagoda.jpg",
      "assets/images/popularPlace/Lumbini01.jpg",
      "assets/images/popularPlace/Lumbini02.jpg",
      "assets/images/popularPlace/Lumbini03.jpg",
      "assets/images/popularPlace/Lumbini04.jpg",
    ],
    location: "Rupandehi District, Nepal",
    review: random.nextInt(300) + 25,
    price: 120,
        description: description,
            rate: 4.6,
  ),
  TravelDestination(
    id: 7,
    name: "Manaslu Circuit",
    category: "popular",
    media: [
      "assets/images/popularPlace/ManasluCircuit01.jpg",
      "assets/images/popularPlace/ManasluCircuit02.jpg",
      "assets/images/popularPlace/ManasluCircuit03.jpg",
    ],
    location: "Gorkha District, Nepal",
    review: random.nextInt(300) + 25,
    price: 750,
        description: description,
            rate: 4.8,
  ),

  

  //Recommended Places...
  TravelDestination(
  id: 9,
  name: "Bhaktapur",
  category: "recommend",
  media: [
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
  id: 10,
  name: "Annapurna",
  category: "recommend",
  media: [
    "assets/videos/Annapurna.mp4",
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
  id: 11,
  name: "Chitwan National Park",
  category: "recommend",
  media: [
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
  id: 19,  
  name: "Langtang Valley",
  category: "recommend", 
  media: [
    "assets/images/recommendedPlace/Langtang01.png",
    "assets/videos/Langtang.mp4",
    "assets/images/recommendedPlace/Langtang02.png",    
    "assets/images/recommendedPlace/Langtang03.png",    

  ],
  location: "Rasuwa District, Nepal",
  review: random.nextInt(300) + 25,
  price: 450,
  description: description,
  rate: 4.7,
),
  
TravelDestination(
  id: 13,
  name: "Upper Mustang",
  category: "recommend",
  media: [
    "assets/images/recommendedPlace/UpperMustang01.png",
    "assets/images/recommendedPlace/UpperMustang02.png",
    "assets/images/recommendedPlace/UpperMustang03.png",
  ],
  location: "Mustang District, Nepal",
  review: random.nextInt(300) + 25,
  price: 899,
  description: description,
  rate: 4.9,  
),

TravelDestination(
  id: 14,
  name: "Janakpur",
  category: "recommend",
  media: [
    "assets/images/recommendedPlace/Janakpur01.png",
    "assets/videos/Janakpur.mp4",
    "assets/images/recommendedPlace/Janakpur02.png",
    "assets/images/recommendedPlace/Janakpur03.png",
    
  ],
  location: "Dhanusa District, Nepal",
  review: random.nextInt(300) + 25,
  price: 180,
  description: description,
  rate: 4.6,
),

TravelDestination(
  id: 15,
  name: "Bardiya National Park",
  category: "recommend",
  media: [
    "assets/images/recommendedPlace/Bardiya01.png",
    "assets/images/recommendedPlace/Bardiya02.png",
    "assets/images/recommendedPlace/Bardiya03.png",
    "assets/images/recommendedPlace/Bardiya04.png",
  ],
  location: "Bardiya District, Nepal",
  review: random.nextInt(300) + 25,
  price: 300,
  description: description,
  rate: 4.5,
),
TravelDestination(
  id: 12,
  name: "Pashupatinath Temple",
  category: "recommend",
 media: [
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

TravelDestination(
  id: 16,
  name: "Ilam",
  category: "recommend",
  media: [
    "assets/images/recommendedPlace/Illam01.png",
    "assets/images/recommendedPlace/Illam02.png",
  ],
  location: "Ilam District, Nepal",
  review: random.nextInt(300) + 25,
  price: 220,
  description: description,
  rate: 4.4,
),

TravelDestination(
  id: 17,
  name: "Dharan",
  category: "recommend",
  media: [
    "assets/images/recommendedPlace/Dharan01.png",
    "assets/images/recommendedPlace/Dharan02.png",
  ],
  location: "Sunsari District, Nepal",
  review: random.nextInt(300) + 25,
  price: 170,
  description: description,
  rate: 4.3,
),

TravelDestination(
  id: 18,
  name: "Bandipur",
  category: "recommend",
  media: [
    "assets/images/recommendedPlace/Bandipur01.png",
    "assets/images/recommendedPlace/Bandipur02.png",
    "assets/images/recommendedPlace/Bandipur03.png",
  ],
  location: "Tanahun District, Nepal",
  review: random.nextInt(300) + 25,
  price: 200,
  description: description,
  rate: 4.4,
),


];
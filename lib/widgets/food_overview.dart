import 'package:flutter/material.dart';
import 'package:trek_mate/models/homePage_model.dart';

// Define FoodItem class within this file
class FoodItem {
  final String name;
  final String imageUrl;
  final String description;
  final double rating;
  final String priceRange;

  const FoodItem({
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.rating,
    required this.priceRange,
  });
}

class FoodOverview extends StatelessWidget {
  final TravelDestination destination;

  const FoodOverview({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    final foodItems = _getFoodItemsForDestination(destination.name);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Text(
            'Local Cuisine & Dining',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'Discover the authentic flavors of ${destination.name}',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[600],
                ),
          ),
          const SizedBox(height: 16),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: foodItems.length,
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              return _FoodCard(foodItem: foodItems[index]);
            },
          ),
        ],
      ),
    );
  }

  List<FoodItem> _getFoodItemsForDestination(String destinationName) {
    switch (destinationName) {
      case 'Mt. Everest':
        return [
          const FoodItem(
            name: 'Sherpa Stew',
            imageUrl: 'https://homepressurecooking.com/wp-content/uploads/2024/07/sherpa-stew-recipe-1721769827.jpg',
            description: 'Hearty potato and meat stew, traditional Sherpa dish',
            rating: 4.7,
            priceRange: '\$',
          ),
          const FoodItem(
            name: 'Dal Bhat (rice and lentil soup),',
            imageUrl: 'https://media.sublimetrails.com/uploads/media/blog/dal-bhat/Dal_Bhat_from_Nepal_curry_dhal_lentils_spinach_rice_yogurt.webp',
            description: 'Consists of rice, lentil soup, and vegetables. ',
            rating: 4.7,
            priceRange: '\$',
          ),
          const FoodItem(
            name: 'Tibetan Bread',
            imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/3/31/Balep_korkun%2C_the_Tibetan_bread%2C_photographed_in_Nepal%2C_December_1%2C_2023.jpg',
            description: 'Fried bread served with honey or jam',
            rating: 4.5,
            priceRange: '\$',
          ),
             
        ];
      case 'Kathmandu Valley':
        return [
          const FoodItem(
            name: 'Newari Khaja Set',
            imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTRGsCk2fPdmDgIe0K6qFMU1QjVQQUqBJPAA&s',
            description: 'Traditional Newari platter with various meats and beaten rice',
            rating: 4.8,
            priceRange: '\$\$',
          ),
             const FoodItem(
            name: 'Yomari Punhi',
            imageUrl: 'https://static1.squarespace.com/static/53ecd1bde4b0a6f9524254f8/t/675bdd6f2fda443f1ac0726e/1734073711928/Yomari-Punhi-Nepal-Festivals-shankerhotel_com_np.png?format=1500w',
            description: 'Yomari Punhi, celebrated on the full moon day of the month of Thinla in the Nepal Sambat calendar, is one of the most beloved festivals of the Newar community in Nepal. This festival, dedicated to gratitude for the harvest and prayers for prosperity, combines spirituality, tradition, and the delight of culinary art through the iconic dish, the Yomari.',
            rating: 4.9,
            priceRange: '\$\$',
          ),
           const FoodItem(
            name: 'Thukpa',
            imageUrl: 'https://junifoods.com/wp-content/uploads/2024/05/The-Best-Chicken-Thukpa-Tibetan-Noodle-Soup-%E0%A4%95%E0%A5%81%E0%A4%96%E0%A5%81%E0%A4%B0%E0%A4%BE%E0%A4%95%E0%A5%8B-%E0%A4%A5%E0%A5%81%E0%A4%95%E0%A5%8D%E0%A4%AA%E0%A4%BE--480x270.jpg',
            description: 'This is a Tibetan noodle soup that is a comforting and flavorful dish, especially during colder months. ',
            rating: 4.9,
            priceRange: '\$',
          ),
          
          const FoodItem(
            name: 'Momo',
            imageUrl: 'https://www.emilyluxton.co.uk/wp-content/uploads/2017/06/momo-800x533.jpg',
            description: 'Nepalese dumplings with various fillings',
            rating: 4.9,
            priceRange: '\$',
          ),
        ];
              case 'Pokhara':
        return [
          const FoodItem(
            name: 'Thakali Thali',
            imageUrl: 'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/12/23/1e/93.jpg',
            description: ' Named after the Thakali people, this set meal features rice, dal, vegetables, and a choice of meat (non-veg) or a vegetarian option (veg). Sel Roti: A traditional homemade, sweet, ring-shaped rice doughnut that is often enjoyed during festivals (veg).',
            rating: 4.6,
            priceRange: '\$\$',
          ),
          const FoodItem(
            name: 'Sel Roti',
            imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8pkE2_b7r_whQH7fCs6s8mBEq4zGzWEoAX2hfrvw2UhqGapbU1z55V756M1a8-gU_VSo&usqp=CAU',
            description: 'A traditional homemade, sweet, ring-shaped rice doughnut that is often enjoyed during festivals (veg).',
            rating: 4.5,
            priceRange: '\$',
          ),
          const FoodItem(
            name: 'Dhido',
            imageUrl: 'https://whatthenepal.com/wp-content/uploads/2024/01/dhindo.jpg',
            description: 'A traditional and wholesome meal made from buckwheat or millet flour, served with local vegetables or meat curries (veg/non-veg)',
            rating: 4.6,
            priceRange: '\$',
          ),
        ];
      case 'Lumbini':
        return [
          const FoodItem(
            name: 'Buddha Bowl',
            imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1sBmzrFAuFYzZgwZosQr0uRQsqBF9Xa5lUQ&s',
            description: 'Vegetarian meal with rice, lentils and seasonal vegetables',
            rating: 4.5,
            priceRange: '\$',
          ),
          const FoodItem(
            name: 'Terai Thali',
            imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXlTi8B6Zd9qCjGWi5P-q1KWIDxc1EBHmTOw&s',
            description: 'Flavorful flatland cuisine with fish curry and rice',
            rating: 4.3,
            priceRange: '\$',
          ),
        ];
      case 'Chitwan National Park':
        return [
          const FoodItem(
            name: 'Tharu Platter',
            imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQp3Qtm06GtIxO1bkUAGqmkafI-tRiTeTA5AQ&s',
            description: 'Indigenous Tharu cuisine with fish, pork and rice beer',
            rating: 4.7,
            priceRange: '\$\$',
          ),
          const FoodItem(
            name: 'Taas (spicy fried goat meat)',
            imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBFj0GpQDJFPTdiWO8DIkGP2kKfmmpaVcdGtzvcnRmwZgLnANqfa9ucy2BQyudCdxm3Gc&usqp=CAU',
            description: 'Freshly grilled meats with local spices',
            rating: 4.5,
            priceRange: '\$\$',
          ),
        ];
      case 'Annapurna':
        return [
          const FoodItem(
            name: 'Apple Pie',
            imageUrl: 'https://annabanana.co/wp-content/uploads/2019/11/Apple-Pie-25-500x375.jpg',
            description: 'Famous apple pies from local orchards',
            rating: 4.8,
            priceRange: '\$',
          ),
          const FoodItem(
            name: 'Thakali Thali',
            imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6zhRZ8UF8yJYUG1C2ATeGjQYHRgGiFwMxrQ&s',
            description: 'Traditional meal with buckwheat, potatoes and goat meat',
            rating: 4.7,
            priceRange: '\$\$',
          ),
        ];
      case 'Bhaktapur':
        return [
          const FoodItem(
            name: 'Juju Dhau',
            imageUrl: 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhljhoGLu-SeG7_MbewOcsgN1ao786EgCmI2Htqdy6AWVl01jMCVmp4Sbg_o3TnSMQl3qJKwRpWSL1Dg2AYtvA-XL5fjP3q51l2yHWmowJgFxcFLSbTXNHewa2brcMIBS1sFh_S7JrD0-Q/w1200-h630-p-k-no-nu/2008+-+sept-nov+%28Nepal%29+050.jpg',
            description: 'King of yogurts - sweet creamy yogurt in clay pots.Bhaktapur is famous for its unique and delicious Juju Dhau, a sweet and creamy yogurt, often served in traditional clay pots. Other popular dishes include Bara (black lentil pancakes) and local Kulfi, a rich milk popsicle. Visitors also enjoy Chatamari, a Newari pancake seasoned with spices, and Aalucha, a fast-food joint serving potato-based dishes. ',
            rating: 4.9,
            priceRange: '\$',
          ),
          const FoodItem(
            name: 'Chatamari',
            imageUrl: 'https://asianheritagetreks.com/wp-content/uploads/2023/06/chatamari-bhaktapur-food.jpg',
            description: 'A Newari pancake seasoned with spices.',
            rating: 4.5,
            priceRange: '\$',
          ),
        ];
      default:
        return [
          const FoodItem(
            name: 'Dal Bhat',
            imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0bt1Rh-Ha2r8q61My5PvUTAgbhfRLRc3F6g&s',
            description: 'Traditional Nepali meal with lentil soup and rice',
            rating: 4.6,
            priceRange: '\$',
          ),
          FoodItem(
            name: 'Newari Cuisine',
            imageUrl: 'https://www.visittnt.com/images/newari-food.jpg',
            description: 'The non-vegetarian dishes primarily constitute the buffalo along with minced meat whereas vegetarian dishes are appetizing. An interesting twist is that vegetarian dishes can be prepared as non-vegetarian meals by stuffing meat in them.',
            rating: 4.4,
            priceRange: '\$ - \$\$',
          ),
        ];
    }
  }
}

class _FoodCard extends StatelessWidget {
  final FoodItem foodItem;

  const _FoodCard({required this.foodItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: SizedBox(
              height: 180,
              width: double.infinity,
              child: Image.network(
                foodItem.imageUrl,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[200],
                    child: const Center(
                      child: Icon(Icons.fastfood, size: 50, color: Colors.grey),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      foodItem.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green[50],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            foodItem.rating.toString(),
                            style: TextStyle(
                              color: Colors.green[800],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Icon(
                            Icons.star,
                            color: Colors.green[800],
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  foodItem.description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Icon(
                      Icons.attach_money,
                      color: Colors.orange[600],
                      size: 18,
                    ),
                    Text(
                      foodItem.priceRange,
                      style: TextStyle(
                        color: Colors.orange[600],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
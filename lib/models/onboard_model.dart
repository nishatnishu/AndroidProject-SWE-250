class OnboardModel {
  String image;
  String name;
  String name1;
  String name2;

  OnboardModel({
    required this.image,
    required this.name,
    required this.name1,
    required this.name2,
  });
}

List<OnboardModel> onboarding = [
  OnboardModel(
    image: 'assets/images/nepal1.jpg',
    name: "Ring Ring!🔔",
    name1: "Nepal is calling...📞",
    name2: "Let's Explore?🏔",
  ),
  OnboardModel(
    image: 'assets/images/nepal2.jpg',
    name: "where ",
    name1: "        the Himalayas touch",
    name2: "              the sky!🏞",
  ),
  OnboardModel(
    image: 'assets/images/WorldPeacePagoda.jpg',
    name: 'Nepal—',
    name1: 'A Paradise on Earth 🌏',
    name2: "",
  ),
  OnboardModel(
    image: 'assets/images/nepal4.jpeg',
    name: '\n \n Trek.',
    name1: "                Explore.",
    name2: "                    Live:)",
  ),
];
import 'package:flutter/material.dart';
import 'package:trek_mate/models/homePage_model.dart';
import 'package:video_player/video_player.dart';

class PlaceDetailsPage extends StatefulWidget {
  final TravelDestination destination;

  const PlaceDetailsPage({super.key, required this.destination});

  @override
  _PlaceDetailsPageState createState() => _PlaceDetailsPageState();
}

class _PlaceDetailsPageState extends State<PlaceDetailsPage> {
  int _currentPageIndex = 0;
  final Map<int, VideoPlayerController> _videoControllers = {};
  final Map<int, bool> _isVideoInitialized = {};

  // Track the selected section
  String _selectedSection = "Overview";

  @override
  void dispose() {
    _videoControllers.values.forEach((controller) {
      controller.dispose();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300.0,
            floating: false,
            pinned: true,
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return FlexibleSpaceBar(
                  background: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(95),
                        ),
                        child: PageView.builder(
                          itemCount: widget.destination.media?.length ?? 0,
                          onPageChanged: (index) {
                            setState(() {
                              _currentPageIndex = index;
                            });
                          },
                          itemBuilder: (context, index) {
                            if (widget.destination.media![index].toString().endsWith('.mp4')) {
                              if (!_videoControllers.containsKey(index)) {
                                _videoControllers[index] =
                                    VideoPlayerController.asset(widget.destination.media![index]);

                                _videoControllers[index]!.initialize().then((_) {
                                  setState(() {
                                    _isVideoInitialized[index] = true;
                                    _videoControllers[index]!.play();
                                  });
                                });

                                _videoControllers[index]!.addListener(() {
                                  if (_videoControllers[index]!.value.hasError) {
                                    print("Video error: ${_videoControllers[index]!.value.errorDescription}");
                                  }
                                });
                              }

                              return _isVideoInitialized[index] == true
                                  ? GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (_videoControllers[index]!.value.isPlaying) {
                                            _videoControllers[index]!.pause();
                                          } else {
                                            _videoControllers[index]!.play();
                                          }
                                        });
                                      },
                                      child: AspectRatio(
                                        aspectRatio: _videoControllers[index]!.value.aspectRatio,
                                        child: VideoPlayer(_videoControllers[index]!),
                                      ),
                                    )
                                  : const Center(child: CircularProgressIndicator());
                            } else {
                              return Image.asset(
                                widget.destination.media![index],
                                fit: BoxFit.cover,
                              );
                            }
                          },
                        ),
                      ),
                      // Dot indicators
                      if (widget.destination.media != null && widget.destination.media!.length > 1)
                        Positioned(
                          bottom: 0, 
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              widget.destination.media!.length,
                              (index) => AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                width: _currentPageIndex == index ? 12 : 8,
                                height: _currentPageIndex == index ? 12 : 8,
                                margin: const EdgeInsets.symmetric(horizontal: 4),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _currentPageIndex == index 
                                      ? Colors.white 
                                      : Colors.white.withOpacity(0.5),
                                  border: _currentPageIndex == index
                                      ? Border.all(color: Colors.black, width: 1)
                                      : null,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
          // SliverList for the content below the app bar
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Horizontal Scrollable Icons
                      SizedBox(
                        height: 100,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              _buildSectionIcon(Icons.info, "Overview"),
                              _buildSectionIcon(Icons.map, "Map"),
                              _buildSectionIcon(Icons.hotel, "Stay"),
                              _buildSectionIcon(Icons.restaurant, "Food"),
                              _buildSectionIcon(Icons.landscape, "Adventures"),
                              _buildSectionIcon(Icons.people, "Culture"),
                              _buildSectionIcon(Icons.tips_and_updates, "Tips"),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Display the selected section
                      _buildSelectedSection(),
                    ],
                  ),
                );
              },
              childCount: 1, // Only one item in the list
            ),
          ),
        ],
      ),
    );
  }

  // Build the selected section based on _selectedSection
  Widget _buildSelectedSection() {
    switch (_selectedSection) {
      case "Overview":
        return _buildOverviewSection();
      case "Map":
        return _buildMapSection();
      case "Food":
        return _buildFoodSection();
      case "Adventures":
        return _buildAdventuresSection();
      case "Stay":
        return _buildStaySection();
      case "Culture":
        return _buildCultureSection();
      case "Tips":
        return _buildTipsSection();
      default:
        return Container(); // Default case
    }
  }

  // Overview section
  Widget _buildOverviewSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Overview",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          widget.destination.description,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  // Map section
  Widget _buildMapSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Map",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: 200,
          color: Colors.grey[300],
          child: Center(child: Text("Map Placeholder")),
        ),
      ],
    );
  }

  // Stay section
  Widget _buildStaySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Accommodation",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "Find the best hotels and lodges for your stay.",
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  // Food section
  Widget _buildFoodSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Food & Restaurants",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "Explore the best local cuisine and restaurants in the area.",
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  // Adventures section
  Widget _buildAdventuresSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Adventures",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "Experience thrilling adventures like trekking, rafting, and more.",
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  // Culture section
  Widget _buildCultureSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Culture & Local Experience",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "Learn about the local culture and traditions.",
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  // Tips section
  Widget _buildTipsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Travel Tips & Safety",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "Important tips and safety guidelines for travelers.",
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  // Build a section icon
  Widget _buildSectionIcon(IconData icon, String label) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedSection = label; // Update the selected section
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 30, color: _selectedSection == label ? Colors.blue : Colors.grey),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: _selectedSection == label ? Colors.blue : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
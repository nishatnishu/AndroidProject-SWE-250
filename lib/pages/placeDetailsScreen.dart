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
      appBar: AppBar(
        title: Text(widget.destination.name),
        backgroundColor: const Color.fromARGB(255, 213, 236, 237),
        elevation: 0,
        toolbarHeight: 30,
        titleTextStyle: const TextStyle(
          color: Color.fromARGB(255, 75, 72, 72),
          fontSize: 16,
          fontFamily: "Haloberry",
        ),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            child: PageView.builder(
              itemCount: widget.destination.media?.length ?? 0,
              onPageChanged: (index) {
                setState(() {
                  _currentPageIndex = index;
                });
              },
              itemBuilder: (context, index) {
                if (widget.destination.media![index].toString().endsWith('.mp4')) {
                  // Display video
                  if (!_videoControllers.containsKey(index)) {
                    // Initialize if not already initialized
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
                      ? GestureDetector( // Wrap with GestureDetector
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
          // Dots Indicator
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.destination.media?.length ?? 0,
                (index) => Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPageIndex == index ? Colors.blue : Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildCategoryIcon(Icons.info, "Overview"),
                  _buildCategoryIcon(Icons.map, "Map"),
                  _buildCategoryIcon(Icons.restaurant, "Food & Restaurants"),
                  _buildCategoryIcon(Icons.landscape, "Adventures"),
                  _buildCategoryIcon(Icons.hotel, "Accommodation"),
                  _buildCategoryIcon(Icons.people, "Culture & Local Experience"),
                  _buildCategoryIcon(Icons.tips_and_updates, "Travel Tips & Safety"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryIcon(IconData icon, String label) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {
          // navigation logic ...:)
        },
        borderRadius: BorderRadius.circular(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.blue),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
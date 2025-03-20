import 'package:flutter/material.dart';
import 'package:trek_mate/models/homePage_model.dart';
import 'package:video_player/video_player.dart';

class PopularPlace extends StatefulWidget {
  final TravelDestination destination;
  final VoidCallback onTap;

  const PopularPlace({
    super.key,
    required this.destination,
    required this.onTap,
  });

  @override
  _PopularPlaceState createState() => _PopularPlaceState();
}

class _PopularPlaceState extends State<PopularPlace> {
  VideoPlayerController? _controller;
  bool _isVideo = false;
  bool _isVideoInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeMedia();
  }

  void _initializeMedia() async {
    if (widget.destination.media != null && widget.destination.media!.isNotEmpty) {
      if (widget.destination.media![0].toString().endsWith('.mp4')) {
        _isVideo = true;
        _controller = VideoPlayerController.asset(widget.destination.media![0]);
        try {
          await _controller!.initialize();
          setState(() {
            _isVideoInitialized = true;
          });
        } catch (e) {
          print("Error initializing video: $e");
        }
      }
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 20,
            left: 20,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 5,
                  ),
                ],
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              height: 210,
              width: MediaQuery.of(context).size.width * 0.75,
              child: _isVideo
                  ? (_isVideoInitialized
                      ? AspectRatio(
                          aspectRatio: _controller!.value.aspectRatio,
                          child: VideoPlayer(_controller!),
                        )
                      : const Center(child: CircularProgressIndicator()))
                  : (widget.destination.media != null &&
                          widget.destination.media!.isNotEmpty
                      ? Image.asset(
                          widget.destination.media![0].toString(),
                          fit: BoxFit.cover,
                        )
                      : Container()),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.black.withOpacity(0.7),
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.destination.name,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Colors.white,
                            size: 18,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            widget.destination.location,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star_rounded,
                        size: 22,
                        color: Colors.amber[800],
                      ),
                      const SizedBox(width: 5),
                      Text(
                        widget.destination.rate.toStringAsFixed(1),
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
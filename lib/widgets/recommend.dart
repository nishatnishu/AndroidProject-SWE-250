import 'package:flutter/material.dart';
import 'package:trek_mate/models/homePage_model.dart';
import 'package:video_player/video_player.dart';

class RecommendedPlace extends StatefulWidget {
  final TravelDestination destination;
  final VoidCallback onTap;

  const RecommendedPlace({
    super.key,
    required this.destination,
    required this.onTap,
  });

  @override
  _RecommendedPlaceState createState() => _RecommendedPlaceState();
}

class _RecommendedPlaceState extends State<RecommendedPlace> {
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
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        child: Row(
          children: [
            SizedBox(
              height: 95,
              width: 110,
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
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.destination.name,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.black,
                        size: 16,
                      ),
                      Text(
                        widget.destination.location,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black.withOpacity(1),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 16,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        "${widget.destination.rate}",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        "(${widget.destination.review} reviews)",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black.withOpacity(0.9),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                const Spacer(),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "\$${widget.destination.price}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff035997),
                        ),
                      ),
                      TextSpan(
                        text: " /Person",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
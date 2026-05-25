import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class YoutubeEmbed extends StatelessWidget {
  final String videoId;
  const YoutubeEmbed({super.key, required this.videoId});

  @override
  Widget build(BuildContext context) {
    final thumbnail = 'assets/jelajahi_situs_sejarah.png';
    return GestureDetector(
      onTap: () async {
        final url = Uri.parse('https://youtu.be/$videoId');
        await launchUrl(url, mode: LaunchMode.externalApplication);
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(thumbnail, fit: BoxFit.cover),
          ),
          const Center(
            child: Icon(Icons.play_circle_fill, size: 72, color: Colors.white70),
          ),
        ],
      ),
    );
  }
}

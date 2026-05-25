// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class YoutubeEmbed extends StatelessWidget {
  final String videoId;
  const YoutubeEmbed({super.key, required this.videoId});

  @override
  Widget build(BuildContext context) {
    final viewId = 'youtube-embed-$videoId';

    // Register the IFrame only once per viewId
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(viewId, (int viewId) {
      final iframe = html.IFrameElement()
        ..width = '100%'
        ..height = '100%'
        ..src = 'https://www.youtube.com/embed/$videoId?rel=0&modestbranding=1'
        ..style.border = '0'
        ..allow = 'autoplay; fullscreen; picture-in-picture';
      return iframe;
    });

    return HtmlElementView(viewType: viewId);
  }
}

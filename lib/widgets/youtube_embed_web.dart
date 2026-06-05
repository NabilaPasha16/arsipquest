// ignore: avoid_web_libraries_in_flutter, deprecated_member_use
import 'dart:html' as html;
import 'dart:ui_web' as ui_web;

import 'package:flutter/material.dart';

class YoutubeEmbed extends StatelessWidget {
  final String videoId;
  const YoutubeEmbed({super.key, required this.videoId});

  @override
  Widget build(BuildContext context) {
    final viewId = 'youtube-embed-$videoId';

    // Register the IFrame only once per viewId
    // ignore: undefined_prefixed_name
    ui_web.platformViewRegistry.registerViewFactory(viewId, (int viewId) {
      final iframe = html.IFrameElement()
        ..width = '100%'
        ..height = '100%'
        ..src =
            'https://www.youtube.com/embed/$videoId?rel=0&modestbranding=1&autoplay=1&mute=1&playsinline=1&enablejsapi=1'
        ..style.border = '0'
        ..allow =
            'autoplay; fullscreen; picture-in-picture; encrypted-media; accelerometer; gyroscope; clipboard-write'
        ..allowFullscreen = true;
      iframe.setAttribute('loading', 'eager');
      return iframe;
    });

    return HtmlElementView(viewType: viewId);
  }
}

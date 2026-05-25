// Conditional export: web implementation if HTML is available, otherwise stub.
export 'youtube_embed_stub.dart'
    if (dart.library.html) 'youtube_embed_web.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageViewer extends StatelessWidget {
  final String url;
  const ImageViewer({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: PhotoView(
        imageProvider: CachedNetworkImageProvider(url),
      ),
    );
  }
}

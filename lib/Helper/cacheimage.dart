import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

Widget networkImageError(BuildContext context,String networkImages,String assetimages){


  return  CachedNetworkImage(
    imageUrl: "${networkImages}",

    errorWidget: (context, url, error) => Image.asset('${assetimages}'),
  );

}
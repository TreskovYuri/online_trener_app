
import 'package:flutter/widgets.dart';
import 'package:trener_app/constants/images.dart';

class MyPlaceHolderImage extends StatelessWidget {
  const MyPlaceHolderImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppImages.placeholderImage);
  }
}
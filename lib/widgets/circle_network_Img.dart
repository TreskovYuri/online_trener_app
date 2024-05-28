
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MyCircleNetworkImg extends StatelessWidget {
  MyCircleNetworkImg({super.key, required this.width, required this.height, this.radius = 5, required this.url});
  double width;
  double height;
  double radius;
  String url;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Container(
        width: width,
        height: height,
        child: Image.network('${dotenv.env['STATIC_URL']}/$url', fit: BoxFit.cover,),
      ),
    );
  }
}
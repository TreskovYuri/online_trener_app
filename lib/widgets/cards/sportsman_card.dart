import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trener_app/constants/colors.dart';
import 'package:trener_app/constants/voids.dart';
import 'package:trener_app/widgets/buttons/my_card_button.dart';
import 'package:trener_app/widgets/circle_network_Img.dart';
import 'package:trener_app/widgets/text/description.dart';

class MyUserCard extends StatelessWidget {
  MyUserCard({
    super.key,
    required this.user,
    this.select = false,
    this.callback = AppVoids.MyDefaultButtonCallback
  });
  Map<String, dynamic> user;
  bool select;
  VoidCallback callback;


  @override
  Widget build(BuildContext context) {
    final vw = MediaQuery.of(context).size.width / 100;
    return MyCardButton(
        callback: callback,
        widget: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (user['img'] != '')
                  MyCircleNetworkImg(width: 50, height: 50, url: user['img']),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 60 * vw,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyDescriptionText(text: user['name']),
                      const SizedBox(
                        height: 5,
                      ),
                      MyDescriptionText(
                          text: user['date'], size: 13, opacity: .7),
                    ],
                  ),
                ),
                if(select)Expanded(child: SvgPicture.asset('assets/img/blue_ok.svg'))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                  decoration: BoxDecoration(
                      color: AppColors.blackThemeBacground,
                      borderRadius: BorderRadius.circular(100)),
                  child: MyDescriptionText(text: user['post'], size: 14),
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                  decoration: BoxDecoration(
                      color: AppColors.blackThemeBacground,
                      borderRadius: BorderRadius.circular(100)),
                  child: MyDescriptionText(text: user['team'], size: 14),
                ),
              ],
            )
          ],
        ));
    ;
  }
}

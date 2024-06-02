import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyscleGroupsImage extends StatelessWidget {
  const MyscleGroupsImage({super.key,
      required this.vh,
      required this.muscleGroups});
  final double vh;
  final List muscleGroups;

  @override
  Widget build(BuildContext context) {
    return  Container(
          height: 35 * vh,
          child: Stack(
            children: [
              SvgPicture.asset(
                'assets/img/frame.svg',
              ),
              muscleGroups.contains('Пресс')
                  ? SvgPicture.asset(
                      'assets/img/frame_press.svg',
                    )
                  : const SizedBox.shrink(),
              muscleGroups.contains('Шея')
                  ? SvgPicture.asset(
                      'assets/img/frame_shea.svg',
                    )
                  : const SizedBox.shrink(),
              muscleGroups.contains('Ноги')
                  ? SvgPicture.asset(
                      'assets/img/frame_nogi.svg',
                    )
                  : const SizedBox.shrink(),
              muscleGroups.contains('Икры')
                  ? SvgPicture.asset(
                      'assets/img/frame_ikri.svg',
                    )
                  : const SizedBox.shrink(),
              muscleGroups.contains('Руки')
                  ? SvgPicture.asset(
                      'assets/img/frame_ruki.svg',
                    )
                  : const SizedBox.shrink(),
              muscleGroups.contains('Плечи')
                  ? SvgPicture.asset(
                      'assets/img/frame_plechi.svg',
                    )
                  : const SizedBox.shrink(),
              muscleGroups.contains('Грудь')
                  ? SvgPicture.asset(
                      'assets/img/frame_grud.svg',
                    )
                  : const SizedBox.shrink(),
              muscleGroups.contains('Бицепс')
                  ? SvgPicture.asset(
                      'assets/img/frame_biceps.svg',
                    )
                  : const SizedBox.shrink(),
              muscleGroups.contains('Трицепс')
                  ? SvgPicture.asset(
                      'assets/img/frame_tricebs.svg',
                    )
                  : const SizedBox.shrink(),
              muscleGroups.contains('Спина')
                  ? SvgPicture.asset(
                      'assets/img/frame_spina.svg',
                    )
                  : const SizedBox.shrink(),
              muscleGroups.contains('Бедра')
                  ? SvgPicture.asset(
                      'assets/img/frame_bedra.svg',
                    )
                  : const SizedBox.shrink(),
              muscleGroups.contains('Голень')
                  ? SvgPicture.asset(
                      'assets/img/frame_golen.svg',
                    )
                  : const SizedBox.shrink(),
              muscleGroups.contains('Предплечье')
                  ? SvgPicture.asset(
                      'assets/img/frame_plechi.svg',
                    )
                  : const SizedBox.shrink(),
              muscleGroups.contains('Кисти')
                  ? SvgPicture.asset(
                      'assets/img/frame_kisti.svg',
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        );
  }
}
import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:trener_app/models/constants/colors.dart';
import 'package:trener_app/widgets/text/title.dart';
import 'package:video_player/video_player.dart';

class MyVideoPlayer extends StatefulWidget {
  MyVideoPlayer({super.key, required this.url});
  String url;

  @override
  State<MyVideoPlayer> createState() => _MyVideoPlayerState();
}

class _MyVideoPlayerState extends State<MyVideoPlayer> {
  bool inicialize= false;
  late CustomVideoPlayerController _customVideoPlayerController;

  @override
  void initState() {
    initializeVideoPlayer();
    super.initState();
  }

  @override
  void dispose() {
    _customVideoPlayerController.dispose();
    super.dispose();
  }

  void initializeVideoPlayer(){
    VideoPlayerController   _videoPlayerController;
    _videoPlayerController = VideoPlayerController.network(widget.url)..initialize().then((_) => setState(() {inicialize=true;}));
    _customVideoPlayerController = CustomVideoPlayerController(context: context, videoPlayerController: _videoPlayerController);
  }

  @override
  Widget build(BuildContext context) {
    if(widget.url == ''){
      return Container();
    }
    if (_customVideoPlayerController != null && inicialize) {
      
      return Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: CustomVideoPlayer(customVideoPlayerController: _customVideoPlayerController),
      );
    } else {
      return AspectRatio(
        aspectRatio: 16/9,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.blackThemeInputInlineBacground,
            borderRadius: BorderRadius.circular(10),
          ),
          child: MyTitleText(text: 'Загрузка...',color: AppColors.blackThemeTextOpacity1,size: 15),
          alignment: Alignment.center,
        ),
      );
    }
  }
}

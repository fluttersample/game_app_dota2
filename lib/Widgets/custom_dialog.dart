import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CustomDialog extends StatefulWidget {
  final String videoUrl;
  const CustomDialog({Key? key,
  required this.videoUrl}) : super(key: key);

  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late Animation<double> scaleAnimation;
  late VideoPlayerController _vwController;

  bool _isPlaying = false;
  @override
  void initState() {

    _vwController = VideoPlayerController.asset(widget.videoUrl,)
    ..initialize().then((value) {
      setState(() {

      });
    })..addListener(() {
        final bool isPlaying = _vwController.value.isPlaying;
        if (isPlaying != _isPlaying) {
          setState(() {
            _isPlaying = isPlaying;
          });
        }
      });
    controller = AnimationController(vsync: this,
    duration: const Duration(milliseconds: 500));
    scaleAnimation = Tween(
      begin: 0.0,
      end: 1.0
    ).animate(controller);
    controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,

        child: ScaleTransition(
          scale:  scaleAnimation,
          child: _vwController.value.isInitialized
              ? Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.white,
                ),
              borderRadius: BorderRadius.circular(30)
            ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: AspectRatio(
                   aspectRatio: 16/12,
                    child: Stack(
                      children: [
                        VideoPlayer(_vwController),
                        Visibility(
                          visible: !_vwController.value.isPlaying,
                          child: Center(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _vwController.play();
                                });
                              } ,
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle),
                                margin: const EdgeInsets.only(right: 8),
                                child: const Icon(
                                  Icons.play_arrow_sharp,
                                  color: Colors.black,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 10,
                          top: 10,
                          child: InkWell(
                            onTap: () {
                             Navigator.of(context).pop();
                            } ,
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle),
                              child: const Icon(
                                Icons.close,
                                color: Colors.black,
                                size: 15,
                              ),
                            ),
                          ),
                        )


                      ],
                    ),
          ),
                ),
              )
              : Container()
          ),
        ),
      );
  }
  @override
  void dispose() {
    _vwController.dispose();
    controller.dispose();
    super.dispose();
  }


}

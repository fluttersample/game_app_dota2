import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tss/Screens/Home.dart';

class SliverAppBarWidget extends StatelessWidget {
  final double expandedHeight;
  final bool floating;
  final bool snap;

  final SystemUiOverlayStyle overlayStyle;
  final bool autoLeading;
  final Color bgColor;
  final FlexibleSpaceBar? flexibleSpace;
  final bool pinned;
  final double toolbarHeight;
  final PreferredSize? bottom;
  SliverAppBarWidget(
      {this.expandedHeight = 270,
      this.floating = false,
      this.snap = false,
      this.pinned = false,
      this.overlayStyle = SystemUiOverlayStyle.light,
      this.autoLeading = false,
      this.bgColor = const Color.fromARGB(21, 21, 21, 1),
      this.toolbarHeight =0.0,
      this.bottom,
       this.flexibleSpace})
      : super();

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: expandedHeight,
      floating: floating,
      toolbarHeight: toolbarHeight,
      snap: snap,
      primary: false,
      pinned: pinned,
      bottom: bottom,
      systemOverlayStyle: overlayStyle,
      automaticallyImplyLeading: autoLeading,
      backgroundColor: bgColor,
      flexibleSpace: flexibleSpace,
    );
  }
}

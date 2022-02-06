import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tss/Models/ItemBanner.dart';
import 'package:tss/Screens/Detail.dart';
import 'package:tss/Widgets/Sliver_appbar.dart';
import 'package:tss/Widgets/custom_dialog.dart';
class HomeSc extends StatefulWidget {
  const HomeSc({Key? key}) : super(key: key);

  @override
  _HomeScState createState() => _HomeScState();
}

class _HomeScState extends State<HomeSc> {
  int currentIndex = 0;


  final List<DataItems> _listProposed = [
    DataItems(
        urlImageDetail: 'assets/abilities/hus_ab_',
        name: 'Huskar',
        url: 'assets/images/img_1.jpg',
        title: "Huskar draws upon his health to break an enemy's life'",
        desc: 'Cast Range: 550'),
    DataItems(
        urlImageDetail: 'assets/abilities/drow_ab_',
        name: 'Drow Ranger',
        url: 'assets/images/img_2.jpg',
        title: "the Drow Ranger, is a ranged agility hero",
        desc: 'Movement Speed Slow: 15% / 30% / 45% / 60%'),
    DataItems(
        urlImageDetail: 'assets/abilities/sven_ab_',
        name: 'Sven',
        url: 'assets/images/img_3.jpg',
        title: "Sven is the bastard son of a Vigil Knight",
        desc: 'Attack Type : Mele 🪓'),
    DataItems(
        urlImageDetail: 'assets/abilities/troll_ab_',
        name: 'Troll',
        url: 'assets/images/img_4.jpg',
        title: "Troll unleashes a powerful battle trance",
        desc: 'Bonus Move Speed: 15 / 25 / 35 / 45'),
    DataItems(
        urlImageDetail: 'assets/abilities/lion_ab_',
        name: 'Lion',
        url: 'assets/images/img_6.jpg',
        title: "Lion Grandmaster of the Demon Witch ",
        desc: 'Applies a hex on target,  base movement speed to 120'),
  ];

  final List<DataItems> _listItems = [
    DataItems(url: 'assets/images/bn_jugger.jpg', title: 'Juggernaut'),
    DataItems(
      url: 'assets/images/bn_earth.jpg',
      title: 'EarthShaker',
    ),
    DataItems(
      url: 'assets/images/bn_nix.jpg',
      title: 'Nyx Assassin',
    ),
    DataItems(
      url: 'assets/images/bn_lycan.jpg',
      title: 'Lycan',
    ),
    DataItems(
      url: 'assets/images/bn_invoker.jpg',
      title: 'Invoker',
    ),
    DataItems(
      url: 'assets/images/bn_monkey.jpg',
      title: 'Monkey King',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor.fromHex('151515'),
      body: Stack(
        children: [
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              _buildBanner(),
              _buildSearchBar(),
              _buildTitles(title: 'Hero',subTitle: 'View All'),
              _buildHeroes(),
              const SliverPadding(
                padding: EdgeInsets.only(bottom: 15),
              ),
              _buildTitles(
                title: 'Suggestion' ,
                subTitle: 'View All',
                  ),

              proposedWidget(),
              SliverToBoxAdapter(
                child: Container(
                  height: 80,
                ),
              )
            ],
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5,sigmaY: 5),
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(25),
                      bottomLeft: Radius.circular(25),
                      topLeft: Radius.circular(10),
                      topRight:  Radius.circular(10),
                    ),
                      color: Colors.grey.withOpacity(0.1),

                ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0)+
                    const EdgeInsets.only(right: 30,left: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Icon(Icons.video_collection_rounded,
                                color: Colors.grey[700]),
                            Text("Tutorial",
                            style: TextStyle(
                                color: Colors.grey[700]
                            ),),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: 35,
                              width: 35,
                              decoration: const BoxDecoration(

                               boxShadow: [
                                 BoxShadow(
                                   blurRadius: 30,
                                   offset: Offset( 0,-1 ),
                                   color: Colors.white

                                 )
                               ]
                              ),
                              child: Image.asset(
                                'assets/images/ic_youtube.png',
                                color: Colors.white,
                              ),
                            ),
                            const Text("Stream",
                            style: TextStyle(
                              color: Colors.white
                            ),),

                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.tv,
                            color: Colors.grey[700],),
                            Text("Match",
                            style: TextStyle(
                              color: Colors.grey[700]
                            ),),
                          ],
                        ),
                      ],
                    ),
                  ),

                ),

              ),
            ),
          )
        ],
      ),

    );
  }


  SliverPadding proposedWidget() {
    return SliverPadding(
      padding: const EdgeInsets.only(right: 8, left: 8),
      sliver: SliverFixedExtentList(
        itemExtent: 140,
        delegate: SliverChildListDelegate(_listProposed.map((item) {
          var index = _listProposed.indexOf(item);
          return GestureDetector(
            onTap: () =>  Navigator.of(context).push(
                MaterialPageRoute(builder: (context) =>
                    DetailSc(index: index,
                    imgUrl: item.url!,
                    text: item.name!,
                    urlDetail :item.urlImageDetail!))),
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    height: 110,
                    decoration: BoxDecoration(
                        color: index == 0
                            ? Colors.purple.withOpacity(0.3)
                            : index == 1
                                ? Colors.blue.withOpacity(0.3)
                                : index == 2
                                    ? Colors.white.withOpacity(0.3)
                                    : index ==3 ?Colors.red.withOpacity(0.3) :
                        index == 4? Colors.redAccent.shade100 :
                        index==5? Colors.white.withOpacity(0.7):Colors.red,
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
                Positioned(
                    top: 12,
                    left: 12,
                    child: Hero(
                      tag: index,
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                                color:
                                    Theme.of(context).primaryColor.withOpacity(0.3),
                                width: 8),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  item.url!,
                                ))),
                      ),
                    )),
                Positioned(
                    bottom: 0,
                    left: 5,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.only(left: 120),
                      height: 95,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.title!,
                            style: GoogleFonts.averiaLibre(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            item.desc!,
                            style: GoogleFonts.zillaSlab(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ))
              ],
            ),
          );
        }).toList()),
      ),
    );
  }


 SliverToBoxAdapter _buildHeroes()
  {
    return  SliverToBoxAdapter(
      child: SizedBox(
          height: 250,
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 8, right: 8),
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (_, index) {
              return InkWell(
                onTap: () {
                  showDialog(context: context,
                      builder: (context) =>  CustomDialog(
                        videoUrl: index==0?'assets/images/video_juger.webm' :
                        'assets/images/video_cl.webm',
                      ),);
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 15),
                  child: FadeInRight(
                    child: Stack(children: [
                      ClipPath(
                        clipper: MyClipper(),
                        child: Container(
                          alignment: Alignment.center,
                          color: index == 0
                              ? Colors.red
                              : index == 1
                              ? Colors.orange
                              : index == 3
                              ? Colors.deepPurpleAccent
                              : Colors.blue,
                          child: Container(
                              margin: const EdgeInsets.only(left: 15),
                              child: Image.asset(
                                index == 0
                                    ? "assets/images/juger.png"
                                    : index == 1
                                    ? "assets/images/clinkz.png"
                                    : index == 2
                                    ? "assets/images/zeus.png"
                                    : "assets/images/face.png",
                                fit: BoxFit.fitHeight,
                                height: 200,
                                width: 200,
                              )),
                          width: 180,
                          height: 280,
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle),
                          margin: const EdgeInsets.only(right: 8),
                          child: const Icon(
                            Icons.play_arrow_sharp,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            alignment: Alignment.bottomLeft,
                            margin: const EdgeInsets.only(bottom: 12, left: 15),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(bottom: 5),
                                  child: Text(
                                    index == 0
                                        ? "Juggernaut"
                                        : index == 1
                                        ? "Clinks"
                                        : index == 2
                                        ? "Zeus"
                                        : "FaceLace Void",
                                    style: GoogleFonts.aBeeZee(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                  "33k View",
                                  style: GoogleFonts.lato(
                                      color: Colors.white),
                                )
                              ],
                            ),
                          ))
                    ]),
                  ),
                ),
              );
            },
          )),
    );
  }

  SliverToBoxAdapter _buildTitles({required String title,
    required String subTitle})
  {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: GoogleFonts.yuseiMagic(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
            ),
            Text(
              subTitle,
              style: GoogleFonts.yuseiMagic(
                  fontSize: 14,
                  color: Colors.white
              ),
            ),
          ],
        ),
      ),
    );
  }

  SliverAppBarWidget _buildBanner(){
   return SliverAppBarWidget(
     floating: false,
     expandedHeight: 270,
     overlayStyle: SystemUiOverlayStyle.light,
     autoLeading: false,
     bgColor: HexColor.fromHex('151515'),
     flexibleSpace: FlexibleSpaceBar(
       background: CarouselSlider.builder(
         itemCount: _listItems.length,
         itemBuilder: (context, index, realIndex) => Image.asset(
           _listItems[index].url!,
           fit: BoxFit.cover,
         ),
         options: CarouselOptions(
             height: 270,
             onPageChanged: (index, reason) {
               setState(() {
                 currentIndex = index;
               });
             },
             autoPlay: true,
             autoPlayInterval: const Duration(seconds: 3),
             reverse: false,
             viewportFraction: 1),
       ),

       title: Text(
         _listItems[currentIndex].title!,
         style: GoogleFonts.akronim(color: Colors.red,
             fontSize: 30),
       ),
     ),
   );
  }
  SliverAppBarWidget _buildSearchBar(){
   return  SliverAppBarWidget(
     pinned: true,
     expandedHeight: 0,
     bgColor: HexColor.fromHex('151515'),
     autoLeading:  false,


     bottom: PreferredSize(
       preferredSize: const Size(double.infinity,
           95),
       child: FadeInDown(
         duration: const Duration(
             milliseconds: 700
         ),
         child: Padding(
           padding: const EdgeInsets.all(8.0) +
               const EdgeInsets.only(bottom: 15),
           child: Container(
             height: 35,

             decoration: BoxDecoration(
                 boxShadow: [
                   BoxShadow(
                     blurRadius: 10,
                     offset: const Offset(0,-1),
                     color: Colors.indigo.withOpacity(0.50),

                   )
                 ],
                 gradient: LinearGradient(
                     begin: Alignment.bottomCenter,
                     end: Alignment.topCenter,

                     colors: [
                       Colors.grey.shade900,
                       Colors.indigo.shade400,
                     ]

                 ),
                 borderRadius: BorderRadius.circular(30)
             ),
             margin: const EdgeInsets.only(right: 12,left: 12,),
             child: TextField(
               decoration: InputDecoration(
                   hintText: 'Search You Hero ...',
                   contentPadding: const EdgeInsets.only(top: 5,
                       left: 15),
                   hintStyle: const TextStyle(
                       color: Colors.white
                   ),
                   suffixIcon: const Icon(Icons.search,
                     color: Colors.white,),
                   filled: true,
                   border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(30)
                   )
               ),
             ),
           ),
         ),
       ),
     ),
     // bottom: PreferredSize(
     //   preferredSize: Size(double.infinity, 60),
     //   child: Padding(
     //     padding: EdgeInsets.symmetric(vertical: 16),
     //     child: Container(
     //       margin: const EdgeInsets.only(top: 5, right: 25, left: 25),
     //       height: 55,
     //       decoration: const BoxDecoration(
     //           color: Colors.white38,
     //           borderRadius: BorderRadius.all(Radius.circular(35))),
     //       child: TabBar(
     //         // physics: const AlwaysScrollableScrollPhysics(),
     //         indicator: BoxDecoration(
     //           borderRadius: BorderRadius.circular(
     //             25.0,
     //           ),
     //           color: Color(0xffd6bc53),
     //
     //         ),
     //         padding: const EdgeInsets.all(6),
     //         unselectedLabelStyle: const TextStyle(fontSize: 15),
     //         tabs: const [
     //           Tab(
     //               icon: Text(
     //             "All Hero",
     //           )),
     //           Tab(
     //               icon: Text(
     //             "Popular",
     //           )),
     //         ],
     //       ),
     //     ),
     //   ),
     // ),
   );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 20);
    path.quadraticBezierTo(0.0, size.height, 20.0, size.height);
    path.lineTo(size.width - 20.0, size.height);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - 20);
    path.lineTo(size.width, 50.0);
    path.quadraticBezierTo(size.width, 30.0, size.width - 20.0, 30.0);
    path.lineTo(20.0, 5.0);
    path.quadraticBezierTo(0.0, 0.0, 0.0, 20.0);
    return path;

  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

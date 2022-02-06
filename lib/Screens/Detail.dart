import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tss/Models/ItemDetail.dart';
import 'package:tss/Widgets/Sliver_appbar.dart';

import 'Home.dart';

class DetailSc extends StatefulWidget {
  final String imgUrl;
  final num index ;
  final String text;
  final String urlDetail;
  const DetailSc({Key? key,
  required this.index,required this.imgUrl,
    required this.text,  required this.urlDetail}) : super(key: key);

  @override
  _DetailScState createState() => _DetailScState();
}

class _DetailScState extends State<DetailSc> with TickerProviderStateMixin  {
  late AnimationController animProgressStrength , animProgressAgility;
  late Animation<double> animValueStrength , animValueAgility;
  late DetailData dataHero;

  final List<DetailData> _listData=[
    DetailData(
      urlImage: 'assets/abilities/hus_ab_',
      nameAbilities: {
        '1' : 'Inner Fire',
        '2' : 'Burning Spear',
        '3' : 'Berserkers Blood',
        '4' : 'Life Break'
      },
      powerStrength: 21,
      powerAgility: 13,
      valueProgressStrength: 0.7,
      valueProgressAgility: 0.4

    ),
    DetailData(
        urlImage: 'assets/abilities/drow_ab_',
        nameAbilities: {
          '1' : 'Frost Arrows',
          '2' : 'Gust',
          '3' : 'MultiShot',
          '4' : 'MarksManShip'
        },
        powerStrength: 18,
        powerAgility: 20,
       valueProgressAgility: 0.9,
      valueProgressStrength: 0.5

    ),
    DetailData(
        urlImage: 'assets/abilities/sven_ab_',
        nameAbilities: {
          '1' : 'Storm Hummer',
          '2' : 'Great Cleave',
          '3' : 'WarCry',
          '4' : 'God Strength'
        },
        powerStrength: 22,
        powerAgility: 21,
      valueProgressStrength: 0.7,
      valueProgressAgility: 0.2
    ),
    DetailData(
        urlImage: 'assets/abilities/troll_ab_',
        nameAbilities: {
          '1' : 'BerSerKer Rage',
          '2' : 'Whirling Axes (R)',
          '3' : 'Whirling Axes (M)',
          '4' : 'Battle Trance'
        },
        powerStrength: 21,
        powerAgility: 21,
        valueProgressStrength: 0.4,
      valueProgressAgility: 0.9

    ),
    DetailData(
        urlImage: 'assets/abilities/lion_ab_',
        nameAbilities: {
          '1' : 'Earth Spike',
          '2' : 'Hex',
          '3' : 'Mana Drain',
          '4' : 'Finger Of Death'
        },
        powerStrength: 18,
        powerAgility: 18,
      valueProgressStrength: 0.3,
      valueProgressAgility: 0.2
    ),
  ];

  @override
  void initState() {
    super.initState();
    dataHero = _listData[widget.index.toInt()];
    animProgressStrength=AnimationController(vsync: this,
    duration: const Duration(
      seconds: 1
    ),
    );
    animValueStrength= _tween(dataHero.valueProgressStrength!.toDouble(),
        animProgressStrength);


    animProgressAgility = AnimationController(vsync: this,
        duration: const Duration(
            seconds: 1
        ),
    );


    animValueAgility = _tween(dataHero.valueProgressAgility!.toDouble(),
        animProgressAgility);
    animProgressAgility.forward();
    animProgressStrength.forward();

  }
  Animation<double> _tween (double end,AnimationController controller){
    return Tween(
      begin: 0.0,end: end
    ).animate(controller)..addListener(() {
      setState(() {

      });
    });
  }
  @override
  void dispose() {
    super.dispose();
    animProgressStrength.dispose();
    animProgressAgility.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  HexColor.fromHex('151515'),
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.black
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBarWidget(
            toolbarHeight: 300,

            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.only(
                left: 15
              ),
              background: Hero(
                tag: widget.index,
                  child: Image.asset(widget.imgUrl,
                  fit: BoxFit.cover,)),
              title: Text(widget.text,
              style: GoogleFonts.akronim(
                fontSize: 80
              ),),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(top: 30,
              left: 20,
              right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  const Text("Hero Skills",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),),
                 const SizedBox(
                   height: 15,
                 ),
                 SizedBox(
                   height: 140,
                   child: GridView.builder(
                     physics: const NeverScrollableScrollPhysics(),
                     itemCount: 4,
                     gridDelegate:
                   const SliverGridDelegateWithFixedCrossAxisCount(
                       crossAxisCount: 4,
                     mainAxisSpacing: 8,
                     crossAxisSpacing: 8,
                     childAspectRatio: 3/8

                   ),
                       itemBuilder: (context, index) {
                       var data = _listData[widget.index.toInt()];


                         return Column(
                           crossAxisAlignment: CrossAxisAlignment.center,
                           mainAxisSize: MainAxisSize.min,
                           children: [
                             FadeInUp(
                               child: Container(
                                 height: 100,
                                 decoration: BoxDecoration(
                                   shape: BoxShape.circle,
                                   border: Border.all(
                                     color: Theme.of(context).primaryColor.withOpacity(0.2),
                                   width: 5,),
                                   image: DecorationImage(
                                     image: AssetImage(
                                         widget.urlDetail+(index+1).toString()+'.png')
                                   )
                                 ),

                               ),
                             ),
                             const SizedBox(
                               height: 15,
                             ),
                             Text(data.nameAbilities!['${index+1}'].toString(),
                             maxLines: 1,
                             textAlign: TextAlign.center,
                             style: const TextStyle(
                               color: Colors.white,
                               shadows:[
                                 Shadow(
                                   offset: Offset(0,-2),
                                   blurRadius: 20.0,
                                   color: Colors.white,
                                 ),
                               ]

                             ),)
                           ],
                         );
                       },),
                 )
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child:
            Container(
              margin: const EdgeInsets.only(top: 30,
                  left: 20,
                  right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Stats',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            right: 8
                          ),
                          child: Image.asset('assets/images/ic_strength.png',
                          height: 28,
                          color: Colors.deepOrangeAccent,),
                        ),
                        const Text('Strength',
                        style: TextStyle(
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              color: Colors.white,
                              offset: Offset(0,-2),
                              blurRadius: 20
                            )
                          ]
                        ),),
                        const SizedBox(width: 4,),
                        Text(dataHero.powerStrength.toString(),
                        style: const TextStyle(
                           color: Colors.deepOrange
                        ),),
                        const Text(
                          '  at 25 (23+2.2/level)',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey
                          ),
                        ),


                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                   SizedBox(
                    width: double.infinity,
                    height: 10,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),

                      child: LinearProgressIndicator(
                        value: animValueStrength.value,
                        valueColor: const AlwaysStoppedAnimation<Color>(Colors.deepOrangeAccent),
                        backgroundColor: Colors.brown.withOpacity(0.6),
                      ),
                    ),
                  ),


                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              right: 8
                          ),
                          child: Image.asset('assets/images/ic_agility.png',
                            height: 28,
                            color: Colors.green,),
                        ),
                        const Text('Agility',
                          style: TextStyle(
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                    color: Colors.white,
                                    offset: Offset(0,-2),
                                    blurRadius: 20
                                )
                              ]
                          ),),
                        const SizedBox(width: 4,),
                        Text(dataHero.powerAgility.toString(),
                          style: const TextStyle(
                              color: Colors.greenAccent
                          ),),
                        const Text(
                          '  at 25 (36+2.9/level)',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey
                          ),
                        ),


                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 10,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),

                      child: LinearProgressIndicator(
                        value: animValueAgility.value,
                        valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
                        backgroundColor: Colors.brown.withOpacity(0.6),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),


        ],
      ),
    );
  }

}



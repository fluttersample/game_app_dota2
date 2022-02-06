
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tss/screens/Home.dart';

class OnBoardingSc extends StatefulWidget {
  const OnBoardingSc({Key? key}) : super(key: key);

  @override
  State<OnBoardingSc> createState() => _OnBoardingScState();
}

class _OnBoardingScState extends State<OnBoardingSc> with SingleTickerProviderStateMixin{

  late AnimationController _animController;
  late Animation<double> _animation;

  @override
  void initState() {

    _animController = AnimationController(vsync: this,
    duration: const Duration(
      milliseconds: 1300,
    ),
    value: 0.0);
    _animation = Tween(
      begin: 0.0,
      end: 1.0
    ).animate(_animController);
    _animController.forward();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: Stack(
        fit: StackFit.expand,
        children: [
          FadeTransition(
            opacity: _animation,
            child: Image.asset('assets/images/head_juger.jpg',
            fit: BoxFit.fitHeight,
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            left: 20,
            height: 45,
            child: FadeInUp(
              child: ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomeSc(),));
                  },
                  child: Text('Get Start',
                    style: GoogleFonts.lato(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 16
                        )

                 )),
            ),
          )
        ],
      ),

    );
  }
}

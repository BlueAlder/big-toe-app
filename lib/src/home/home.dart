import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../setup/setup-game.view.dart';
import '../shared/styles.dart';

import 'drawer/draw-options.widget.dart';
import 'menu-button.widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  // TODO refactor this into the Style class
  final mainTitleStyle = GoogleFonts.corben(
    fontSize: 70,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  // TODO refactor this into the Style class
  final buttonStyle = GoogleFonts.arimo(
    fontSize: 30,
  );

  late AnimationController rotationController = AnimationController(
      duration: const Duration(milliseconds: 100), vsync: this)
    ..addListener(() async {
      if (rotationController.isCompleted) {
        await Future.delayed(const Duration(milliseconds: 200));
        rotationController.reverse();
      } else if (rotationController.isDismissed) {
        await Future.delayed(const Duration(milliseconds: 200));
        rotationController.forward();
      }
    })
    ..forward();

  handleNewGame() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const GameSetupPage();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Align(
                // alignment: Alignment.topCenter,
                heightFactor: 2,
                child: RotationTransition(
                    child: Image.asset(
                      "assets/images/star.png",
                      height: 200,
                      alignment: Alignment.topCenter,
                    ),
                    turns: Tween(begin: -0.01, end: 0.01).animate(
                      rotationController,
                    ))),
            const MenuButton(),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Big Toe", style: mainTitleStyle),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: handleNewGame,
                    child: Styles.getElevatedButtonChild("New Game"),
                    style: Styles.getElevatedButtonStyle(),
                  )
                ],
              ),
            )
          ],
        ),
        drawer: const Drawer(
            backgroundColor: Colors.deepOrange, child: DrawerOptions()));
  }
}

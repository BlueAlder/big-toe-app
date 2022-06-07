import 'package:big_toe_mobile/add-prompt/add-prompt.view.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import '../setup/setup.dart';
import '../shared/styles.dart' as styles;

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

class _MyHomePageState extends State<MyHomePage> {
  final mainTitleStyle = GoogleFonts.corben(
    fontSize: 70,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  final buttonStyle = GoogleFonts.arimo(
    fontSize: 30,
  );

  handleNewGame(context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return GameSetupPage();
    }));
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            const MenuButton(),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Big Toe", style: mainTitleStyle),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () => handleNewGame(context),
                    child: styles.getElevatedButtonChild("New Game"),
                    style: styles.getElevatedButtonStyle(),
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

class MenuButton extends StatelessWidget {
  const MenuButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(25),
      child: IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: const Icon(
            Icons.menu,
            size: 40,
          )),
    );
  }
}

class DrawerOptions extends StatelessWidget {
  const DrawerOptions({Key? key}) : super(key: key);

  handleAddPrompt(context) {
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return AddPromptView();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50),
        Image.asset(
          'assets/icons/launcher.png',
          height: 150,
        ),
        Text("Big Toe", style: styles.getHeadingStyle()),
        const Divider(thickness: 2, indent: 20, endIndent: 20),
        ListTile(
            leading: Icon(Icons.add),
            onTap: () => handleAddPrompt(context),
            title:
                Text("Add some prompts", style: styles.getRegularTextStyle()))
      ],
    );
  }
}

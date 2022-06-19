import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../add-prompt/add-prompt.view.dart';
import '../services/auth.service.dart';
import '../shared/styles.dart';

class DrawerOptions extends StatelessWidget {
  DrawerOptions({Key? key}) : super(key: key);
  final _authService = GetIt.I.get<AuthService>();

  handleAddPrompt(context) {
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const AddPromptView();
    }));
  }

  handleLogin() {
    _authService.signInWithGoogle();
  }

  handleLogout() {
    _authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50),
        Image.asset(
          'assets/icons/launcher.png',
          height: 150,
        ),
        Text("Big Toe", style: Styles.getHeadingStyle()),
        const Divider(thickness: 2, indent: 20, endIndent: 20),
        _authService.isLoggedIn
            ? ListTile(
                leading: const Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                onTap: () => handleLogout(),
                title: Text("Logout", style: Styles.getRegularTextStyle()))
            : ListTile(
                leading: const Icon(
                  Icons.login,
                  color: Colors.white,
                ),
                onTap: () => handleLogin(),
                title: Text("Login", style: Styles.getRegularTextStyle())),
        ListTile(
            leading: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            onTap: () => handleAddPrompt(context),
            title:
                Text("Add some prompts", style: Styles.getRegularTextStyle()))
      ],
    );
  }
}

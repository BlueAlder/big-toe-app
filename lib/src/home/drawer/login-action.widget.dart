import 'package:big_toe_mobile/src/login/login.page.dart';
import 'package:flutter/material.dart';

import 'package:big_toe_mobile/src/services/auth.service.dart';
import 'package:get_it/get_it.dart';

import '../../shared/styles.dart';

class LoginAction extends StatefulWidget {
  const LoginAction({Key? key}) : super(key: key);

  @override
  State<LoginAction> createState() => _LoginActionState();
}

class _LoginActionState extends State<LoginAction> {
  final _authService = GetIt.I.get<AuthService>();

  Future<void> handleLogin() async {
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const LoginPage();
    }));
    // await _authService.signInWithGoogle();
    // setState(() {});
  }

  void showLogoutConfirmation() {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
                title: const Text("Are you sure you want to sign out?"),
                // content: Text(
                //     "You didn't add any placeholder \$NAMEs you sure you wanna submit this?\n\n $prompt"),
                actionsAlignment: MainAxisAlignment.spaceAround,
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text("Oh s*** no"),
                  ),
                  TextButton(
                    onPressed: () async {
                      await _authService.signOut();
                      setState(() {});
                      Navigator.pop(context);
                    },
                    child: const Text("Yes!"),
                  ),
                ]));
  }

  Future<void> handleLogout() async {
    showLogoutConfirmation();
  }

  @override
  Widget build(BuildContext context) {
    return _authService.isLoggedIn
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
            title:
                Text("Login or Signup", style: Styles.getRegularTextStyle()));
  }
}

import 'package:big_toe_mobile/src/services/notification.service.dart';
import 'package:big_toe_mobile/src/shared/styles.dart';
import 'package:big_toe_mobile/src/shared/widgets/back-button.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:get_it/get_it.dart';

import '../services/auth.service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _authService = GetIt.I.get<AuthService>();
  final _notificationService = GetIt.I.get<NotificationService>();
  bool loading = false;

  Future<void> handleLoginWithGoogle() async {
    try {
      setState(() {
        loading = true;
      });
      await _authService.signInWithGoogle();
      _notificationService.showSnackBarMessage(
          "Successfully signed in!", context);
      Navigator.pop(context);
    } catch (e) {
      _notificationService.showSnackBarMessage(
          "There was an error signing you in.", context);
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade300,
      body: Stack(children: [
        const SpacedBackButton(),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Sign In!",
                style: Styles.getHeadingStyle(),
              ),
              if (loading)
                const CircularProgressIndicator()
              else ...[
                SignInButton(Buttons.Google, onPressed: handleLoginWithGoogle),
                const Divider(),
                SignInButton(Buttons.AppleDark, onPressed: () {}),
                const Divider(),
                SignInButton(Buttons.FacebookNew, onPressed: () {})
              ]
            ],
          ),
        ),
      ]),
    );
  }
}

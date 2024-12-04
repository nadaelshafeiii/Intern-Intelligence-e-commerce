import 'package:ecommerce_app/auth/presentation/pages/login_page.dart';
import 'package:ecommerce_app/auth/presentation/pages/register_page.dart';
import 'package:flutter/material.dart';


class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage = true;

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(
        togglepages: togglePages,
      );
    } else {
      return RegisterPage(
        togglepages: togglePages,

      );
    }
  }
}

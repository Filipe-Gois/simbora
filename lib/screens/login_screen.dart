import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:simbora/utils.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainContainer(
        child: SingleChildScrollView(
          padding:
              const EdgeInsets.only(left: 24, right: 24, top: 51, bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/logo-vertical-png.png"),
              SizedBox(
                width: double.infinity,
                child: LoginForm(),
              ),
              const SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  text: "Não tem uma conta ?",
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                  children: [
                    const TextSpan(text: " "),
                    TextSpan(
                      text: "Criar conta",
                      style: TextStyle(
                        color: ColorsApp.blue,
                        fontStyle: FontStyle.italic,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w700,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(context, '/SignupScreen');
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

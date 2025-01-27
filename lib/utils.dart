import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:simbora/enums.dart';

class ColorsApp {
  static final Color orange = Color(0xFFEE7526);
  static final Color yellow = Color(0xFFF2AD22);
  static final Color blue = Color(0xFF5B64AC);
}

class ContainerGradient extends StatelessWidget {
  // final Widget child;

  const ContainerGradient({super.key});
  // const ContainerGradient({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [ColorsApp.orange, ColorsApp.yellow],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      // child: child,
    );
  }
}

class MainContainer extends StatelessWidget {
  final Widget child;

  const MainContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ContainerGradient(),
        Positioned(
          top: -46,
          left: 253,
          child: BubbleBlue(),
        ),
        Positioned(
          top: 681,
          left: -39,
          child: BubbleBlue(),
        ),
        Padding(
          padding: const EdgeInsets.all(40.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 40,
                sigmaY: 40,
              ),
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                ),
                child: Container(
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class BubbleBlue extends StatelessWidget {
  const BubbleBlue({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: ColorsApp.blue,
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}

class Input extends StatefulWidget {
  const Input({super.key});

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: [
            Colors.white.withValues(alpha: .6),
            Colors.white.withValues(alpha: 0.2),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: TextFormField(
        cursorColor: Colors.black,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "E-mail:",
          hintStyle: TextStyle(color: Colors.black),
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const Button({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(ColorsApp.blue),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

class SocialAuthButton extends StatelessWidget {
  final VoidCallback onPressed;
  final SocialAuthType socialAuthType;

  const SocialAuthButton(
      {super.key,
      required this.onPressed,
      this.socialAuthType = SocialAuthType.google});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            Colors.white.withValues(alpha: .6),
            Colors.white.withValues(alpha: 0.2),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.transparent),
          elevation: WidgetStateProperty.all(0),
        ),
        child: Row(
          spacing: 10,
          children: [
            socialAuthType == SocialAuthType.google
                ? Image.asset("assets/images/google.png", width: 24)
                : Icon(
                    Icons.facebook,
                    color: ColorsApp.blue,
                    size: 24,
                  ),
            Text(
              socialAuthType == SocialAuthType.facebook ? "Facebook" : "Google",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.black,
                fontSize: 14,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Login",
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 24,
            ),
            textAlign: TextAlign.start,
          ),
          Text(
            "Insira seus dados",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
            textAlign: TextAlign.start,
          ),
          VerticalSpacer(height: 10),
          Input(),
          VerticalSpacer(),
          Input(),
          VerticalSpacer(),
          Button(
            onPressed: () {},
            text: "Entrar",
          ),
          VerticalSpacer(),
          Row(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
              ),
              Text(
                "ou",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Expanded(
                child: Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
              ),
            ],
          ),
          VerticalSpacer(),
          SocialAuthButton(
              onPressed: () {}, socialAuthType: SocialAuthType.facebook),
          VerticalSpacer(height: 20),
          SocialAuthButton(onPressed: () {})
        ],
      ),
    );
  }
}

class VerticalSpacer extends StatelessWidget {
  final double? height;
  const VerticalSpacer({super.key, this.height = 20});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}

class HorizontalSpacer extends StatelessWidget {
  final double? width;
  const HorizontalSpacer({super.key, this.width = 20});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width);
  }
}

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Cadastre-se",
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 24,
            ),
            textAlign: TextAlign.start,
          ),
          Text(
            "Insira seus dados",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
            textAlign: TextAlign.start,
          ),
          VerticalSpacer(height: 10),
          Input(),
          VerticalSpacer(),
          Input(),
          VerticalSpacer(),
          Input(),
          VerticalSpacer(),
          Input(),
          VerticalSpacer(),
          Button(
            onPressed: () {},
            text: "Cadastrar",
          ),
          VerticalSpacer(),
          Row(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
              ),
              Text(
                "ou",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Expanded(
                child: Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
              ),
            ],
          ),
          VerticalSpacer(),
          SocialAuthButton(
              onPressed: () {}, socialAuthType: SocialAuthType.facebook),
          VerticalSpacer(height: 20),
          SocialAuthButton(onPressed: () {})
        ],
      ),
    );
  }
}

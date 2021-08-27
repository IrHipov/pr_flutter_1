import 'package:flutter/material.dart';
import 'package:pr_flutter_1/res/colors.dart';
import 'package:pr_flutter_1/services/validator.dart';
import 'package:pr_flutter_1/widgets/button_widget.dart';
import 'package:pr_flutter_1/widgets/input_widget.dart';
import 'package:pr_flutter_1/widgets/logo_widget.dart';
import 'package:pr_flutter_1/widgets/title_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key) ;

  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  static const double _SPACE_GAP = 32;
  static const double _BIG_SPACE_GAP = 48;

  final _formKey = GlobalKey<FormState>();

  void logIn(context) {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Data ok')),
      );
    }
  }

  void forgotPassword() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Form(
        autovalidateMode: AutovalidateMode.always,
        key: _formKey,
        child: ListView(
          children: [
            Center(
              child: Logo(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 64),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTitle("Log In"),
                  SizedBox(height: _SPACE_GAP),
                  InputWidget("Email",  validator: CustomValidator.emailValidator),
                  SizedBox(height: _SPACE_GAP),
                  InputWidget("Password", validator: CustomValidator.passValidator),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(left: 16),
                    child: TextButton(
                        onPressed: forgotPassword,
                        child: Text(
                          "Forgot password?",
                          style: TextStyle(
                              fontSize: 16, color: AppColors.whiteGrey),
                        )),
                  ),
                  SizedBox(height: _BIG_SPACE_GAP),
                  ButtonWidget("Log In", () => {logIn(context)}),
                  SizedBox(height: _SPACE_GAP),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(fontSize: 18),
                      ),
                      TextButton(
                          onPressed: () =>
                              {Navigator.pushReplacementNamed(context, '/register')},
                          child: Text(
                            "Sing Up!",
                            style: TextStyle(
                                fontSize: 18, color: AppColors.mainColor),
                          )),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}

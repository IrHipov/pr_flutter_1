import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pr_flutter_1/res/colors.dart';
import 'package:pr_flutter_1/services/validator.dart';
import 'package:pr_flutter_1/widgets/button_widget.dart';
import 'package:pr_flutter_1/widgets/input_widget.dart';
import 'package:pr_flutter_1/widgets/logo_widget.dart';
import 'package:pr_flutter_1/widgets/title_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return RegisterPageState();
  }
}

class RegisterPageState extends State<RegisterPage> {
  static const double _SPACE_GAP = 32;
  static const double _BIG_SPACE_GAP = 48;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();

  void singUp(context) {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Data ok')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Form(
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
                  CustomTitle("Sing Up"),
                  SizedBox(height: _SPACE_GAP),
                  InputWidget("Full Name",
                      validator: CustomValidator.nameValidator),
                  SizedBox(height: _SPACE_GAP),
                  InputWidget("Your Email",
                      validator: CustomValidator.emailValidator),
                  SizedBox(height: _SPACE_GAP),
                  InputWidget("Create Password",
                      validator: CustomValidator.passValidator,
                      controller: _pass),
                  SizedBox(height: _SPACE_GAP),
                  InputWidget("Confirm Password",
                      validator: CustomValidator.passValidator,
                      fieldConfirmValidator:
                          CustomValidator.fieldMatchValidator,
                      confirmField: _pass.text),
                  SizedBox(height: _BIG_SPACE_GAP),
                  ButtonWidget("Sing Up", () => {singUp(context)}),
                  SizedBox(height: _SPACE_GAP),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(fontSize: 18),
                      ),
                      TextButton(
                          onPressed: () => {
                                Navigator.pushReplacementNamed(
                                    context, '/login')
                              },
                          child: Text(
                            "Log In!",
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

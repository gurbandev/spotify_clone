import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/common/widgets/appBar/app_bar.dart';
import 'package:spotify/common/widgets/button/basic_button.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/data/models/auth/signin_user_req.dart';
import 'package:spotify/domain/usecases/auth/signin.dart';
import 'package:spotify/presentation/auth/pages/signup.dart';
import 'package:spotify/presentation/home/pages/home.dart';
import 'package:spotify/service_locator.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});

  final TextEditingController _emailFieldController = TextEditingController();
  final TextEditingController _passwordFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _signupText(context),
      appBar: BasicAppBar(
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _signinText(),
              const SizedBox(height: 50),
              _userNameOrEmailField(context),
              const SizedBox(height: 20),
              _passwordField(context),
              const SizedBox(height: 20),
              BasicButton(onPressed: () async {
                var result = await sl<SigninUseCase>().call(
                  params: SigninUserReq(email: _emailFieldController.text.toString(), password: _passwordFieldController.text.toString())
                );
                result.fold((l) {
                  print(l);
                  var snackBar = SnackBar(
                    content: Text(l),
                    behavior: SnackBarBehavior.floating,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }, (r) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                          const HomePage()),
                          (route) => false);
                });
              }, title: 'Create Account')
            ],
          ),
        ),
      ),
    );
  }

  Text _signinText() {
    return const Text(
      'Sign in',
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }

  Widget _userNameOrEmailField(BuildContext context) {
    return TextField(
      controller: _emailFieldController,
      decoration: const InputDecoration(hintText: "Enter Username Or Email")
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      controller: _passwordFieldController,
      decoration: const InputDecoration(hintText: "Password")
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _signupText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Not A Member?',
            style: TextStyle(
                color: context.isDarkMode
                    ? const Color(0xff383838)
                    : const Color(0xff383838),
                fontWeight: FontWeight.bold),
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => SignupPage()));
              },
              child: const Text('Register Now',
                  style: TextStyle(
                      color: Color(0xff288CE9), fontWeight: FontWeight.bold)))
        ],
      ),
    );
  }
}

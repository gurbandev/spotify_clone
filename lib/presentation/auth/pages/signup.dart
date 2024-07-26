import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/common/widgets/appBar/app_bar.dart';
import 'package:spotify/common/widgets/button/basic_button.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/data/models/auth/create_user_req.dart';
import 'package:spotify/domain/usecases/auth/signup.dart';
import 'package:spotify/presentation/auth/pages/signin.dart';
import 'package:spotify/presentation/home/pages/home.dart';
import 'package:spotify/service_locator.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final TextEditingController _fullNameFieldController =
      TextEditingController();
  final TextEditingController _emailFieldController = TextEditingController();
  final TextEditingController _passwordFieldController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _signinText(context),
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
              _registerText(),
              const SizedBox(height: 50),
              _fullNameField(context),
              const SizedBox(height: 20),
              _emailField(context),
              const SizedBox(height: 20),
              _passwordField(context),
              const SizedBox(height: 20),
              BasicButton(
                  onPressed: () async {
                    var result = await sl<SignupUseCase>().call(
                        params: CreateUserReq(
                            fullName: _fullNameFieldController.text.toString(),
                            password: _passwordFieldController.text.toString(),
                            email: _emailFieldController.text.toString()));
                    result.fold((l) {
                      var snackBar = SnackBar(
                        content: Text(l),
                        backgroundColor: context.isDarkMode
                            ? AppColors.darkBackground
                            : AppColors.lightBackground,
                        closeIconColor:
                            context.isDarkMode ? Colors.white : Colors.black,
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
                  },
                  title: 'Create Account')
            ],
          ),
        ),
      ),
    );
  }

  Text _registerText() {
    return const Text(
      'Register',
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }

  Widget _fullNameField(BuildContext context) {
    return TextField(
      controller: _fullNameFieldController,
      decoration: const InputDecoration(hintText: "Full Name")
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      controller: _emailFieldController,
      decoration: const InputDecoration(hintText: "Enter Email")
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

  Widget _signinText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Do You Have An Account?',
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
                        builder: (BuildContext context) => SigninPage()));
              },
              child: const Text('Sign in',
                  style: TextStyle(
                      color: Color(0xff288CE9), fontWeight: FontWeight.bold)))
        ],
      ),
    );
  }
}

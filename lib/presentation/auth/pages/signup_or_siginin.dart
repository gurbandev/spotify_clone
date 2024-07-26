import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/common/widgets/appBar/app_bar.dart';
import 'package:spotify/common/widgets/button/basic_button.dart';
import 'package:spotify/core/configs/assets/app_images.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/presentation/auth/pages/signin.dart';
import 'package:spotify/presentation/auth/pages/signup.dart';
import 'package:spotify/presentation/home/pages/home.dart';

class SignupOrSigninPage extends StatelessWidget {
  const SignupOrSigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BasicAppBar(),
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(AppVectors.topPattern),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(AppVectors.bottomPattern),
          ),
          Align(
              alignment: Alignment.bottomLeft,
              child: Image.asset(AppImages.authBG)),
          Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppVectors.logo, height: 70),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 10),
                      child: Text('Enjoy Listening To Music',
                          style: TextStyle(
                              color: context.isDarkMode
                                  ? const Color(0xffF2F2F2)
                                  : const Color(0xff383838),
                              fontWeight: FontWeight.bold,
                              fontSize: 26)),
                    ),
                    Text(
                      'Spotify is a proprietary Swedish audio streaming and media services provider ',
                      style: TextStyle(
                          color: context.isDarkMode
                              ? const Color(0xffA0A0A0)
                              : const Color(0xff797979),
                          fontWeight: FontWeight.w400,
                          fontSize: 17),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: BasicButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      HomePage(), // TODO  should be after SignupPage()
                                ),
                              );
                            },
                            title: "Register",
                            // fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          flex: 1,
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            SigninPage()));
                              },
                              child: Text(
                                'Sign in',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19,
                                    color: context.isDarkMode
                                        ? Colors.white
                                        : const Color(0xff313131)),
                              )),
                        )
                      ],
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

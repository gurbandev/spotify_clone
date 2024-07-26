import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/common/widgets/button/basic_button.dart';
import 'package:spotify/core/configs/assets/app_images.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/presentation/choose_mode/pages/choose_mode.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
                vertical: 40,
                horizontal: 40
            ),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill, image: AssetImage(AppImages.introBG))),
          ),
          Container(
            color: Colors.black.withOpacity(0.15),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 40,
                  horizontal: 40
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: SvgPicture.asset(AppVectors.logo),
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      const Text(
                          'Enjoy Listening To Music',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffDADADA))),
                      const SizedBox(height: 15),
                      const Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sagittis enim purus sed phasellus. Cursus ornare id scelerisque aliquam.',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: AppColors.grey),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 45),
                        child: BasicButton(onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (
                                      BuildContext context) => const ChooseModePage()
                              )
                          );
                        }, title: "Get started"),
                      )
                    ],
                  )
                ],
              )
          )
        ],
      ),
    );
  }
}

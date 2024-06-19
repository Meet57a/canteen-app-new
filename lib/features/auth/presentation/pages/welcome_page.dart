import 'package:flutter/material.dart';
import '../../../../core/theme/color_pallete.dart';
import '../../../../core/util/image_strings.dart';
import '../../../../core/widget/big_text.dart';
import '../../../../core/widget/eleve_button.dart';
import '../../../../core/widget/small_text.dart';
import 'login_page.dart';
import 'register_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.asset(
                ImagePath.welcomePageIamge,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const BigText(
                    text: "Welcome Back",
                  ),
                  const SmallText(
                      textOverflow: TextOverflow.visible,
                      text:
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ut dolor lacus. Nunc eu mauris vitae justo vestibulum faucibus lobortis eu eros."),
                  const SizedBox(height: 90),
                  ElevatedButtonCustom(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    },
                    borderColor: AppColorPallete.primaryColor,
                    isBorderOn: true,
                    color: AppColorPallete.whiteColor,
                    child: const SmallText(
                      text: "Login",
                      color: AppColorPallete.primaryColor,
                      size: 15,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButtonCustom(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterPage()));
                    },
                    color: AppColorPallete.primaryColor,
                    child: const BigText(
                      text: "Sign Up",
                      color: AppColorPallete.whiteColor,
                      size: 15,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../core/extensions/app_colors_extension.dart';
import '../../core/extensions/app_text_styles_extension.dart';
import '../../core/extensions/size_extension.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenShortestSide = context.screenShortestSide;
    final screenWidth = context.screenWidth;

    return Scaffold(
      backgroundColor: context.colors.black,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: screenShortestSide * .5,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/lanche.png'),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: context.percentHeight(.1)),
            child: SizedBox(
              width: screenShortestSide * .5,
              child: Image.asset('assets/images/logo.png'),
            ),
          ),
          Align(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: context.percentWidth(screenWidth < 1300 ? .7 : .3),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FractionallySizedBox(
                        widthFactor: .3,
                        child: Image.asset('assets/images/logo.png'),
                      ),
                      const SizedBox(height: 20),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          'Login',
                          style: context.textStyles.textTitle,
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'e-Mail'),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Senha'),
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('Entrar'),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

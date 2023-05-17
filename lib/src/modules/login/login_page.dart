import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:validatorless/validatorless.dart';

import '../../core/enums/login_state_enum.dart';
import '../../core/extensions/app_colors_extension.dart';
import '../../core/extensions/app_text_styles_extension.dart';
import '../../core/extensions/size_extension.dart';
import '../../core/helpers/loader_mixin.dart';
import '../../core/helpers/message_mixin.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with LoaderMixin, MessageMixin {
  final controller = Modular.get<LoginController>();

  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  final _emailFN = FocusNode();

  late final ReactionDisposer statusReactionDisposer;

  @override
  void initState() {
    statusReactionDisposer = reaction(
      (_) => controller.loginState,
      (status) {
        switch (status) {
          case LoginStateEnum.initial:
            break;
          case LoginStateEnum.loading:
            showLoader();
            break;
          case LoginStateEnum.success:
            hideLoader();
            Modular.to.navigate('/');
            break;
          case LoginStateEnum.error:
            hideLoader();
            showError(controller.errorMessage ?? 'Erro ao realizar o login.');
            _emailFN.requestFocus();
            break;
        }
      },
    );

    super.initState();
  }

  @override
  void dispose() {
    _emailEC.dispose();
    _emailFN.dispose();
    _passwordEC.dispose();

    statusReactionDisposer();

    super.dispose();
  }

  void _formSubmit() {
    final formValid = _formKey.currentState?.validate() ?? false;

    if (formValid) {
      controller.login(_emailEC.text, _passwordEC.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenShortestSide = context.screenShortestSide;
    final screenWidth = context.screenWidth;

    return Scaffold(
      backgroundColor: context.colors.black,
      body: Form(
        key: _formKey,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: screenShortestSide * .5,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/lanche.png'),
                    fit: BoxFit.cover,
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
                          autofocus: true,
                          controller: _emailEC,
                          focusNode: _emailFN,
                          decoration: const InputDecoration(labelText: 'e-Mail'),
                          validator: Validatorless.multiple([
                            Validatorless.required('e-Mail é obrigatório'),
                            Validatorless.email('e-Mail inválido')
                          ]),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _passwordEC,
                          obscureText: true,
                          onFieldSubmitted: (_) => _formSubmit(),
                          decoration: const InputDecoration(labelText: 'Senha'),
                          validator: Validatorless.required('Senha é obrigatória'),
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: _formSubmit,
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
      ),
    );
  }
}

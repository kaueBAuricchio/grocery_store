import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_store/src/config/custom_colors.dart';
import 'package:grocery_store/src/routes/app_pages.dart';
import '../common_widgets/custom_text_field.dart';

class SignInScreen extends StatelessWidget {
   SignInScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //App Name
                    Text.rich(
                      TextSpan(style: const TextStyle(fontSize: 40), children: [
                        const TextSpan(
                            text: 'Grocery',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300)),
                        TextSpan(
                          text: 'store',
                          style: TextStyle(
                              color: CustomColors.customContrastColor,
                              fontWeight: FontWeight.w600),
                        ),
                      ]),
                    ),
                    SizedBox(
                      height: 30,
                      child: DefaultTextStyle(
                        style: const TextStyle(fontSize: 25),
                        child: AnimatedTextKit(
                          repeatForever: true,
                          pause: Duration.zero,
                          animatedTexts: [
                            FadeAnimatedText('Frutas'),
                            FadeAnimatedText('Verduras'),
                            FadeAnimatedText('Legumes'),
                            FadeAnimatedText('Carnes'),
                            FadeAnimatedText('Cereais'),
                            FadeAnimatedText('Laticinios'),
                            FadeAnimatedText('Guloseimas'),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              //Form
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 32,
                  horizontal: 40,
                ),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(45))),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      //TextField Email
                      CustomTextField(
                        controller: emailController,
                        icon: Icons.email_sharp,
                        label: 'Email',
                        keyBoardType: TextInputType.emailAddress,
                        validation: (email) {
                          if (email == null || email.isEmpty) return 'Digite seu email';
                          if(!email.isEmail) return 'Digite seu email';
                          return null;
                        },
                      ),
                      //TextField Password
                       CustomTextField(
                          controller: passController,
                          icon: Icons.lock,
                           label: 'Senha',
                           obscurePass: true,
                           validation: (pass){
                            if (pass == null || pass.isEmpty) return 'Digite sua senha';
                            if (pass.length < 7) return 'Digite uma senha com pelos 7 digitos';
                            return null;
                            },
                       ),
                      //Button Entry
                      SizedBox(
                        height: 50,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18)),
                            ),
                            onPressed: () {
                              if(_formKey.currentState!.validate()) {
                                String email = emailController.text;
                                String password = passController.text;
                                Get.offNamed(PagesRoutes.baseRoute);
                              } else {
                                print('Campos não validos');
                              }
                            },
                            child: const Text(
                              'Entrar',
                              style: TextStyle(fontSize: 18),
                            )),
                      ),
                      //Forgot Password
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Esqueceu a senha?',
                            style: TextStyle(
                                color: CustomColors.customContrastColor),
                          ),
                        ),
                      ),
                      //Divider
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: CustomColors.customSwatchColor,
                                thickness: 2,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Text('Ou'),
                            ),
                            Expanded(
                              child: Divider(
                                color: CustomColors.customSwatchColor,
                                thickness: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      //Button Create User
                      SizedBox(
                        height: 50,
                        child: OutlinedButton(
                          onPressed: () {
                            Get.offNamed(PagesRoutes.signUpRoute);
                          },
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18)),
                            side: BorderSide(
                                width: 2, color: CustomColors.customSwatchColor),
                          ),
                          child: const Text(
                            'Criar conta',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

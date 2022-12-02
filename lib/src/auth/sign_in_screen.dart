import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'components/custom_text_field.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Column(
        children: [
          Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  //App Name
                  const Text.rich(TextSpan(
                    style: TextStyle(
                      fontSize: 40
                    ),
                    children: [
                      TextSpan(
                        text: 'Grocery',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300
                        )
                      ),
                      TextSpan(
                        text: 'store',
                        style: TextStyle(
                         color: Colors.red,
                         fontWeight: FontWeight.w600
                        ),
                      ),
                    ]
                  ),
                  ),
                SizedBox(
                  height: 30,
                  child: DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 25
                    ),
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
            borderRadius: BorderRadius.vertical(top: Radius.circular(45))),
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:  [
            //TextField Email
            const CustomTextField(
                icon: Icons.email_sharp,
                label: 'Email'
            ),
            //TextField Password
            const CustomTextField(
                icon: Icons.lock,
                label: 'Senha',
                obscurePass: true
            ),
            //Button Entry
            SizedBox(
              height: 50,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)
                    ),
                  ),
                  onPressed: () {},
                  child: const Text('Entrar',
                    style:TextStyle(fontSize: 18),
                  )
              ),
            ),
            //Forgot Password
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: (){},
                child: const Text('Esqueceu a senha?',
                  style: TextStyle(
                      color: Colors.red
                  ),
                ),
              ),
            ),
            //Divider
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: const [
                   Expanded(
                     child: Divider(
                      color: Colors.deepPurple,
                      thickness: 2,
                  ),
                   ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text('Ou'),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.deepPurple,
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
                  onPressed: (){},
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)
                    ),
                    side: const BorderSide(
                      width: 2,
                      color: Colors.deepPurple
                    ),
                  ),
                  child: const Text('Criar conta',
                  style: TextStyle(fontSize: 18),
                  ),
              ),
            ),
          ],
            ),
          ),
        ],
      ),
    );
  }
}

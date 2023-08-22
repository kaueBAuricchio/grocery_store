import 'package:flutter/material.dart';
import 'package:grocery_store/src/config/custom_colors.dart';
import 'package:grocery_store/src/pages/common_widgets/custom_text_field.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignUpScreen extends StatelessWidget {
   SignUpScreen({Key? key}) : super(key: key);

  final cpfFormatter = MaskTextInputFormatter(
    mask: '## #####-####',
    filter: {'#': RegExp(r'[0-9]')},
  );

   final phoneFormatter = MaskTextInputFormatter(
     mask: '###.###.###-##',
     filter: {'#': RegExp(r'[0-9]')},
   );

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Column(
                children:  [
                  const Expanded(
                    child: Center(
                      child: Text('Cadastro',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.w200
                      ),
                      ),
                    ),
                  ),
                  //Form
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal:32,
                        vertical: 40),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(45),
                      )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children:  [
                        const CustomTextField(
                            icon: Icons.email_sharp,
                            label: 'Email',
                            keyBoardType: TextInputType.emailAddress,
                        ),
                        const CustomTextField(
                            icon: Icons.lock,
                            label: 'Senha',
                            obscurePass: true,
                        ),
                        const CustomTextField(
                            icon: Icons.person,
                            label: 'Nome',
                            keyBoardType: TextInputType.name,
                        ),
                        CustomTextField(
                          icon: Icons.phone,
                          label: 'Celular',
                          inputFormatter: [phoneFormatter],
                          keyBoardType: TextInputType.phone,
                        ),
                        CustomTextField(
                          icon: Icons.file_copy,
                          label: 'CPF',
                          inputFormatter: [cpfFormatter],
                          keyBoardType: TextInputType.number,
                        ),
                        SizedBox(
                          height: 50,
                          child: ElevatedButton(
                              style:ElevatedButton.styleFrom(
                                shape:  RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18)
                                ),
                              ),
                              onPressed: (){},
                              child: const Text(
                                'Cadastrar Usuario',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                              )
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 10,
                left: 10,
                child: SafeArea(
                  child: IconButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.arrow_back_ios),
                      color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

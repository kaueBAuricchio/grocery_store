import 'package:flutter/material.dart';
import 'package:grocery_store/src/config/custom_colors.dart';
class BaseScreen extends StatefulWidget {
   const BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {

  int currentIndex = 0;

  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index){
          setState(() {
            currentIndex = index;
            pageController.jumpToPage(index);
          });
          },
        backgroundColor: CustomColors.customSwatchColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withAlpha(100),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: 'Carrinho',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.list_alt_outlined),
              label: 'Pedidos'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined),
              label: 'Pedidos'
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:grocery_store/src/config/custom_colors.dart';
import 'package:grocery_store/src/pages/cart/cart_tab.dart';
import 'package:grocery_store/src/pages/home/home_tab.dart';
import 'package:grocery_store/src/pages/profile/profile_tab.dart';

import '../orders/orders_tab.dart';

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
        children:  const [
          HomeTab(),
          CartTab(),
          OrdersTab(),
          ProfileTab(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: CustomColors.customSwatchColor,
        currentIndex: currentIndex,
        onTap: (index){
          setState(() {
            currentIndex = index;
            pageController.jumpToPage(index);
            pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease
            );
          });
          },
        selectedItemColor: Colors.white,
        unselectedItemColor:Colors.white,
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

import 'package:flutter/material.dart';
import 'package:grocery_store/src/config/custom_colors.dart';
import 'package:grocery_store/src/models/cart_item_model.dart';
import 'package:grocery_store/src/pages/cart/components/cart_tile.dart';
import 'package:grocery_store/src/services/utils_services.dart';
import 'package:grocery_store/src/models/app_data.dart' as appData;


class CartTab extends StatefulWidget {
   const CartTab({Key? key}) : super(key: key);

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {

  final UtilsServices utilsServices = UtilsServices();

  void removeItemCart(CartItemModel cartItem){
     setState(() {
       appData.cartItems.remove(cartItem);

     });
   }

  double cartTotalPrice() {
    double total = 0;
    for (var item in appData.cartItems) {
      total += item.totalPrice();
    }

    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
      ),
      body: Column(
        children:[
          //List Cart Products
           Expanded(
              child: ListView.builder(
            itemBuilder: (_,index) {
              return CartTile(
                  cartItem: appData.cartItems[index],
                  remove: removeItemCart
              );
            },
            itemCount: appData.cartItems.length,
          )
           ),
          //Card total price
          Container(
            padding: const EdgeInsets.all(16),
            decoration:  BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(30)
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 3,
                  spreadRadius: 2,
                )
              ]
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                 const Text(
                  'Valor total',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                 Text(
                   utilsServices.currency(cartTotalPrice()),
                 style: TextStyle(
                   fontSize: 25,
                   color: CustomColors.customSwatchColor,
                   fontWeight: FontWeight.bold
                 ),
                 ),
                //Button confirm order
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CustomColors.customSwatchColor.shade800,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)
                        )
                      ),
                      onPressed: () async{
                        bool? result = await showOrderConfirmation();
                        print(result);
                      },
                      child: const Text(
                          'Concluir pedido',
                      style: TextStyle(
                        fontSize: 18
                      )
                      )
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<bool?> showOrderConfirmation(){
    return showDialog<bool>(
        context: context,
        builder: (context){
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
            ),
            title: const Text('Confirmação'),
            content: const Text('Deseja realmente concluir o pedido?'),
            actions: [
              TextButton(
                  onPressed: (){
                    Navigator.of(context).pop(false);
                  },
                  child: const Text('Não')
              ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
              ),
              onPressed: (){
                Navigator.of(context).pop(true);

              },
              child: const Text('Sim'),
            )
          ],
          );
        },
    );
  }
}

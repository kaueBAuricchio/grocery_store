import 'package:flutter/material.dart';
import 'package:grocery_store/src/config/custom_colors.dart';
import 'package:grocery_store/src/models/item_model.dart';
import 'package:grocery_store/src/pages/product/product_screen.dart';
import 'package:grocery_store/src/services/utils_services.dart';

class ItemTile extends StatelessWidget {

  final ItemModel item;

   ItemTile({
    Key? key,
    required this.item
  }) : super(key: key);

  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (c) {
              return ProductScreen(item: item,);
            }));
          },
          child: Card(
            elevation: 3,
            shadowColor: Colors.grey.shade300,
            shape:  RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //Image
                  Expanded(
                      child: Hero(
                          tag: item.imageUrl,
                          child: Image.asset(item.imageUrl)
                      )
                  ),
                  //Product Name
                  Text(item.itemName,
                      style: TextStyle(
                          color: CustomColors.customSwatchColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)
                  ),
                  //Price - Unit
                  Row(
                    children: [
                      //Price
                      Text(utilsServices.currency(item.price),
                      style: TextStyle(
                        color: CustomColors.customSwatchColor.shade400,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)
                      ),
                      //Unit
                      Text(item.unit,
                      style: TextStyle(
                        color: CustomColors.customSwatchColor.shade400,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        //buttom add cart
        Positioned(
          top: 4,
          right: 4,
          child: GestureDetector(
            onTap: (){},
            child: Container(
              height: 40,
              width: 35,
              decoration: BoxDecoration(
                color: CustomColors.customSwatchColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  topRight: Radius.circular(20),
                )
              ),
              child: const Icon(Icons.add_shopping_cart_outlined,
              color: Colors.white,
              size: 20),
            ),
          ),
        )
      ],
    );
  }
}

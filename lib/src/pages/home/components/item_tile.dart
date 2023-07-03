import 'package:flutter/material.dart';
import 'package:grocery_store/src/config/custom_colors.dart';
import 'package:grocery_store/src/models/item_model.dart';
import 'package:grocery_store/src/pages/product/product_screen.dart';
import 'package:grocery_store/src/services/utils_services.dart';

class ItemTile extends StatefulWidget {
  final ItemModel item;
  final void Function(GlobalKey) cartAnimation;

  ItemTile({
    Key? key,
    required this.item, required this.cartAnimation})
      : super(key: key);

  @override
  State<ItemTile> createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  final GlobalKey imageGk = GlobalKey();

  final UtilsServices utilsServices = UtilsServices();

  IconData iconCart = Icons.add_shopping_cart_outlined;

  Future<void> switchIcon() async {
    setState(() => iconCart = Icons.check);
   await Future.delayed(const Duration(milliseconds: 1500));
    setState(() => iconCart = Icons.add_shopping_cart_outlined);

  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (c) {
              return ProductScreen(
                item: widget.item,
              );
            }));
          },
          child: Card(
            elevation: 3,
            shadowColor: Colors.grey.shade300,
            shape: RoundedRectangleBorder(
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
                          tag: widget.item.imageUrl,
                          child: Image.asset(
                            widget.item.imageUrl,
                            key: imageGk,
                          ))),
                  //Product Name
                  Text(widget.item.itemName,
                      style: TextStyle(
                          color: CustomColors.customSwatchColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  //Price - Unit
                  Row(
                    children: [
                      //Price
                      Text(utilsServices.currency(widget.item.price),
                          style: TextStyle(
                              color: CustomColors.customSwatchColor.shade400,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      //Unit
                      Text(
                        widget.item.unit,
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
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(15),
              topRight: Radius.circular(20),
            ),
            child: Material(
              child: InkWell(
                onTap: () {
                  switchIcon();
                  widget.cartAnimation(imageGk);
                },
                child: Ink(
                  height: 40,
                  width: 35,
                  decoration: BoxDecoration(
                      color: CustomColors.customSwatchColor,
                  ),
                  child: Icon(
                      iconCart,
                      color: Colors.white, size: 20),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

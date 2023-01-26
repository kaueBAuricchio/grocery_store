import 'package:flutter/material.dart';
import 'package:grocery_store/src/config/custom_colors.dart';
import 'package:grocery_store/src/models/cart_item_model.dart';
import 'package:grocery_store/src/pages/common_widgets/quantity_widget.dart';
import 'package:grocery_store/src/services/utils_services.dart';

class CartTile extends StatefulWidget {

  final CartItemModel cartItem;
  final Function(CartItemModel) remove;

   const CartTile({
    Key? key,
    required this.cartItem,
    required this.remove,
  }) : super(key: key);

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: ListTile(
        //image
        leading: Image.asset(
            widget.cartItem.item.imageUrl,
          height: 60,
          width: 60,
        ),
        //title
        title: Text(
          widget.cartItem.item.itemName,
          style: const TextStyle(
              fontWeight: FontWeight.w500
          ),
        ),
        //Price
        subtitle: Text(
           utilsServices.currency(widget.cartItem.totalPrice()),
            style: TextStyle(
              color: CustomColors.customSwatchColor,
              fontWeight: FontWeight.bold
            )
        ),
        //Quantidade
        trailing: QuantityWidget(
            value: widget.cartItem.quantity,
            suffixText: widget.cartItem.item.unit,
            result: (quantity){
              setState(() {
                widget.cartItem.quantity = quantity;

                if(quantity == 0){
                  widget.remove(widget.cartItem);
                }
              });
            },
            isRemovable: true,
            ),
      ),
    );
  }
}

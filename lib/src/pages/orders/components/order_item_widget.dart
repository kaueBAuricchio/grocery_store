import 'package:flutter/material.dart';
import 'package:grocery_store/src/models/cart_item_model.dart';
import 'package:grocery_store/src/services/utils_services.dart';

class OrderItemWidget extends StatelessWidget {
  const OrderItemWidget({
    Key? key,
    required this.utilsServices,
    required this.orderItem
  }) : super(key: key);

  final UtilsServices utilsServices;
  final CartItemModel orderItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(
            '${orderItem.quantity}'
                ' ${orderItem.item.unit}',
            style: const TextStyle(
                fontWeight: FontWeight.bold
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(orderItem.item.itemName),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(utilsServices.currency(orderItem.totalPrice())
            ),
          )
        ],
      ),
    );

  }
}

import 'package:flutter/material.dart';
import 'package:grocery_store/src/models/order_model.dart';
import 'package:grocery_store/src/pages/common_widgets/payment_dialog.dart';
import 'package:grocery_store/src/pages/orders/components/order_item_widget.dart';
import 'package:grocery_store/src/pages/orders/components/order_status_widget.dart';
import 'package:grocery_store/src/services/utils_services.dart';

class OrderTile extends StatelessWidget {
  OrderTile({
    Key? key,
    required this.order,
  }) : super(key: key);

  final OrderModel order;
  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: order.status == 'pending_payment',
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Pedido: ${order.id}'),
              Text(
                utilsServices.formatDateTime(order.createdDateTime),
                style: const TextStyle(fontSize: 12, color: Colors.black),
              )
            ],
          ),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                  //Orders Numbers
                  Expanded(
                      flex: 3,
                      child: SizedBox(
                        height: 150,
                        child: ListView(
                          children: order.items.map((orderItem) {
                            return OrderItemWidget(
                                utilsServices: utilsServices,
                                orderItem: orderItem);
                          }).toList(),
                        ),
                      )),
                  //Divider
                  VerticalDivider(
                    color: Colors.grey.shade300,
                    thickness: 2,
                    width: 8,
                  ),
                  //Order status
                  Expanded(
                      flex: 2,
                      child: OrderStatusWidget(
                        status: order.status,
                        isOverdue:
                            order.overDudeDateTime.isBefore(DateTime.now()),
                      ))
                ],
              ),
            ),
            //Total
            Text.rich(
              TextSpan(style: const TextStyle(fontSize: 20), children: [
                const TextSpan(
                    text: 'Total ',
                    style: TextStyle(fontWeight: FontWeight.bold)
                ),
                TextSpan(text: utilsServices.currency(order.total)
                )
              ]),
            ),
            //Buttom Payment
            Visibility(
              visible:  order.status == 'pending_payment',
              child: ElevatedButton.icon(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) {
                        return PaymentDialog(order: order);
                      }
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                ),
                icon: Image.asset(
                  'assets/app_images/pix.png',
                  height: 18,
                ),
                label: const Text('Ver QR Code pix'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:grocery_store/src/config/custom_colors.dart';
import 'package:grocery_store/src/models/order_model.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../services/utils_services.dart';

class PaymentDialog extends StatelessWidget {
  PaymentDialog({
    Key? key,
    required this.order
  }) : super(key: key);

  final OrderModel order;
  final UtilsServices utilsServices = UtilsServices();


  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //Title
              Text(
                'Pagamneto por Pix ',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),
              ),
              //Qr Code
              QrImage(
                data: "1234567890",
                version: QrVersions.auto,
                size: 200.0,
              ),
              //maturity
              Text('Vencimento: ${utilsServices.formatDateTime(
                  order.overDudeDateTime)}',
                style: const TextStyle(
                    fontSize: 12
                ),
              ),
              //total
              Text('Total: ${utilsServices.currency(order.total)}',
                style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold
                ),
              ),
              //Button copy and paste
              OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    side: BorderSide(
                      width: 2,
                      color: CustomColors.customSwatchColor.shade300
                    )
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.copy,
                      size: 15
                  ),
                  label: const Text(
                    'Copiar codigo Pix',
                    style: TextStyle(
                        fontSize: 13
                    ),
                  )
              )
            ],
          ),
        )
    );
  }
}

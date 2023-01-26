import 'package:flutter/material.dart';
import 'package:grocery_store/src/models/app_data.dart' as appData;

class OrdersTab extends StatelessWidget {
  const OrdersTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Pedidos'),
      ),
      body: ListView.separated(
          padding: const EdgeInsets.all(16),
          physics: const BouncingScrollPhysics(),
          separatorBuilder: (_, index) => const SizedBox(height: 10),
          itemBuilder: (_,index){
            return Text(appData.orders[index].id);
          },
          itemCount: appData.orders.length
      ),
    );
  }
}

import 'package:grocery_store/src/models/cart_item_model.dart';

class OrderModel {
  String id;
  DateTime createdDateTime;
  DateTime overDudeDateTime;
  List<CartItemModel> items;
  String status;
  String copyAndPaste;
  double total;

  OrderModel({
      required this.id,
      required this.createdDateTime,
      required this.overDudeDateTime,
      required this.items,
      required this.status,
      required this.copyAndPaste,
      required this.total
  });
}
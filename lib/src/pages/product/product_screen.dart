import 'package:flutter/material.dart';
import 'package:grocery_store/src/config/custom_colors.dart';
import 'package:grocery_store/src/models/item_model.dart';
import 'package:grocery_store/src/services/utils_services.dart';
class ProductScreen extends StatelessWidget {
   ProductScreen({
    Key? key,
    required this.item
  }) : super(key: key);

  final ItemModel item;
  UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                  child: Hero(
                      tag: item.imageUrl,
                      child: Image.asset(item.imageUrl)
                  )
              ),
              Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      color: CustomColors.customSwatchColor,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(20)
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(0,2)
                        )
                      ]
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        //Name - quantity
                        Row(
                          children: [
                            Expanded(
                              child: Text(item.itemName,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 27,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            Container(
                              height: 30,
                              width: 70,
                              color: CustomColors.customContrastColor,
                            )
                          ],
                        ),
                        //Price
                        Text(utilsServices.currency(item.price),
                        style: const TextStyle(
                          fontSize: 23,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                        ),
                        //Description
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: SingleChildScrollView(
                              child: Text(item.description!,
                              style: const TextStyle(
                                height: 1.5,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 16
                              )
                                ,),
                            ),
                          ),
                        ),
                        //Button add cart
                        SizedBox(
                          height: 55,
                          child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)
                                )
                              ),
                            onPressed: (){},
                            label:  Text("Adicionar no carrinho",
                              style: TextStyle(
                                color: CustomColors.customSwatchColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            icon: Icon(Icons.shopping_cart_outlined,
                            color: CustomColors.customSwatchColor
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
              ),
            ],
          ),
          Positioned(
            top: 10,
            left: 10,
            child: SafeArea(
              child: IconButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_back_ios,
                  color: CustomColors.customSwatchColor,)),
            ),
          )
        ],
      ),
    );
  }
}

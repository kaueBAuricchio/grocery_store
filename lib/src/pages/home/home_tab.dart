import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:grocery_store/src/config/custom_colors.dart';
import 'package:grocery_store/src/pages/home/components/category_tile.dart';
import 'package:grocery_store/src/models/app_data.dart' as appData;
import 'package:grocery_store/src/pages/home/components/item_tile.dart';

class HomeTab extends StatefulWidget {
   const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {


  String selectedCategory = 'Frutas';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      //AppBar
      appBar: AppBar(
        backgroundColor: CustomColors.customSwatchColor,
        centerTitle: true,
        elevation: 0,
        title:  Text.rich(
            TextSpan(
              style: const TextStyle(
                fontSize: 30,
              ),
          children: [
             const TextSpan(
                text: 'Grocery',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300
                )
            ),
            TextSpan(
              text: 'store',
              style: TextStyle(
                  color: CustomColors.customContrastColor,
                  fontWeight: FontWeight.w600
              ),
            ),
          ]
        )
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
              right: 15,
            ),
            child: GestureDetector(
              onTap:(){},
              child: Badge(
                badgeColor: CustomColors.customContrastColor,
                badgeContent: const Text(
                  '2',
                  style: TextStyle(
                   color: Colors.white,
                    fontSize: 12),
                ),
                child: const Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          //Textfield search
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                isDense: true,
                hintText: 'Pesquise aqui...',
                hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                prefixIcon:  Icon(Icons.search,
                color: CustomColors.customSwatchColor.shade300,
                size: 12,),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(60),
                    borderSide:
                        const BorderSide(width: 0, style: BorderStyle.none)
                ),
              ),
            ),
          ),

          //Categories
          Container(
            padding: const EdgeInsets.only(left: 25),
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index){
                return CategoryTile(
                  onPressed: (){
                    setState(() {
                      selectedCategory = appData.categories[index];
                    });
                  },
                  category: appData.categories[index],
                  isSelected: appData.categories[index] == selectedCategory,
                );
              },
              separatorBuilder: (_, index) => const SizedBox(
                width: 10,
              ),
              itemCount: appData.categories.length,
            ),
          ),
          //Grid
          Expanded(
            child: GridView.builder(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 9 / 11.5),
                itemCount: appData.itens.length,
                itemBuilder: (_, index) {
                  return ItemTile(
                    item: appData.itens[index],
                  );
                }),
          ),
        ],
      ),
    );
  }
}

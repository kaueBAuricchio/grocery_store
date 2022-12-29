
import 'package:grocery_store/src/models/item_model.dart';

ItemModel apple =
ItemModel(
    itemName: 'Maçã',
    imageUrl: 'assets/fruits/apple.png',
    unit: 'KG',
    price: 1.50,
    description: 'A melhor maçã da região');

ItemModel grape =
ItemModel(
    itemName: 'Uva',
    imageUrl: 'assets/fruits/grape.png',
    unit: 'KG',
    price: 99.90,
    description: 'Uvas da região do Himalaia.');

ItemModel guava =
ItemModel(
    itemName: 'Goiaba',
    imageUrl: 'assets/fruits/guava.png',
    unit: 'KG',
    price: 155.50,
    description: 'Goiaba plantadas no monte fuji.');

ItemModel kiwi =
ItemModel(
    itemName: 'kiwi',
    imageUrl: 'assets/fruits/kiwi.png',
    unit: 'KG',
    price: 264.30,
    description: 'Kiwis plantados no monte kilimanjaro.');

ItemModel mango =
ItemModel(
    itemName: 'Manga',
    imageUrl: 'assets/fruits/mango.png',
    unit: 'KG',
    price: 359.80,
    description: 'Mangas platantas no sul do Saara');

ItemModel papaya =
ItemModel(
    itemName: 'Mamão Papaya',
    imageUrl: 'assets/fruits/papaya.png',
    unit: 'KG',
    price: 690.30,
    description: 'Mamões Papayas plantados nas maldivas');

List<ItemModel> itens = [
  apple,
  grape,
  guava,
  kiwi,
  mango,
  papaya
];

List<String> categories = [
  'Frutas',
  'Verduras',
  'Legumes',
  'Carnes',
  'Cereais',
  'Laticinios',
  'Guloseimas',
];
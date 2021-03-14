import 'package:flutter_catalog/core/store.dart';
import 'package:velocity_x/velocity_x.dart';

import 'catalog.dart';

class CartModel{


  CatalogModel _catalog;
  //collection of Ids
  final List<int> _itemIds=[];

  CatalogModel get catalog => _catalog;
  set catalog(CatalogModel newCatalog){
    assert(newCatalog != null);
    _catalog= newCatalog;
  }
  //get items of
  List<Item> get item => _itemIds.map((id) => _catalog.getById(id)).toList();

  num get totalPrice => item.fold(0, (total, current) => total + current.price);

  void remove(Item item){
    _itemIds.remove(item.id);
  }

}
class AddMutation extends VxMutation<MyStore>{
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store.cart._itemIds.add(item.id );
    throw UnimplementedError();
  }

}
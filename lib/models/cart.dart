import 'package:flutter_catalog/core/store.dart';
import 'package:velocity_x/velocity_x.dart';

import 'catalog.dart';

class CartModel{


  late CatalogModel _catalog;
  //collection of Ids
  final List<int> _itemIds=[];

  // ignore: unnecessary_getters_setters
  CatalogModel get catalog => _catalog;
  // ignore: unnecessary_getters_setters
  set catalog(CatalogModel newCatalog){
    _catalog= newCatalog;
  }
  //get items of
  List<Item> get item => _itemIds.map((id) => _catalog.getById(id)).toList();

  num get totalPrice => item.fold(0, (total, current) => total + current.price);


}
class AddMutation extends VxMutation<MyStore>{
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store!.cart._itemIds.add(item.id );
    throw UnimplementedError();
  }

}
class RemoveMutation extends VxMutation<MyStore>{
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    store!.cart._itemIds.remove(item.id );
    throw UnimplementedError();
  }

}
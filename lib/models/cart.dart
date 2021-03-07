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
  void add(Item item){
    _itemIds.add(item.id);
  }
  void remove(Item item){
    _itemIds.remove(item.id);
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),

      ),
      body: Column(
        children: [
          _CartList(

          ).p32().expand(),
          Divider(),
          _CartTotal()
        ],
      ),
    );
  }
}
class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartModel _cart=(VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxBuilder(builder: (context,_){
            return "\$${_cart.totalPrice}".text.xl5.color(context.theme.accentColor).make();
          },
              mutations: {RemoveMutation},
          ),
          30.widthBox,
          ElevatedButton(onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: "Buying not Supported yet".text.make()));
          },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(context.theme.buttonColor)
              ),
              child: "Buy".text.white.make()
          ).w32(context)
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    VxState.listen(context,to: [RemoveMutation]);
    final CartModel _cart=(VxState.store as MyStore).cart;
    return _cart.item.isEmpty
        ? "Nothing to Show ".text.xl.makeCentered()
        : ListView.builder(
        itemCount: _cart.item.length,
        itemBuilder: (context, index) => ListTile(
          leading: Icon(Icons.done),
          trailing: IconButton(
            icon: Icon(Icons.remove_circle_outline),
            onPressed: () => RemoveMutation(_cart.item[index]),
          ),
          title: _cart.item[index].name.text.make(),
        ),
    );
  }
}



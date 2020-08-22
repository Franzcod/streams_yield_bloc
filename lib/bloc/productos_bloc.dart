

import 'dart:async';

const PRODUCTOS = [ 'Macbook Pro', 'Monitor Ultrawide 34`','Iphone', 'Ipad Pro', 'Apple Watch'];

class ProductosBloc{

  Stream <List<String>> get getProductos async*{

    final List<String> productos = [];

    for (String producto in PRODUCTOS){
      await Future.delayed(Duration(seconds: 1));

      productos.add(producto);

      yield productos;
    }

  }

  StreamController<int> _productosContador = new StreamController<int>();
  Stream<int> get productosContador => _productosContador.stream;


  ProductosBloc(){
    this.getProductos.listen(
      (productosList) => this._productosContador.add(productosList.length)
      );
  }


  dispose(){
    _productosContador.close();
  }



}
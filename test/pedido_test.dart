// não deve criar um pedido com CPF inválido
// → CPF válido 264.310.820-52
// deve criar um pedido com 3 itens
// ao adicionar um produto existente no pedido, deve alterar a quantidade sem criar um novo item
// deve apresentar a soma de um item corretamente
// deve permitir desconto do item de no máximo 15%
// deve apresentar o total do pedido corretamente
// deve validar e calcular o desconto de um cupom de desconto
// deve adicionar um cupom de desconto

import 'package:flutter_application_02_03/entidade/pedido.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Não deve criar um pedido com CPF inválido', () {
    expect(() => Pedido(CPF: '123.123.123-12'), throwsException);
    expect(Pedido(CPF: '352.092.072-77'), returnsNormally);
  });

  test('deve criar um pedido com 3 itens', {
    var pedido = Pedido(CPF: '352.092.072-77');
    pedido.addItem(
      nomeProduto: 'coca-cola',
      quantidade: 1,
      precoUnidade: 6.5
    );

    pedido.addItem(
      nomeProduto: 'fanta',
      quantidade: 1,
      precoUnidade: 6
    );

    pedido.addItem(
      nomeProduto: 'chokito',
      quantidade: 3,
      precoUnidade: 3.5
    );

    expect(pedido.contarItem(pedido), 3);
    
  });

  test('ao adicionar um produto existente no pedido, deve alterar a quantidade sem criar um novo item', {
    var pedido = Pedido(CPF: '352.092.072-77');
    pedido.addItem(
      nomeProduto: 'coca-cola',
      quantidade: 2,
      precoUnidade: 6.5
    );

    pedido.addItem(
      nomeProduto: 'coca-cola',
      quantidade: 1,
      precoUnidade: 6.5
    );

    pedido.addItem(
      nomeProduto: 'chokito',
      quantidade: 3,
      precoUnidade: 3.5
    );

    expect(pedido.contarItem(pedido), 3);
    
  });

  test('deve apresentar a soma de um item corretamente', {
    var pedido = Pedido(CPF: '352.092.072-77');
    var totalItem = pedido.addItem(
      nomeProduto: 'coca-cola',
      quantidade: 2,
      precoUnidade: 6.5
    );

    expect(totalItem, 13.0);
    
  });

  test('deve permitir desconto em reais do item de no máximo 15%', {
    var pedido = Pedido(CPF: '352.092.072-77');

    expect(() => pedido.addItem(
      nomeProduto: 'coca-cola',
      quantidade: 2,
      precoUnidade: 6.5,
      descontoEmReais: 3,
    ), throwsException);

    expect(() => pedido.addItem(
      nomeProduto: 'fanta',
      quantidade: 2,
      precoUnidade: 5,
      descontoEmReais: 1.5,
    ), 8.5);
    
  });

  test('deve apresentar o total do pedido corretamente', {
    var pedido = Pedido(CPF: '352.092.072-77');
    pedido.addItem(
      nomeProduto: 'coca-cola',
      quantidade: 2,
      precoUnidade: 6.5,
      descontoEmReais: 1,
    );

    pedido.addItem(
      nomeProduto: 'fanta',
      quantidade: 2,
      precoUnidade: 5,
      descontoEmReais: 1.5,
    )

    expect(pedido.getTotal(), 20.50);

    expect(() => , 8.5);
    
  });

}

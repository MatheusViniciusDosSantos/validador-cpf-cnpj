import 'package:flutter_application_02_03/entidade/validar_cpf.dart';

class Pedido {
  var itens = <Object>[];
  var total = 0.0;

  Pedido({required String CPF}) {
    ValidarCPF.comCPF(CPF);
  }

// Método para adicionar um tem dentro do meu pedido
  double addItem({required String nomeProduto, required int quantidade, required double precoUnidade, double descontoEmReais = 0}) {
    var existe = false;
    var totalItem = quantidade * precoUnidade;
    var descontoPermitido = totalItem * 0.15;

    //Feita validação de valor maximo de desconto permitido
    if (descontoEmReais > descontoPermitido) throw Exception('Desconto maior que o permitido');

    //Determina o valor total do item
    totalItem = totalItem - descontoEmReais;
    for(var contador= 0; contador< itens.length; contador++) {
      var item = itens[contador] as <Object>[];
      if(item[0] == nomeProduto) {
        item[1] += quantidade;
        existe = true;
        break;
      }
    }

    //Verifica se existe um novo item para ser adicionado
    if(!existe) {
      itens.add([nomeProduto, quantidade, precoUnidade]);
    }
    total += totalItem;
    return totalItem;
  }

// Método para realizar a contagem de itens dentro do pedido
  int contarItems(Pedido pedido) {
    return itens.length;
  }

  double getTotal() {
    return total;
  }
}
class ValidarCPF {
  bool ehVazio(String cpf) {
    if (cpf.isEmpty) throw Exception('CPF não pode ser vazio');
    return true;
  }

  bool tem14Char(String cpf) {
    if (cpf.length == 14) return true;
    throw Exception('CPF deve ter 14 caracteres');
  }

  bool formatoCorreto(String cpf) {
    // em expressão regular  [0-9] ou \d significam que são os números de 0 a 9
    // o "r" antes da expressão regular, no flutter, significa que são apenas os
    //caracteres normais, ou seja, caracteres especias não são inclusos
    var regex = RegExp(r'[0-9]{3}\.\d{3}\.\d{3}\-\d{2}');
    if (!regex.hasMatch(cpf))
      throw Exception('CPF deve possuir o formato "000.000.000-00"');
    return true;
  }

  List<int> gerarListaNumeros(String cpfCompleto) {
    ehVazio(cpfCompleto);
    var cpfSemMascara = cpfCompleto.replaceAll('.', '').replaceAll('-', '');
    var cpfSemdigito = cpfSemMascara.substring(0, 9);
    List<int> numeros = cpfSemdigito.split('').map<int>((e) => int.parse(e)).toList();
    return numeros;
  }

  int calculaPrimeiroDigito(String cpf) {
    List<int> listaNumerosCpfSemDigito = gerarListaNumeros(cpf);
    var primeiroDigito = listaNumerosCpfSemDigito[7];
    var peso = 10;
    var digitoCalculado = 0;
    for (var n in listaNumerosCpfSemDigito) {
      digitoCalculado += peso * n;
      peso--;
    }
    digitoCalculado = 11 - (digitoCalculado % 11);
    if (digitoCalculado > 9) digitoCalculado = 0;

    return digitoCalculado;
  }

  int calculaSegundoDigito(List<int> cpf) {
    var primeiroDigito = cpf[8];
    var peso = 11;
    var digitoCalculado = 0;
    for (var n in cpf) {
      digitoCalculado += peso * n;
      peso--;
    }
    digitoCalculado = 11 - (digitoCalculado % 11);
    if (digitoCalculado > 9) digitoCalculado = 0;
    return digitoCalculado;
  }

  bool validaPrimeiroDigito(String cpf, int digitoCalculado) {
    var primeiroDigito = int.parse(cpf.substring(12, 13));
    
    if (primeiroDigito != digitoCalculado) throw Exception('Primeiro dígito incorreto!');
    return true;
  }

  bool validaSegundoDigito(String cpf, int digitoCalculado) {
    var segundoDigito = int.parse(cpf.substring(13, 14));

    if (segundoDigito != digitoCalculado) throw Exception('Segundo digito incorreto');
    return true;
  }

  bool verificaPrimeiroDigitoNaLista(List<int> cpfComPrimeiroDigito, int primeiroDigito) {
    if (cpfComPrimeiroDigito.last != primeiroDigito) throw Exception('A lista com os números não possui o primeiro dígito');
    return true;
  }

}

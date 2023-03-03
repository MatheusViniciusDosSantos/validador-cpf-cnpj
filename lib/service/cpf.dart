String validarCpf(String cpfCompleto) {
  
  if (!cpfCompleto.contains('.')) {
    return 'CPF deve possuir ponto(".").';
  }
  if (!cpfCompleto.contains('-')) {
    return 'CPF deve possuir traço("-").';
  }
  if (cpfCompleto.length != 14) {
    return 'CPF deve possuir 14 caracteres.';
  }

  /**
  retirar if anhinhado
  validar primeiro
  mudar nome das variaveis para ficar legível
  retirar var não utilizadas

  */
  // temp temp2 - cpfSemMascara
  // temp3 lista de listaNumerosCpfSemDigito
  // temp4 booleano números iguais
  // temp5 listaNumerosCpfSemDigito
  // temp7 é o peso
  // temp8 digito calculado
  
  var cpfSemMascara = cpfCompleto.replaceAll('.', '').replaceAll('-', '');
  var listaNumerosCpfSemDigito = cpfSemMascara.substring(0,9).split('').map<int>((e) => int.parse(e)).toList();
  var ehNumerosIguais = true;
  var primeiroDigito = int.parse(cpfCompleto.substring(12,13));
  var segundoDigito = int.parse(cpfCompleto.substring(13,14));

  for (var i = 1; i < listaNumerosCpfSemDigito.length; i++) {
    var elementoAnterior = listaNumerosCpfSemDigito[i-1];
    var elementoAtual = listaNumerosCpfSemDigito[i];

    if(elementoAnterior != elementoAtual) {
      ehNumerosIguais = false;
      break;
    }
    
  }

  if(ehNumerosIguais) return 'CPF deve possuir números diferentes!';

  var peso = 10;
  var digitoCalculado = 0;
  for (var n in listaNumerosCpfSemDigito) {
    digitoCalculado += peso * n;
    peso--;
  }
  digitoCalculado = 11 - (digitoCalculado % 11);
  if (digitoCalculado > 9) digitoCalculado = 0;

  if(primeiroDigito != digitoCalculado) return 'Primeiro dígito incorreto!';
  
  listaNumerosCpfSemDigito.add(digitoCalculado);

  peso = 11;
  digitoCalculado = 0;
  for (var n in listaNumerosCpfSemDigito) {
    digitoCalculado += peso * n;
    peso--;
  }
  digitoCalculado = 11 - (digitoCalculado % 11);
  if (digitoCalculado > 9) digitoCalculado = 0;

  if (segundoDigito != digitoCalculado) return 'Segundo dígito incorreto!';

  return 'CPF válido';
}


String validarCnpj(String cnpjCompleto) {
  if (!cnpjCompleto.contains('.')) {
    return 'CNPJ deve possuir ponto(".").';
  }
  if (!cnpjCompleto.contains('/')) {
    return 'CNPJ deve possuir barra("/").';
  }
  if (!cnpjCompleto.contains('-')) {
    return 'CNPJ deve possuir traço("-").';
  }
  if (cnpjCompleto.length != 18) {
    return 'CNPJ deve possuir 18 caracteres.';
  }

  /**
  retirar if anhinhado
  validar primeiro
  mudar nome das variaveis para ficar legível
  retirar var não utilizadas

  */
  // temp temp2 - cpfSemMascara
  // temp3 lista de listaNumerosCpfSemDigito
  // temp4 booleano números iguais
  // temp5 listaNumerosCpfSemDigito
  // temp7 é o peso
  // temp8 digito calculado 00 39 32 33 00 01 00

  var cnpjSemMascara = cnpjCompleto.replaceAll('.', '').replaceAll('/', '').replaceAll('-', '');
  var listaNumerosCnpjSemDigito = cnpjSemMascara
      .substring(0, 12)
      .split('')
      .map<int>((e) => int.parse(e))
      .toList();
  var ehNumerosIguais = true;
  var primeiroDigito = int.parse(cnpjSemMascara.substring(12, 13));
  var segundoDigito = int.parse(cnpjSemMascara.substring(13, 14));

  for (var i = 1; i < listaNumerosCnpjSemDigito.length; i++) {
    var elementoAnterior = listaNumerosCnpjSemDigito[i - 1];
    var elementoAtual = listaNumerosCnpjSemDigito[i];

    if (elementoAnterior != elementoAtual) {
      ehNumerosIguais = false;
      break;
    }
  }

  if (ehNumerosIguais) return 'CNPJ deve possuir números diferentes!';

  var peso = 5;
  var digitoCalculado = 0;
  for (var n in listaNumerosCnpjSemDigito) {
    digitoCalculado += peso * n;
    peso--;
    if(peso <= 1) {
      peso = 9;
    }
  }
  digitoCalculado = 11 - (digitoCalculado % 11);
  if (digitoCalculado > 9) digitoCalculado = 0;

  if (primeiroDigito != digitoCalculado) return 'Primeiro dígito incorreto!';

  listaNumerosCnpjSemDigito.add(digitoCalculado);

  peso = 6;
  digitoCalculado = 0;
  for (var n in listaNumerosCnpjSemDigito) {
    digitoCalculado += peso * n;
    peso--;
    if(peso <= 1) {
      peso = 9;
    }
  }
  digitoCalculado = 11 - (digitoCalculado % 11);
  if (digitoCalculado > 9) digitoCalculado = 0;

  if (segundoDigito != digitoCalculado) return 'Segundo dígito incorreto!';

  return 'CNPJ válido';
}

import 'package:flutter_application_02_03/entidade/validar_cpf.dart';
import 'package:flutter_application_02_03/service/cpf.dart';
import 'package:flutter_test/flutter_test.dart';

/**
 * 1 - Escrever o teste antes
 * 2 - Codifique somente o necessário para cobrir o teste
 * 3 - Não escreva mais testes antes de codificar
 */


/**
 * Tecnicas Clean code usadas
 * 1 - Nomes que dizem o que fazem de maneira direta.
 * 2 - As variaveis e funções vão descrevendo o código como uma história.
 * 3 - Não existe funções que realizam a mesma coisa
 * 4 - É feito o tratamento de erros
 */
void main() {
  test("CPF vazio deve gerar excessão", () {
    var cpf = '';
    var validarCPF = ValidarCPF();
    expect(()=> validarCPF.ehVazio(cpf), throwsException);
  });

  test("Cpf deve possuir 14 char", () {
    var cpf = '123.123.123-12';
    var validarCPF = ValidarCPF();
    expect(validarCPF.tem14Char(cpf), true);
    cpf = '1';
    expect(() => validarCPF.tem14Char(cpf), throwsException);
  });

  test("Cpf deve possuir formato correto", () {
    var cpf = '123.123.123-12';
    var validarCPF = ValidarCPF();
    expect(validarCPF.formatoCorreto(cpf), true);
    cpf = '12312312312';
    expect(() => validarCPF.formatoCorreto(cpf), throwsException);
  });

  test("Cpf sem mascara deve possuir 9 números", () {
    var cpf = '123.123.123-12';
    var validarCPF = ValidarCPF();
    List<int> listaNumerosCPF = validarCPF.gerarListaNumeros(cpf);
    expect(listaNumerosCPF.length, 9);
  });

  //deve calcular o primeiro dígito
  //deve calcular o segundo dígito
  //deve validar os dígitos

  test("Primeiro deve ser calculado", () {
    var cpf = '352.092.072-77';
    var validarCPF = ValidarCPF();
    expect(!validarCPF.calculaPrimeiroDigito(cpf).isNaN, true);
  });

  test("Segundo deve ser calculado", () {
    var cpf = '352.092.072-77';
    var validarCPF = ValidarCPF();
    List<int> cpfComPrimeiroDigito = validarCPF.gerarListaNumeros(cpf);
    cpfComPrimeiroDigito.add(validarCPF.calculaPrimeiroDigito(cpf));
    expect(!validarCPF.calculaSegundoDigito(cpfComPrimeiroDigito).isNaN, true);
  });

  test("Primeiro digito deve estar correto", () {
    var cpf = '352.092.072-77';
    var validarCPF = ValidarCPF();
    var primeiroDigitoCalculado = validarCPF.calculaPrimeiroDigito(cpf);
    expect(validarCPF.validaPrimeiroDigito(cpf, primeiroDigitoCalculado), true);
    cpf = '123.456.789-12';
    expect(()=> validarCPF.validaPrimeiroDigito(cpf, primeiroDigitoCalculado), throwsException);
  });

  test("Segundo digito deve estar correto", () {
    var cpf = '352.092.072-77';
    var validarCPF = ValidarCPF();
    List<int> cpfComPrimeiroDigito = validarCPF.gerarListaNumeros(cpf);
    cpfComPrimeiroDigito.add(validarCPF.calculaPrimeiroDigito(cpf));
    var segundoDigitoCalculado = validarCPF.calculaSegundoDigito(cpfComPrimeiroDigito);
    expect(validarCPF.validaSegundoDigito(cpf, segundoDigitoCalculado), true);
    cpf = '123.456.789-12';
    expect(() => validarCPF.validaSegundoDigito(cpf, segundoDigitoCalculado),
        throwsException);
  });

  test("O cpf passado para calcular o segundo dígito deve incluir o primeiro digito", () {
    var cpf = '352.092.072-77';
    var validarCPF = ValidarCPF();
    var cpfSemdigitos = validarCPF.gerarListaNumeros(cpf);
    List<int> cpfComPrimeiroDigito = cpfSemdigitos;
    var primeiroDigito = validarCPF.calculaPrimeiroDigito(cpf);
    cpfComPrimeiroDigito.add(primeiroDigito);
    expect(validarCPF.verificaPrimeiroDigitoNaLista(cpfComPrimeiroDigito, primeiroDigito), true); 
    cpfComPrimeiroDigito.last = 0;
    expect(() => validarCPF.verificaPrimeiroDigitoNaLista(cpfComPrimeiroDigito, primeiroDigito),
        throwsException); 
  });

}
class Bonificacao {
  double _totalDeBonicacao = 0;

  adicionaBonificacao(double bonificacao) {
    _totalDeBonicacao += bonificacao;
  }

  imprimeTotal() {
    print('O total de bonificações é ${_totalDeBonicacao.toStringAsFixed(2)}');
  }
}

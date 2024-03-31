class Carro{
  final String _placa;
  final String _cor;
  final int _ano;

  Carro(this._placa, this._cor, this._ano);
  String get placa => _placa;
  String get cor => _cor;
  int get ano => _ano;

  @override
  String toString() {
    return "Placa: $_placa\nCor: $_cor\nAno: $_ano";
  }

}
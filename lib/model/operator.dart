class Operator {
  late String _symbol;

  String get symbol => _symbol;

  set symbol(String newValue) => _symbol = newValue;

  Operator({symbol}) {
    this.symbol = symbol;
  }

  Map<String, dynamic> toMap() {
    return {
      'symbol': symbol,
    };
  }

  @override
  String toString() {
    return symbol;
  }
}

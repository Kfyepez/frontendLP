class Hotel{
  String _name;
  double _price;
  String _phone;

  Hotel(this._name, this._price, this._phone);

  double get price => _price;

  set price(double value) {
    _price = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get phone => _phone;

  set phone(String value) {
    _phone = value;
  }
}
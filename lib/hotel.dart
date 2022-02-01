class Hotel{
  String _name;
  int _price;
  String _phone;

  Hotel(this._name, this._price, this._phone);

  int get price => _price;

  set price(int value) {
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
class Post{
  String _name_forest;
  String _link_img;
  String _description;

  Post(this._name_forest, this._link_img, this._description);

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  String get link_img => _link_img;

  set link_img(String value) {
    _link_img = value;
  }

  String get name_forest => _name_forest;

  set name_forest(String value) {
    _name_forest = value;
  }
}
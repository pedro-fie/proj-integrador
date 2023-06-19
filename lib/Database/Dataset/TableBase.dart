abstract class TableBase {
  final String _id;

  TableBase(this._id);

  String get id => _id;

  Map<String, dynamic> toMap();

  void unMap(Map<String, dynamic>? ob);
}

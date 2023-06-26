abstract class TableBase {
  String id;

  TableBase(this.id);

  Map<String, dynamic> toMap();

  Object getObject();

  void unMap(Map<String, dynamic>? ob, String id);
}

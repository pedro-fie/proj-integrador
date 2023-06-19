import 'dart:convert';

import 'package:app/Database/Dataset/TableBase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Dataset<T extends TableBase> {
  final String _table;

  final FirebaseFirestore _db;

  Dataset(this._db, this._table);

  Future<List<T>> Get(GetOptions? options,
      {Object? field,
      Object? isEqualTo,
      Object? isNotEqualTo,
      Object? isGreaterThan,
      Object? isLessThan}) async {
    List<T> resp = <T>[];
    T data;

    if (field != null) {
      await _db
          .collection(_table)
          .where(
            field,
            isEqualTo: isEqualTo,
            isGreaterThan: isGreaterThan,
            isNotEqualTo: isNotEqualTo,
            isLessThan: isLessThan,
          )
          .get(options)
          .then(
            (value) => {
              for (var d in value.docs)
                {
                  print("data"),
                  print(d.data()),
                  data = jsonDecode(d.data()),
                  resp.add(data),
                },
            },
          );
    } else {
      await _db.collection(_table).get(options).then(
            (value) => {
              for (var d in value.docs)
                {
                  data = jsonDecode(d.data().toString()),
                  resp.add(data),
                },
            },
          );
    }
    return resp;
  }

  void Add(T data) {
    _db.collection(_table).add(data.toMap());
  }

  void Update(T data) {
    if (data.id.isEmpty) return;
    _db.collection(_table).doc(data.id).update(data.toMap());
  }
}

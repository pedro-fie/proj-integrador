import 'dart:convert';

import 'package:app/Database/Dataset/TableBase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Dataset<T extends TableBase> {
  final String _table;

  final FirebaseFirestore _db;

  final T Function() creator;

  Dataset(this._db, this._table, this.creator);

  Future<List<T>> Get(GetOptions? options,
      {Object? field,
      Object? isEqualTo,
      Object? isNotEqualTo,
      Object? isGreaterThan,
      Object? isLessThan}) async {
    List<T> resp = <T>[];
    T data;
    T? dd;
    if (field != null) {
      if (field.toString().toLowerCase() != "id") {
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
                    data = creator(),
                    data.unMap(d.data(), d.id),
                    resp.add(data.getObject() as T),
                  },
              },
            );
      } else {
        await _db.collection(_table).doc(isEqualTo.toString()).get().then(
              (value) => {
                data = creator(),
                data.unMap(value.data(), value.id),
                resp.add(data.getObject() as T),
              },
            );
      }
    } else {
      await _db.collection(_table).get(options).then(
            (value) => {
              for (var d in value.docs)
                {
                  data = creator(),
                  data.unMap(d.data(), d.id),
                  resp.add(data.getObject() as T),
                },
            },
          );
    }
    //print(resp[0]);
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

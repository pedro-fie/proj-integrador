import 'dart:convert';

import 'package:app/Database/Dataset/TableBase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Dataset<D extends TableBase> {
  //final String _table;

  final FirebaseFirestore _db;

  Dataset(this._db);

  //get table => _table;

  Future<List<D>> Get(GetOptions? options) async {
    List<D> resp = <D>[];
    D data;

    await _db.collection(D.table).get(options).then(
          (value) => {
            for (var d in value.docs)
              {
                data = jsonDecode(d.data().toString()),
                resp.add(data),
              },
          },
        );
    return resp;
  }
}

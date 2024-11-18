import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UpdateResourcesRecord extends FirestoreRecord {
  UpdateResourcesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "userGroupIDList" field.
  List<String>? _userGroupIDList;
  List<String> get userGroupIDList => _userGroupIDList ?? const [];
  bool hasUserGroupIDList() => _userGroupIDList != null;

  // "adminIDList" field.
  List<String>? _adminIDList;
  List<String> get adminIDList => _adminIDList ?? const [];
  bool hasAdminIDList() => _adminIDList != null;

  // "devIDList" field.
  List<String>? _devIDList;
  List<String> get devIDList => _devIDList ?? const [];
  bool hasDevIDList() => _devIDList != null;

  List<String>? _momentumStageList;
  List<String> get momentumStageList => _momentumStageList ?? const [];
  bool hasMomentumStageList() => _momentumStageList != null;

  List<String>? _rocketStageList;
  List<String> get rocketStageList => _rocketStageList ?? const [];
  bool hasRocketStageList() => _rocketStageList != null;

  void _initializeFields() {
    _userGroupIDList = getDataList(snapshotData['userGroupIDList']);
    _adminIDList = getDataList(snapshotData['adminIDList']);
    _devIDList = getDataList(snapshotData['devIDList']);
    _momentumStageList = getDataList(snapshotData['momentumStageList']);
    _rocketStageList = getDataList(snapshotData['rocketStageList']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('updateResources');

  static Stream<UpdateResourcesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UpdateResourcesRecord.fromSnapshot(s));

  static Future<UpdateResourcesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UpdateResourcesRecord.fromSnapshot(s));

  static UpdateResourcesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UpdateResourcesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UpdateResourcesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UpdateResourcesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UpdateResourcesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UpdateResourcesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUpdateResourcesRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class UpdateResourcesRecordDocumentEquality
    implements Equality<UpdateResourcesRecord> {
  const UpdateResourcesRecordDocumentEquality();

  @override
  bool equals(UpdateResourcesRecord? e1, UpdateResourcesRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.userGroupIDList, e2?.userGroupIDList) &&
        listEquality.equals(e1?.adminIDList, e2?.adminIDList) &&
        listEquality.equals(e1?.devIDList, e2?.devIDList);
  }

  @override
  int hash(UpdateResourcesRecord? e) => const ListEquality()
      .hash([e?.userGroupIDList, e?.adminIDList, e?.devIDList]);

  @override
  bool isValidKey(Object? o) => o is UpdateResourcesRecord;
}

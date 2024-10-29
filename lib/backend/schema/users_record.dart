import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "lastActive" field.
  DateTime? _lastActive;
  DateTime? get lastActive => _lastActive;
  bool hasLastActive() => _lastActive != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  // "groupID" field.
  String? _groupID;
  String get groupID => _groupID ?? '';
  bool hasGroupID() => _groupID != null;

  // "userType" field.
  String? _userType;
  String get userType => _userType ?? '';
  bool hasUserType() => _userType != null;

  // "language" field.
  List<String>? _language;
  List<String> get language => _language ?? const [];
  bool hasLanguage() => _language != null;

  // "workAreas" field.
  List<String>? _workAreas;
  List<String> get workAreas => _workAreas ?? const [];
  bool hasWorkAreas() => _workAreas != null;

  // "superAdmin" field.
  bool? _superAdmin;
  bool get superAdmin => _superAdmin ?? false;
  bool hasSuperAdmin() => _superAdmin != null;

  // "podNum" field.
  String? _podNum;
  String get podNum => _podNum ?? '';
  bool hasPodNum() => _podNum != null;

  // "adminAccount" field.
  bool? _adminAccount;
  bool get adminAccount => _adminAccount ?? false;
  bool hasAdminAccount() => _adminAccount != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _lastActive = snapshotData['lastActive'] as DateTime?;
    _status = snapshotData['status'] as String?;
    _bio = snapshotData['bio'] as String?;
    _groupID = snapshotData['groupID'] as String?;
    _userType = snapshotData['userType'] as String?;
    _language = getDataList(snapshotData['language']);
    _workAreas = getDataList(snapshotData['workAreas']);
    _superAdmin = snapshotData['superAdmin'] as bool?;
    _podNum = snapshotData['podNum'] as String?;
    _adminAccount = snapshotData['adminAccount'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  DateTime? lastActive,
  String? status,
  String? bio,
  String? groupID,
  String? userType,
  bool? superAdmin,
  String? podNum,
  bool? adminAccount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'lastActive': lastActive,
      'status': status,
      'bio': bio,
      'groupID': groupID,
      'userType': userType,
      'superAdmin': superAdmin,
      'podNum': podNum,
      'adminAccount': adminAccount,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.lastActive == e2?.lastActive &&
        e1?.status == e2?.status &&
        e1?.bio == e2?.bio &&
        e1?.groupID == e2?.groupID &&
        e1?.userType == e2?.userType &&
        listEquality.equals(e1?.language, e2?.language) &&
        listEquality.equals(e1?.workAreas, e2?.workAreas) &&
        e1?.superAdmin == e2?.superAdmin &&
        e1?.podNum == e2?.podNum &&
        e1?.adminAccount == e2?.adminAccount;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.lastActive,
        e?.status,
        e?.bio,
        e?.groupID,
        e?.userType,
        e?.language,
        e?.workAreas,
        e?.superAdmin,
        e?.podNum,
        e?.adminAccount
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}

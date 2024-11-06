import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LeadInfoRecord extends FirestoreRecord {
  LeadInfoRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "leadName" field.
  String? _leadName;
  String get leadName => _leadName ?? '';
  bool hasLeadName() => _leadName != null;

  // "leadEmail" field.
  String? _leadEmail;
  String get leadEmail => _leadEmail ?? '';
  bool hasLeadEmail() => _leadEmail != null;

  // "leadCreationDate" field.
  DateTime? _leadCreationDate;
  DateTime? get leadCreationDate => _leadCreationDate;
  bool hasLeadCreationDate() => _leadCreationDate != null;

  // "leadRecipient" field.
  String? _leadRecipient;
  String get leadRecipient => _leadRecipient ?? '';
  bool hasLeadRecipient() => _leadRecipient != null;

  // "leadSender" field.
  String? _leadSender;
  String get leadSender => _leadSender ?? '';
  bool hasLeadSender() => _leadSender != null;

  // "leadPhone" field.
  String? _leadPhone;
  String get leadPhone => _leadPhone ?? '';
  bool hasLeadPhone() => _leadPhone != null;

  // "language" field.
  String? _language;
  String get language => _language ?? '';
  bool hasLanguage() => _language != null;

  // "leadStage" field.
  String? _leadStage;
  String get leadStage => _leadStage ?? '';
  bool hasLeadStage() => _leadStage != null;

  // "prequalOrPending" field.
  String? _prequalOrPending;
  String get prequalOrPending => _prequalOrPending ?? '';
  bool hasPrequalOrPending() => _prequalOrPending != null;

  // "senderInfo" field.
  DocumentReference? _senderInfo;
  DocumentReference? get senderInfo => _senderInfo;
  bool hasSenderInfo() => _senderInfo != null;

  // "numComments" field.
  int? _numComments;
  int get numComments => _numComments ?? 0;
  bool hasNumComments() => _numComments != null;

  // "areaOfInterest" field.
  List<String>? _areaOfInterest;
  List<String> get areaOfInterest => _areaOfInterest ?? const [];
  bool hasAreaOfInterest() => _areaOfInterest != null;

  // "notes" field.
  String? _notes;
  String get notes => _notes ?? '';
  bool hasNotes() => _notes != null;

  // "loanPurpose" field.
  String? _loanPurpose;
  String get loanPurpose => _loanPurpose ?? '';
  bool hasLoanPurpose() => _loanPurpose != null;

  // "homeToSellLender" field.
  String? _homeToSellLender;
  String get homeToSellLender => _homeToSellLender ?? '';
  bool hasHomeToSellLender() => _homeToSellLender != null;

  // "homeToSellRealtor" field.
  String? _homeToSellRealtor;
  String get homeToSellRealtor => _homeToSellRealtor ?? '';
  bool hasHomeToSellRealtor() => _homeToSellRealtor != null;

  // "prequalAmtLender" field.
  String? _prequalAmtLender;
  String get prequalAmtLender => _prequalAmtLender ?? '';
  bool hasPrequalAmtLender() => _prequalAmtLender != null;

  // "prequalAmtRealtor" field.
  String? _prequalAmtRealtor;
  String get prequalAmtRealtor => _prequalAmtRealtor ?? '';
  bool hasPrequalAmtRealtor() => _prequalAmtRealtor != null;

  // "highNurture" field.
  String? _highNurture;
  String get highNurture => _highNurture ?? '';
  bool hasHighNurture() => _highNurture != null;

  // "workingWithRealtor" field.
  String? _workingWithRealtor;
  String get workingWithRealtor => _workingWithRealtor ?? '';
  bool hasWorkingWithRealtor() => _workingWithRealtor != null;

  // "workingWithLender" field.
  String? _workingWithLender;
  String get workingWithLender => _workingWithLender ?? '';
  bool hasWorkingWithLender() => _workingWithLender != null;

  // "readyToApply" field.
  String? _readyToApply;
  String get readyToApply => _readyToApply ?? '';
  bool hasReadyToApply() => _readyToApply != null;

  // "senderUserType" field.
  String? _senderUserType;
  String get senderUserType => _senderUserType ?? '';
  bool hasSenderUserType() => _senderUserType != null;

  // "senderGroupID" field.
  String? _senderGroupID;
  String get senderGroupID => _senderGroupID ?? '';
  bool hasSenderGroupID() => _senderGroupID != null;

  String? _leadID;
  String get leadID => _leadID ?? '';
  bool hasLeadID() => _leadID != null;

  void _initializeFields() {
    _leadName = snapshotData['leadName'] as String?;
    _leadEmail = snapshotData['leadEmail'] as String?;
    _leadCreationDate = snapshotData['leadCreationDate'] as DateTime?;
    _leadRecipient = snapshotData['leadRecipient'] as String?;
    _leadSender = snapshotData['leadSender'] as String?;
    _leadPhone = snapshotData['leadPhone'] as String?;
    _language = snapshotData['language'] as String?;
    _leadStage = snapshotData['leadStage'] as String?;
    _prequalOrPending = snapshotData['prequalOrPending'] as String?;
    _senderInfo = snapshotData['senderInfo'] as DocumentReference?;
    _numComments = castToType<int>(snapshotData['numComments']);
    _areaOfInterest = getDataList(snapshotData['areaOfInterest']);
    _notes = snapshotData['notes'] as String?;
    _loanPurpose = snapshotData['loanPurpose'] as String?;
    _homeToSellLender = snapshotData['homeToSellLender'] as String?;
    _homeToSellRealtor = snapshotData['homeToSellRealtor'] as String?;
    _prequalAmtLender = snapshotData['prequalAmtLender'] as String?;
    _prequalAmtRealtor = snapshotData['prequalAmtRealtor'] as String?;
    _highNurture = snapshotData['highNurture'] as String?;
    _workingWithRealtor = snapshotData['workingWithRealtor'] as String?;
    _workingWithLender = snapshotData['workingWithLender'] as String?;
    _readyToApply = snapshotData['readyToApply'] as String?;
    _senderUserType = snapshotData['senderUserType'] as String?;
    _senderGroupID = snapshotData['senderGroupID'] as String?;
    _leadID = snapshotData['leadID'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('leadInfo');

  static Stream<LeadInfoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LeadInfoRecord.fromSnapshot(s));

  static Future<LeadInfoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LeadInfoRecord.fromSnapshot(s));

  static LeadInfoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LeadInfoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LeadInfoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LeadInfoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LeadInfoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LeadInfoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLeadInfoRecordData({
  String? leadName,
  String? leadEmail,
  DateTime? leadCreationDate,
  String? leadRecipient,
  String? leadSender,
  String? leadPhone,
  String? language,
  String? leadStage,
  String? prequalOrPending,
  DocumentReference? senderInfo,
  int? numComments,
  String? notes,
  String? loanPurpose,
  String? homeToSellLender,
  String? homeToSellRealtor,
  String? prequalAmtLender,
  String? prequalAmtRealtor,
  String? highNurture,
  String? workingWithRealtor,
  String? workingWithLender,
  String? readyToApply,
  String? senderUserType,
  String? senderGroupID,
  String? leadID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'leadName': leadName,
      'leadEmail': leadEmail,
      'leadCreationDate': leadCreationDate,
      'leadRecipient': leadRecipient,
      'leadSender': leadSender,
      'leadPhone': leadPhone,
      'language': language,
      'leadStage': leadStage,
      'prequalOrPending': prequalOrPending,
      'senderInfo': senderInfo,
      'numComments': numComments,
      'notes': notes,
      'loanPurpose': loanPurpose,
      'homeToSellLender': homeToSellLender,
      'homeToSellRealtor': homeToSellRealtor,
      'prequalAmtLender': prequalAmtLender,
      'prequalAmtRealtor': prequalAmtRealtor,
      'highNurture': highNurture,
      'workingWithRealtor': workingWithRealtor,
      'workingWithLender': workingWithLender,
      'readyToApply': readyToApply,
      'senderUserType': senderUserType,
      'senderGroupID': senderGroupID,
      'leadID': leadID,
    }.withoutNulls,
  );

  return firestoreData;
}

class LeadInfoRecordDocumentEquality implements Equality<LeadInfoRecord> {
  const LeadInfoRecordDocumentEquality();

  @override
  bool equals(LeadInfoRecord? e1, LeadInfoRecord? e2) {
    const listEquality = ListEquality();
    return e1?.leadName == e2?.leadName &&
        e1?.leadEmail == e2?.leadEmail &&
        e1?.leadCreationDate == e2?.leadCreationDate &&
        e1?.leadRecipient == e2?.leadRecipient &&
        e1?.leadSender == e2?.leadSender &&
        e1?.leadPhone == e2?.leadPhone &&
        e1?.language == e2?.language &&
        e1?.leadStage == e2?.leadStage &&
        e1?.prequalOrPending == e2?.prequalOrPending &&
        e1?.senderInfo == e2?.senderInfo &&
        e1?.numComments == e2?.numComments &&
        listEquality.equals(e1?.areaOfInterest, e2?.areaOfInterest) &&
        e1?.notes == e2?.notes &&
        e1?.loanPurpose == e2?.loanPurpose &&
        e1?.homeToSellLender == e2?.homeToSellLender &&
        e1?.homeToSellRealtor == e2?.homeToSellRealtor &&
        e1?.prequalAmtLender == e2?.prequalAmtLender &&
        e1?.prequalAmtRealtor == e2?.prequalAmtRealtor &&
        e1?.highNurture == e2?.highNurture &&
        e1?.workingWithRealtor == e2?.workingWithRealtor &&
        e1?.workingWithLender == e2?.workingWithLender &&
        e1?.readyToApply == e2?.readyToApply &&
        e1?.senderUserType == e2?.senderUserType &&
        e1?.senderGroupID == e2?.senderGroupID &&
        e1?.leadID == e2?.leadID;
  }

  @override
  int hash(LeadInfoRecord? e) => const ListEquality().hash([
        e?.leadName,
        e?.leadEmail,
        e?.leadCreationDate,
        e?.leadRecipient,
        e?.leadSender,
        e?.leadPhone,
        e?.language,
        e?.leadStage,
        e?.prequalOrPending,
        e?.senderInfo,
        e?.numComments,
        e?.areaOfInterest,
        e?.notes,
        e?.loanPurpose,
        e?.homeToSellLender,
        e?.homeToSellRealtor,
        e?.prequalAmtLender,
        e?.prequalAmtRealtor,
        e?.highNurture,
        e?.workingWithRealtor,
        e?.workingWithLender,
        e?.readyToApply,
        e?.senderUserType,
        e?.senderGroupID,
        e?.leadID
      ]);

  @override
  bool isValidKey(Object? o) => o is LeadInfoRecord;
}

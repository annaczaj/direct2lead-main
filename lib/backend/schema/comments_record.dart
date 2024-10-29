import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommentsRecord extends FirestoreRecord {
  CommentsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "commentOwner" field.
  DocumentReference? _commentOwner;
  DocumentReference? get commentOwner => _commentOwner;
  bool hasCommentOwner() => _commentOwner != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "commentDate" field.
  DateTime? _commentDate;
  DateTime? get commentDate => _commentDate;
  bool hasCommentDate() => _commentDate != null;

  // "commentLeadChoice" field.
  DocumentReference? _commentLeadChoice;
  DocumentReference? get commentLeadChoice => _commentLeadChoice;
  bool hasCommentLeadChoice() => _commentLeadChoice != null;

  // "replyOwner" field.
  String? _replyOwner;
  String get replyOwner => _replyOwner ?? '';
  bool hasReplyOwner() => _replyOwner != null;

  // "commentRecipient" field.
  String? _commentRecipient;
  String get commentRecipient => _commentRecipient ?? '';
  bool hasCommentRecipient() => _commentRecipient != null;

  // "commentResponded" field.
  bool? _commentResponded;
  bool get commentResponded => _commentResponded ?? false;
  bool hasCommentResponded() => _commentResponded != null;

  // "commentLeadName" field.
  String? _commentLeadName;
  String get commentLeadName => _commentLeadName ?? '';
  bool hasCommentLeadName() => _commentLeadName != null;

  void _initializeFields() {
    _commentOwner = snapshotData['commentOwner'] as DocumentReference?;
    _content = snapshotData['content'] as String?;
    _commentDate = snapshotData['commentDate'] as DateTime?;
    _commentLeadChoice =
        snapshotData['commentLeadChoice'] as DocumentReference?;
    _replyOwner = snapshotData['replyOwner'] as String?;
    _commentRecipient = snapshotData['commentRecipient'] as String?;
    _commentResponded = snapshotData['commentResponded'] as bool?;
    _commentLeadName = snapshotData['commentLeadName'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('comments');

  static Stream<CommentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommentsRecord.fromSnapshot(s));

  static Future<CommentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommentsRecord.fromSnapshot(s));

  static CommentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommentsRecordData({
  DocumentReference? commentOwner,
  String? content,
  DateTime? commentDate,
  DocumentReference? commentLeadChoice,
  String? replyOwner,
  String? commentRecipient,
  bool? commentResponded,
  String? commentLeadName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'commentOwner': commentOwner,
      'content': content,
      'commentDate': commentDate,
      'commentLeadChoice': commentLeadChoice,
      'replyOwner': replyOwner,
      'commentRecipient': commentRecipient,
      'commentResponded': commentResponded,
      'commentLeadName': commentLeadName,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommentsRecordDocumentEquality implements Equality<CommentsRecord> {
  const CommentsRecordDocumentEquality();

  @override
  bool equals(CommentsRecord? e1, CommentsRecord? e2) {
    return e1?.commentOwner == e2?.commentOwner &&
        e1?.content == e2?.content &&
        e1?.commentDate == e2?.commentDate &&
        e1?.commentLeadChoice == e2?.commentLeadChoice &&
        e1?.replyOwner == e2?.replyOwner &&
        e1?.commentRecipient == e2?.commentRecipient &&
        e1?.commentResponded == e2?.commentResponded &&
        e1?.commentLeadName == e2?.commentLeadName;
  }

  @override
  int hash(CommentsRecord? e) => const ListEquality().hash([
        e?.commentOwner,
        e?.content,
        e?.commentDate,
        e?.commentLeadChoice,
        e?.replyOwner,
        e?.commentRecipient,
        e?.commentResponded,
        e?.commentLeadName
      ]);

  @override
  bool isValidKey(Object? o) => o is CommentsRecord;
}

import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GoalLogsRecord extends FirestoreRecord {
  GoalLogsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "log_date" field.
  DateTime? _logDate;
  DateTime? get logDate => _logDate;
  bool hasLogDate() => _logDate != null;

  // "completed_goals" field.
  List<DocumentReference>? _completedGoals;
  List<DocumentReference> get completedGoals => _completedGoals ?? const [];
  bool hasCompletedGoals() => _completedGoals != null;

  // "total_goals" field.
  List<DocumentReference>? _totalGoals;
  List<DocumentReference> get totalGoals => _totalGoals ?? const [];
  bool hasTotalGoals() => _totalGoals != null;

  void _initializeFields() {
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _logDate = snapshotData['log_date'] as DateTime?;
    _completedGoals = getDataList(snapshotData['completed_goals']);
    _totalGoals = getDataList(snapshotData['total_goals']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('goal_logs');

  static Stream<GoalLogsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GoalLogsRecord.fromSnapshot(s));

  static Future<GoalLogsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GoalLogsRecord.fromSnapshot(s));

  static GoalLogsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GoalLogsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GoalLogsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GoalLogsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GoalLogsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GoalLogsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGoalLogsRecordData({
  DocumentReference? userRef,
  DateTime? logDate,
  List<DocumentReference>? completedGoals,
  List<DocumentReference>? totalGoals,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_ref': userRef,
      'log_date': logDate,
      'completed_goals': completedGoals,
      'total_goals': totalGoals,
    }.withoutNulls,
  );

  return firestoreData;
}

class GoalLogsRecordDocumentEquality implements Equality<GoalLogsRecord> {
  const GoalLogsRecordDocumentEquality();

  @override
  bool equals(GoalLogsRecord? e1, GoalLogsRecord? e2) {
    return e1?.userRef == e2?.userRef &&
        e1?.logDate == e2?.logDate &&
        const ListEquality().equals(e1?.completedGoals, e2?.completedGoals) &&
        const ListEquality().equals(e1?.totalGoals, e2?.totalGoals);
  }

  @override
  int hash(GoalLogsRecord? e) => const ListEquality().hash([
        e?.userRef,
        e?.logDate,
        e?.completedGoals,
        e?.totalGoals,
      ]);

  @override
  bool isValidKey(Object? o) => o is GoalLogsRecord;
}

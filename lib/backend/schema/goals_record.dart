import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GoalsRecord extends FirestoreRecord {
  GoalsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "goal_text" field.
  String? _goalText;
  String get goalText => _goalText ?? '';
  bool hasGoalText() => _goalText != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "is_completed" field.
  bool? _isCompleted;
  bool get isCompleted => _isCompleted ?? false;
  bool hasIsCompleted() => _isCompleted != null;

  // "is_active" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  // "sort_order" field.
  int? _sortOrder;
  int get sortOrder => _sortOrder ?? 0;
  bool hasSortOrder() => _sortOrder != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  void _initializeFields() {
    _goalText = snapshotData['goal_text'] as String?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _isCompleted = snapshotData['is_completed'] as bool?;
    _isActive = snapshotData['is_active'] as bool?;
    _sortOrder = castToType<int>(snapshotData['sort_order']);
    _createdTime = snapshotData['created_time'] as DateTime?;
    _category = snapshotData['category'] as String?;
    _description = snapshotData['description'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('goals');

  static Stream<GoalsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GoalsRecord.fromSnapshot(s));

  static Future<GoalsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GoalsRecord.fromSnapshot(s));

  static GoalsRecord fromSnapshot(DocumentSnapshot snapshot) => GoalsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GoalsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GoalsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GoalsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GoalsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGoalsRecordData({
  String? goalText,
  DocumentReference? userRef,
  bool? isCompleted,
  bool? isActive,
  int? sortOrder,
  DateTime? createdTime,
  String? category,
  String? description,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'goal_text': goalText,
      'user_ref': userRef,
      'is_completed': isCompleted,
      'is_active': isActive,
      'sort_order': sortOrder,
      'created_time': createdTime,
      'category': category,
      'description': description,
    }.withoutNulls,
  );

  return firestoreData;
}

class GoalsRecordDocumentEquality implements Equality<GoalsRecord> {
  const GoalsRecordDocumentEquality();

  @override
  bool equals(GoalsRecord? e1, GoalsRecord? e2) {
    return e1?.goalText == e2?.goalText &&
        e1?.userRef == e2?.userRef &&
        e1?.isCompleted == e2?.isCompleted &&
        e1?.isActive == e2?.isActive &&
        e1?.sortOrder == e2?.sortOrder &&
        e1?.createdTime == e2?.createdTime &&
        e1?.category == e2?.category &&
        e1?.description == e2?.description;
  }

  @override
  int hash(GoalsRecord? e) => const ListEquality().hash([
        e?.goalText,
        e?.userRef,
        e?.isCompleted,
        e?.isActive,
        e?.sortOrder,
        e?.createdTime,
        e?.category,
        e?.description
      ]);

  @override
  bool isValidKey(Object? o) => o is GoalsRecord;
}

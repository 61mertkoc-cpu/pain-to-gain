import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => 'PainToGain';
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

  // "streak_count" field.
  int? _streakCount;
  int get streakCount => _streakCount ?? 0;
  bool hasStreakCount() => _streakCount != null;

  // "longest_streak" field.
  int? _longestStreak;
  int get longestStreak => _longestStreak ?? 0;
  bool hasLongestStreak() => _longestStreak != null;

  // "companion_name" field.
  String? _companionName;
  String get companionName => _companionName ?? 'Yoldaş';
  bool hasCompanionName() => _companionName != null;

  // "is_premium" field.
  bool? _isPremium;
  bool get isPremium => _isPremium ?? false;
  bool hasIsPremium() => _isPremium != null;

  // "total_completed_days" field.
  int? _totalCompletedDays;
  int get totalCompletedDays => _totalCompletedDays ?? 0;
  bool hasTotalCompletedDays() => _totalCompletedDays != null;

  // "last_completed_date" field.
  DateTime? _lastCompletedDate;
  DateTime? get lastCompletedDate => _lastCompletedDate;
  bool hasLastCompletedDate() => _lastCompletedDate != null;

  // "onboarding_completed" field.
  bool? _onboardingCompleted;
  bool get onboardingCompleted => _onboardingCompleted ?? false;
  bool hasOnboardingCompleted() => _onboardingCompleted != null;


  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _streakCount = castToType<int>(snapshotData['streak_count']);
    _longestStreak = castToType<int>(snapshotData['longest_streak']);
    _companionName = snapshotData['companion_name'] as String?;
    _isPremium = snapshotData['is_premium'] as bool?;
    _totalCompletedDays = castToType<int>(snapshotData['total_completed_days']);
    _lastCompletedDate = snapshotData['last_completed_date'] as DateTime?;
    _onboardingCompleted = snapshotData['onboarding_completed'] as bool?;
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
  int? streakCount,
  int? longestStreak,
  String? companionName,
  bool? isPremium,
  int? totalCompletedDays,
  DateTime? lastCompletedDate,
  bool? onboardingCompleted,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'streak_count': streakCount,
      'longest_streak': longestStreak,
      'companion_name': companionName,
      'is_premium': isPremium,
      'total_completed_days': totalCompletedDays,
      'last_completed_date': lastCompletedDate,
      'onboarding_completed': onboardingCompleted,
      'companion_name': companionName,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.streakCount == e2?.streakCount &&
        e1?.longestStreak == e2?.longestStreak &&
        e1?.companionName == e2?.companionName &&
        e1?.isPremium == e2?.isPremium &&
        e1?.totalCompletedDays == e2?.totalCompletedDays &&
        e1?.lastCompletedDate == e2?.lastCompletedDate &&
        e1?.onboardingCompleted == e2?.onboardingCompleted &&
        e1?.companionName == e2?.companionName;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.streakCount,
        e?.longestStreak,
        e?.companionName,
        e?.isPremium,
        e?.totalCompletedDays,
        e?.lastCompletedDate,
        e?.onboardingCompleted,
        e?.companionName
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}

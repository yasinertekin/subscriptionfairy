import 'package:cloud_firestore/cloud_firestore.dart';

/// [FirebaseFirestoreServiceManager] is a class
/// that contains all string constants.
/// This class is used to manage firebase firestore service.
final class FirebaseFirestoreServiceManager {
  FirebaseFirestoreServiceManager._init();
  static final FirebaseFirestoreServiceManager _instance =
      FirebaseFirestoreServiceManager._init();

  /// [instance] is a function that returns instance
  static FirebaseFirestoreServiceManager get instance => _instance;

  FirebaseFirestore? _firebaseFirestore;

  /// [firebaseFirestore] is a function that returns firebaseFirestore
  FirebaseFirestore get firebaseFirestore {
    _firebaseFirestore ??= FirebaseFirestore.instance;
    return _firebaseFirestore!;
  }
}

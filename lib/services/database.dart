import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled/modules/brew.dart';
import 'package:untitled/modules/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  final CollectionReference<Brew> brewCollection =
  FirebaseFirestore.instance.collection('users').withConverter<Brew>(
    fromFirestore: (snapshot, _) => Brew.fromJson(snapshot.data()!),
    toFirestore: (brew, _) => brew.toJson(),
  );

  Future<void> updateUserData(String sugars, String name, int strength) async {
    try {
      await brewCollection.doc(uid).set(Brew(
        sugars: sugars,
        name: name,
        strength: strength,
      ));
    } catch (e) {
      print('Error updating user data: $e');
      throw e;
    }
  }

  List<Brew> _brewListFromSnapshot(QuerySnapshot<Brew> snapshot) {
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  UserData _userDataFromSnapshot(DocumentSnapshot<Brew> snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data()!.name,
      sugars: snapshot.data()!.sugars,
      strength: snapshot.data()!.strength,
    );
  }

  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }

  Stream<UserData> get userData {
    return brewCollection.doc(uid).snapshots().map((snapshot) =>
        _userDataFromSnapshot(snapshot as DocumentSnapshot<Brew>));
  }
}

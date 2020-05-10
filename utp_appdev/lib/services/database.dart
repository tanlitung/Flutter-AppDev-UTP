import 'package:utpappdev/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  // collection reference (read or write)
  final CollectionReference profileCollection = Firestore.instance.collection('profile');

  Future updateUserData (String name, String course) async {
    return await profileCollection.document(uid).setData({
      'name': name,
      'course': course,
    });
  }

  // User data from snapshot
  UserData _userDataFromSnapshot (DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        name: snapshot.data['name'],
        course: snapshot.data['course'],
    );
  }

  // Get profile stream
  Stream<QuerySnapshot> get profiles {
    return profileCollection.snapshots();
  }

  // Get user doc stream
  Stream<UserData> get userData {
    return profileCollection.document(uid).snapshots()
        .map(_userDataFromSnapshot);
  }
}
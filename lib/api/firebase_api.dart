import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseApi {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //get single data firebase
  Future<DocumentSnapshot<Object?>> getSingleDataFromFirestore(String id, String collectionName) async {
    try {
      DocumentSnapshot documentSnapshot = await _firestore.collection(collectionName).doc(id).get();
      
      return documentSnapshot;
    } catch (e) {
      print("Error get data: $e");
      rethrow;
    }
  }

  // get collection firebase
  Future<List<Map<String, dynamic>>> getCollectionDataFromFirestore(String collectionName) async{
    try {
      QuerySnapshot querySnapshot = await _firestore.collection(collectionName).get();

      List<Map<String, dynamic>> data = querySnapshot.docs.map(
        (doc) {
          Map<String, dynamic> documentData = {
            "id": doc.id,
            ...doc.data() as Map<String, dynamic>
          };
          return documentData;
        }).toList();

        return data;
    } catch (error) {
      print("Error catching data from firestore: $error");
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> getCollectionDataWithCondition(
      String collectionName, 
      List<Map<String, dynamic>> conditions, 
      int? limit,
      Map<String, String>? sortBy,
    ) async {

    Query collectionReference = _firestore.collection(collectionName);

    try {
      if(conditions.isNotEmpty) {
        for(var condition in conditions) {
          final String field = condition['field'];
          final String operator = condition['operator'];
          final dynamic value = condition['value'];

          switch (operator){
            case '==':
              collectionReference = collectionReference.where(field, isEqualTo: value);
              break;
            case '!=':
              collectionReference = collectionReference.where(field, isNotEqualTo: value);
              break;
            case '>':
              collectionReference = collectionReference.where(field, isGreaterThan: value);
              break;
            case '>=':
              collectionReference = collectionReference.where(field, isGreaterThanOrEqualTo: value);
              break;
            case '<':
              collectionReference = collectionReference.where(field, isLessThan: value);
              break;
            case '<=':
              collectionReference = collectionReference.where(field, isLessThanOrEqualTo: value);
              break;
            case 'array-contains':
              collectionReference = collectionReference.where(field, arrayContains: value);
              break;
            case 'array-contains-any':
              collectionReference = collectionReference.where(field, arrayContainsAny: value);
              break;
            default: throw ArgumentError("Unsupported operator $operator");
          }
        }
      }

      if(limit != null){
        collectionReference = collectionReference.limit(limit);
      }

      if(sortBy != null) {
        collectionReference = collectionReference.orderBy(sortBy);
      }

      QuerySnapshot result = await collectionReference.get();

      List<Map<String, dynamic>> data = result.docs.map(
        (doc) {
          Map<String, dynamic> documentData = {
            "id": doc.id,
            ...doc.data() as Map<String, dynamic>
          };
          return documentData;
        }).toList();

      return data;
    } catch (e) {
      print('Error occured: $e');
      rethrow;
    }
  }

  //set data to firebase
  Future setDataToFirebase(String? id, String collectionName, Map<String, dynamic> data) async {
    final dataToSave = { 
      ...data, 
      "createdAt": DateTime.now()
    };

    try {
       final userCredential = await _firestore
        .collection(collectionName)
        .doc(id)
        .set(
          dataToSave, 
          SetOptions(merge: true)
        );
      

      return userCredential;
    } catch (e) {
      rethrow;
    }
  }

  //add data to firebase
  Future<DocumentReference> addDataToFirebase(String collectionName, Map<String, dynamic> data) async {
    final finalData = {
      ...data,
      "createdAt": DateTime.now()
    };

    try {
      DocumentReference documentReference = await _firestore
        .collection(collectionName)
        .add(finalData);
      
      return documentReference;
    } catch (e) {
      rethrow;
    }
  }

  //array union (modify array to a document)
  Future modifyArrayFirebase(String collectionName, String id, String field, List<Map<String, dynamic>> data) async {
    try {
      final documentReference = await _firestore
        .collection(collectionName)
        .doc(id)
        .update({ 
          field: FieldValue.arrayUnion(data)
        });

        return documentReference;
    } catch (e) {
      rethrow;
    }
  }

  //delete data firebase
  Future deleteFirebaseDocument(String collectionName, String id) async {
    try {
      await _firestore.collection(collectionName).doc(id).delete();

      return "Deleted";
    } catch (e) {
      print(e);
    }
  }

  //authentication signup
  Future<UserCredential?> signupUser(
    String email, 
    String password,
    String name,
    String phoneNumber
  ) async {

    try {
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, 
        password: password
      );

      await _firebaseAuth.currentUser?.updateDisplayName(name);

      return userCredential;
    } catch (e) {
      print('error occured: $e');
      return null;
    }
  }

  //authentication login
  Future<UserCredential?> loginUser(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, 
        password: password
      );

      return userCredential;
    } catch (e) {
      print("Error when login: $e");
      return null;
    }
  }

  //authentication logout
  Future<void> logoutUser() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      print("Error logout");
    }
  }
}
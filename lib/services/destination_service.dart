import 'package:cloud_firestore/cloud_firestore.dart';
import '/models/destination_model.dart';

class DestinationService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final String collection = "destinations";

  Future<void> createDestination(DestinationModel destination) async {
    await firestore.collection(collection).add(destination.toMap());
  }

  Stream<QuerySnapshot> getDestinations(String kategori, String subKategori) {
    return firestore
        .collection(collection)
        .where('kategori', isEqualTo: kategori)
        .where('subKategori', isEqualTo: subKategori)
        .snapshots();
  }

  Future<void> updateDestination(String id, Map<String, dynamic> data) async {
    await firestore.collection(collection).doc(id).update(data);
  }

  Future<void> deleteDestination(String id) async {
    await firestore.collection(collection).doc(id).delete();
  }
}

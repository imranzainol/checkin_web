import 'package:cloud_firestore/cloud_firestore.dart';

List<String> members = List();
Future<void> groupSetup(String groupName,String leader,String phoneNo)async{
  CollectionReference group =FirebaseFirestore.instance.collection('groups');
  group.add({'groupName':groupName,'members': members,'leader':leader,'phoneNo':phoneNo,});
  return;
}
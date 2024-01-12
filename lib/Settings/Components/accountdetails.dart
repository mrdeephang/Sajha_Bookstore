import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sajhabackup/EasyConst/Colors.dart';
import 'package:sajhabackup/EasyConst/Styles.dart';
import 'package:sajhabackup/Settings/Components/editprofile.dart';

class AccDetails extends StatefulWidget {
  const AccDetails({super.key});

  @override
  State<AccDetails> createState() => _AccDetailsState();
}

class _AccDetailsState extends State<AccDetails> {
  User? user=FirebaseAuth.instance.currentUser;
  final usersCollection=FirebaseFirestore.instance.collection("users");
  final currentUser=FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         centerTitle: true,
        title: Text(
          'Account',
          style: TextStyle(fontSize: 20, fontFamily: regular, color: color1),
        ),
        elevation: 0,
        backgroundColor: color,
        leading: BackButton(
          color: Colors.white,
        ),
      ),
      body: Container(
        child: StreamBuilder(stream: FirebaseFirestore.instance.collection("users").where("Email",isEqualTo:user?.email).snapshots(),
        builder: (context,AsyncSnapshot<QuerySnapshot> snapshot){
          if(snapshot.hasError){
            return Text('Something Went Wrong');
          }
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CupertinoActivityIndicator());
          }
          if(snapshot.data!.docs.isEmpty){
            return Text("No data Found");
          }
          if(snapshot!=null && snapshot.data!=null){
            return ListView.builder(itemCount: snapshot.data!.docs.length,itemBuilder: (context,index){
              return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 40),
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assets/images/profile.jpg'),
            ),
            const SizedBox(height: 20),
            itemProfile('Name', snapshot.data!.docs[index]['Full Name'], CupertinoIcons.person,'Name'),
            const SizedBox(height: 10),
            itemProfile('Phone',  snapshot.data!.docs[index]['Phone'], CupertinoIcons.phone,'Phone'),
            const SizedBox(height: 10),
            itemProfile('Address', snapshot.data!.docs[index]['Address'], CupertinoIcons.location,'Address'),
            const SizedBox(height: 10),
            itemProfile(
                'Email', snapshot.data!.docs[index]['Email'], CupertinoIcons.mail,'Email'),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => editprofile()));
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(15),
                  ),
                  child: const Text('Edit Profile')),
            )
          ],
        ),
      );
            });
          }
          return Container();
        },),
      ),
    );
  }
   itemProfile(String title, String subtitle, IconData iconData,String field) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 5),
                color: Color.fromARGB(255, 49, 2, 58).withOpacity(.2),
                spreadRadius: 2,
                blurRadius: 10)
          ]),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        trailing: IconButton(onPressed: ()=>editField(field),icon: Icon(Icons.settings),),
        tileColor: Colors.white,
      ),
    );
  }
  Future<void> editField(String field)async{
    String newValue="";
    await showDialog(context: context, builder: (context)=>AlertDialog(
      title:Text("Edit" +field,style: TextStyle(color: Colors.white),),
      backgroundColor: Colors.grey[500],
      content: TextField(
        autofocus: true,
        decoration: InputDecoration(
          hintText: "Enter New $field",
          hintStyle: TextStyle(color: Colors.grey),
        ),
        onChanged: (value){
          newValue=value;
        },
      ),
      actions: [
        TextButton(onPressed: ()=>Navigator.pop(context), child: Text('Cancel',
        style: TextStyle(color: Colors.white),
        )),
        TextButton(onPressed: ()=>Navigator.of(context).pop(newValue), child: Text('Save',
        style: TextStyle(color: Colors.white),
        )),
      ],
    ));
    if(newValue.trim().length>0){
      await usersCollection.doc(currentUser.email).update({field:newValue});
    }
  }
}


/*
class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final currentUser=FirebaseAuth.instance.currentUser!;

   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Account',
          style: TextStyle(fontSize: 20, fontFamily: regular, color: color1),
        ),
        elevation: 0,
        backgroundColor: color,
        leading: BackButton(
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 40),
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assets/images/profile.jpg'),
            ),
            const SizedBox(height: 20),
            itemProfile('Name', 'Name', CupertinoIcons.person),
            const SizedBox(height: 10),
            itemProfile('Phone',  'Phone', CupertinoIcons.phone),
            const SizedBox(height: 10),
            itemProfile('Address', 'Address', CupertinoIcons.location),
            const SizedBox(height: 10),
            itemProfile(
                'Email', currentUser.email!, CupertinoIcons.mail),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => editprofile()));
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(15),
                  ),
                  child: const Text('Edit Profile')),
            )
          ],
        ),
      ),
    );
  }

  itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 5),
                color: Color.fromARGB(255, 49, 2, 58).withOpacity(.2),
                spreadRadius: 2,
                blurRadius: 10)
          ]),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        tileColor: Colors.white,
      ),
    );
  }
}
*/
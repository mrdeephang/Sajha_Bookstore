import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quickalert/models/quickalert_type.dart';
//import 'package:quickalert/models/quickalert_type.dart';
import 'dart:io';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:sajhabackup/EasyConst/Colors.dart';
import 'package:sajhabackup/EasyConst/Styles.dart';

class BookAddPage extends StatefulWidget {
  @override
  _BookAddPageState createState() => _BookAddPageState();
}

class _BookAddPageState extends State<BookAddPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController authorController = TextEditingController();
  final TextEditingController conditionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController editionController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController additionalInfoController =
      TextEditingController();

  String selectedCategory = 'Masters';
  File? _image;

  Future<void> _uploadImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _addBook() async {
    if (_image == null) {
      // Handle the case where the user didn't pick an image
      return;
    }

    try {
      // Upload image to Firebase Storage with content type set to 'image/jpeg'
      final Reference storageReference = FirebaseStorage.instance
          .ref()
          .child('book_images/${DateTime.now()}.jpg');
      await storageReference.putFile(
        _image!,
        SettableMetadata(contentType: 'image/jpeg'),
      );

      // Get the download URL of the uploaded image
      final String imageUrl = await storageReference.getDownloadURL();

      // Add book details to Firebase Firestore in the 'books' collection
      await FirebaseFirestore.instance.collection('books').add({
        'name': nameController.text,
        'author': authorController.text,
        'condition': conditionController.text,
        'price': double.parse(priceController.text),
        'edition': editionController.text,
        'address': addressController.text,
        'additional_info': additionalInfoController.text,
        'category': selectedCategory,
        'image_url': imageUrl,
      });

      // Clear the input fields and image selection
      nameController.clear();
      authorController.clear();
      conditionController.clear();
      priceController.clear();
      editionController.clear();
      addressController.clear();
      additionalInfoController.clear();
      setState(() {
        _image = null;
      });

      // Show a success message or navigate to a different page
      QuickAlert.show(context: context, type: QuickAlertType.success);
      // ...
    } catch (error) {
      // Handle the error
      print(error);
      QuickAlert.show(context: context, type: QuickAlertType.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        leading: BackButton(
          color: color1,
        ),
        centerTitle: true,
        title: Text(
          'Add Book',
          style: TextStyle(fontSize: 20, fontFamily: regular, color: color1),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Book Name'),
              ),
              TextFormField(
                controller: authorController,
                decoration: InputDecoration(labelText: 'Author'),
              ),
              TextFormField(
                controller: conditionController,
                decoration: InputDecoration(labelText: 'Condition'),
              ),
              TextFormField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Price'),
              ),
              TextFormField(
                controller: editionController,
                decoration: InputDecoration(labelText: 'Edition'),
              ),
              TextFormField(
                controller: addressController,
                decoration: InputDecoration(labelText: 'Address'),
              ),
              TextFormField(
                controller: additionalInfoController,
                decoration: InputDecoration(labelText: 'Additional Info'),
              ),
              SizedBox(height: 20),
              DropdownButton<String>(
                value: selectedCategory,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedCategory = newValue!;
                  });
                },
                items: <String>['Masters', 'Bachelors', 'High School', 'Extra']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _uploadImage,
                child: Text('Pick Image'),
              ),
              _image != null
                  ? Image.file(
                      _image!,
                      height: 100,
                      width: 100,
                    )
                  : Container(),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _addBook,
                child: Text('Add Book'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

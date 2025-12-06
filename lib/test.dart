import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(Test());
}

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InputHomePage(),
    );
  }
}

class myHome extends StatelessWidget {
  const myHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Demo"), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Matha Nosto!",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                height: 5.00,
              ),
            ),
            SizedBox(height: 20),

            //Circle Avatar
            Text('Circle Avatar'),
          ],
        ),
      ),
    );
  }
}

class InputHomePage extends StatefulWidget {
  const InputHomePage({super.key});

  @override
  State<InputHomePage> createState() => _InputHomePageState();
}

class _InputHomePageState extends State<InputHomePage> {
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();
  TextEditingController numberCtrl = TextEditingController();
  TextEditingController multiLineCtrl = TextEditingController();

  String? selectedGender;
  bool agree = false;
  bool notificationOn = false;
  DateTime? selectedDate;
  File? pickedImage;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        pickedImage = File(pickedFile.path);
      });
    }
  }

  Future<void> pickImageVia(ImageSource source) async {
    final picker = ImagePicker();

    try {
      final pickedFile = await picker.pickImage(source: source);
      if (pickedFile != null) {
        setState(() {
          pickedImage = File(pickedFile.path);
        });
      }
    } catch (e) {
      print("Error Picking Image: $e");
    }
  }

  void openImageSourceDialog() {
    showDialog(
      context: context,
      builder: (dialogCtx) {
        return AlertDialog(
          title: const Text("Select Image Source"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text("Gallery"),
                onTap: () {
                  Navigator.of(dialogCtx, rootNavigator: true).pop();
                  pickImageVia(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text("Camera"),
                onTap: () {
                  Navigator.of(dialogCtx, rootNavigator: true).pop();
                  pickImageVia(ImageSource.camera);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // void _showToast() {
  //   Fluttertoast.showToast(
  //     msg:
  //         "Name: ${nameCtrl.text}\nEmail: ${emailCtrl.text}\nPassword: ${passCtrl.text}\nNumber: ${numberCtrl.text}\nMultiline: ${multiLineCtrl.text}",
  //     toastLength: Toast.LENGTH_LONG,
  //     gravity: ToastGravity.BOTTOM,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Input Fields Example")),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          //Image
          Text(
            "Profile Picture",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),

          Center(
            child: GestureDetector(
              onTap: pickImage,
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey,
                backgroundImage: pickedImage != null
                    ? FileImage(pickedImage!)
                    : null,
                child: pickedImage == null
                    ? Icon(Icons.camera_alt, size: 50, color: Colors.white)
                    : null,
              ),
            ),
          ),

          SizedBox(height: 20),
          //Image Picker
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.camera_alt),
                    iconSize: 40,
                    onPressed: () {
                      pickImageVia(ImageSource.camera);
                    },
                  ),
                  Text("Camera"),
                ],
              ),

              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.photo),
                    iconSize: 40,
                    onPressed: () {
                      pickImageVia(ImageSource.gallery);
                    },
                  ),
                  Text("Gallery"),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: openImageSourceDialog,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
            ),
            child: const Text("Pick Image"),
          ),
          SizedBox(height: 20),
          //Name

          TextField(
            controller: nameCtrl,
            decoration: InputDecoration(
              labelText: "Name",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),

          //Name
          TextField(
            controller: emailCtrl,
            decoration: InputDecoration(
              labelText: "Email",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),

          //Name
          TextField(
            controller: passCtrl,
            decoration: InputDecoration(
              labelText: "Password",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),

          //Name
          TextField(
            controller: numberCtrl,
            decoration: InputDecoration(
              labelText: "Phone Number",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),

          //Name
          TextField(
            controller: multiLineCtrl,
            maxLines: 3,
            decoration: InputDecoration(
              labelText: "Full Address",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),

          //Gender DropDown
          DropdownButtonFormField<String>(
            value: selectedGender,
            decoration: InputDecoration(
              labelText: "Gender",
              border: OutlineInputBorder(),
            ),
            items: [
              "Male",
              "Female",
              "Others",
            ].map((g) => DropdownMenuItem(value: g, child: Text(g))).toList(),
            onChanged: (value) {
              setState(() {
                selectedGender = value;
              });
            },
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'db_helper.dart';
import 'user.dart';

class UserForm extends StatefulWidget {
  final User? user;
  const UserForm({super.key, this.user});

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _formKey = GlobalKey<FormState>();

  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final ageCtrl = TextEditingController();
  final dobCtrl = TextEditingController();

  String gender = 'Male';
  bool isActive = true;
  String dob = '';

  @override
  void initState() {
    super.initState();
    if (widget.user != null) {
      nameCtrl.text = widget.user!.name;
      emailCtrl.text = widget.user!.email;
      ageCtrl.text = widget.user!.age.toString();
      gender = widget.user!.gender;
      dob = widget.user!.dob;
      dobCtrl.text = dob;
      isActive = widget.user!.isActive;
    }
  }

  void pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: dob.isNotEmpty ? DateTime.parse(dob) : DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        dob = picked.toIso8601String().split('T')[0];
        dobCtrl.text = dob;
      });
    }
  }

  void saveUser() async {
    if (!_formKey.currentState!.validate()) return;

    final user = User(
      id: widget.user?.id,
      name: nameCtrl.text,
      email: emailCtrl.text,
      age: int.parse(ageCtrl.text),
      gender: gender,
      dob: dob,
      isActive: isActive,
    );

    final db = DatabaseHelper();

    widget.user == null ? await db.insertUser(user) : await db.updateUser(user);

    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Form')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: nameCtrl,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (v) => v!.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: emailCtrl,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (v) => !v!.contains('@') ? 'Invalid Email' : null,
              ),
              TextFormField(
                controller: ageCtrl,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Age'),
              ),
               TextFormField(
                controller: dobCtrl,
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: 'Date of Birth',
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                onTap: pickDate,
                validator: (v) => v!.isEmpty ? 'Select DOB' : null,
              ),
              DropdownButtonFormField(
                value: gender,
                items: ['Male', 'Female', 'Other']
                    .map((g) => DropdownMenuItem(value: g, child: Text(g)))
                    .toList(),
                onChanged: (v) => setState(() => gender = v!),
                decoration: const InputDecoration(labelText: 'Gender'),
              ),
              SwitchListTile(
                value: isActive,
                title: const Text('Active'),
                onChanged: (v) => setState(() => isActive = v),
              ),
              ElevatedButton(onPressed: saveUser, child: const Text('SAVE')),
            ],
          ),
        ),
      ),
    );
  }
}

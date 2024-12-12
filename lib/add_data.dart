import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:aplikasi_makanan/main.dart';

class AddNewDataPage extends StatefulWidget {
  @override
  _AddNewDataPageState createState() => _AddNewDataPageState();
}

class _AddNewDataPageState extends State<AddNewDataPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _namaProdukController = TextEditingController();
  final TextEditingController _hargaController = TextEditingController();
  String? _kategoriProduk = 'Makanan';
  File? _selectedFile;

  // Function to pick a file
  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image, // Allows only images
    );

    if (result != null && result.files.single.path != null) {
      setState(() {
        _selectedFile = File(result.files.single.path!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Data"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => MyApp()),
              (Route<dynamic> route) => false,
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(height: 20),

              // Product Name Field
              TextFormField(
                controller: _namaProdukController,
                decoration: InputDecoration(
                  labelText: 'Nama Produk',
                  hintText: 'Masukan nama produk',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama produk tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              // Price Field
              TextFormField(
                controller: _hargaController,
                decoration: InputDecoration(
                  labelText: 'Harga',
                  hintText: 'Masukan Harga',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Harga tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              // Category Dropdown
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Kategori produk',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                value: _kategoriProduk,
                items: <String>['Makanan', 'Minuman'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _kategoriProduk = newValue;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Kategori tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              // File Picker
              GestureDetector(
                onTap: pickFile,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.attach_file),
                      SizedBox(width: 10),
                      Text(
                        _selectedFile != null ? 'File selected' : 'Choose file',
                      ),
                    ],
                  ),
                ),
              ),

              // Display selected file preview (if image)
              if (_selectedFile != null &&
                  (['.jpg', '.jpeg', '.png'].contains(
                      _selectedFile!.path.split('.').last.toLowerCase())))
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Image.file(_selectedFile!),
                ),
              SizedBox(height: 30),

              // Submit Button
              ElevatedButton(
               onPressed: () {
  if (_formKey.currentState!.validate()) {
    // Handle the null check for file path
    final String? filePath = _selectedFile?.path;

    // Create a new item object to return
    final newItem = {
      'name': _namaProdukController.text,
      'price': _hargaController.text,
      'kategori': _kategoriProduk ?? '', // Default to empty string if null
      'file': filePath, // file can be null or a valid path
    };

    // Return the new item and navigate back
    Navigator.pop(context, newItem);

    print('Form is valid, item added');
  } else {
    print('Form is invalid');
  }
},

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 150, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

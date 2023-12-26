import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddCar extends StatefulWidget {
  const AddCar({Key? key}) : super(key: key);

  @override
  State<AddCar> createState() => _AddCarState();
}

class _AddCarState extends State<AddCar> {
  final _carnameController = TextEditingController();
  final _colorController = TextEditingController();
  final _cartypeController = TextEditingController();
  final _modelController = TextEditingController();
  final _costController = TextEditingController();

  @override
  void dispose() {
    _carnameController.dispose();
    _colorController.dispose();
    _cartypeController.dispose();
    _modelController.dispose();
    _costController.dispose();
    super.dispose();
  }

  Future addcar() async {
    if (detalifields()) {
      addCarDetails(
        _carnameController.text.trim(),
        _colorController.text.trim(),
        _cartypeController.text.trim(),
        _modelController.text.trim(),
        int.parse(_costController.text.trim()),
      );
      _carnameController.clear();
      _colorController.clear();
      _cartypeController.clear();
      _modelController.clear();
      _costController.clear();
    }
  }

  Future addCarDetails(String carname, String color, String cartype,
      String model, int cost) async {
    await FirebaseFirestore.instance.collection('car').add({
      'car name': carname,
      'color': color,
      'car type': cartype,
      'model': model,
      'cost': cost,
    });
  }

  bool detalifields() {
    if (_carnameController.text.isNotEmpty &&
        _colorController.text.isNotEmpty &&
        _cartypeController.text.isNotEmpty &&
        _modelController.text.isNotEmpty &&
        _costController.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.deepPurple,
        title: const Text('Add Car Details'),
        centerTitle: false,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _carnameController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Car Name',
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _colorController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Car Color',
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _cartypeController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Car Type',
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _modelController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Car Model',
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _costController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Car Cost',
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: GestureDetector(
                    onTap: addcar,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.deepPurple[400],
                          borderRadius: BorderRadius.circular(12)),
                      child: const Center(
                        child: Text(
                          'ADD',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

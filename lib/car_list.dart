import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'widgets/list_widget.dart';

class CarList extends StatefulWidget {
  const CarList({super.key});

  @override
  State<CarList> createState() => _CarListState();
}

class _CarListState extends State<CarList> {
  final columns = ['Name', 'Color', 'Type', 'Model', 'Cost'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.deepPurple,
        title: const Text('Car Detail List'),
        centerTitle: false,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('car').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          final rows = snapshot.data!.docs.map(
            (QueryDocumentSnapshot doc) {
              Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
              return DataRow(
                cells: <DataCell>[
                  DataCell(Text(data['car name'])),
                  DataCell(Text(data['color'])),
                  DataCell(Text(data['car type'])),
                  DataCell(Text(data['model'])),
                  DataCell(Text(data['cost'].toString())),
                ],
                onSelectChanged: (value) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Edit/Delete Row'),
                        content: const Text(
                            'What would you like to do with this row?'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              FirebaseFirestore.instance
                                  .collection('car')
                                  .doc(doc.id)
                                  .delete();
                              Navigator.of(context).pop();
                            },
                            child: const Text('Delete'),
                          ),
                          TextButton(
                            child: const Text('Edit'),
                            onPressed: () {
                              Navigator.of(context).pop();
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  final TextEditingController
                                      carNameController = TextEditingController(
                                          text: data['car name']);
                                  final TextEditingController colorController =
                                      TextEditingController(
                                          text: data['color']);
                                  final TextEditingController
                                      carTypeController = TextEditingController(
                                          text: data['car type']);
                                  final TextEditingController modelController =
                                      TextEditingController(
                                          text: data['model']);
                                  final TextEditingController costController =
                                      TextEditingController(
                                          text: data['cost'].toString());
                                  return AlertDialog(
                                    title: const Text('Edid Row'),
                                    content: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          TextField(
                                            controller: carNameController,
                                            decoration: const InputDecoration(
                                              labelText: 'Car Name',
                                            ),
                                          ),
                                          TextField(
                                            controller: colorController,
                                            decoration: const InputDecoration(
                                              labelText: 'Color',
                                            ),
                                          ),
                                          TextField(
                                            controller: carTypeController,
                                            decoration: const InputDecoration(
                                              labelText: 'Type',
                                            ),
                                          ),
                                          TextField(
                                            controller: modelController,
                                            decoration: const InputDecoration(
                                              labelText: 'Model',
                                            ),
                                          ),
                                          TextField(
                                            controller: costController,
                                            decoration: const InputDecoration(
                                              labelText: 'Cost',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        child: const Text('Cancel'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      TextButton(
                                        child: const Text('Update'),
                                        onPressed: () {
                                          FirebaseFirestore.instance
                                              .collection('car')
                                              .doc(doc.id)
                                              .update({
                                                'car name':
                                                    carNameController.text,
                                                'color': colorController.text,
                                                'car type':
                                                    carTypeController.text,
                                                'model': modelController.text,
                                                'cost': int.parse(
                                                    costController.text),
                                              })
                                              .then((value) =>
                                                  Navigator.of(context).pop())
                                              .catchError((error) => Text(
                                                  'Failed to update row: $error'));
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              );
            },
          ).toList();

          return ScrollableWidget(
            child: DataTable(columns: getColumns(columns), rows: rows),
          );
        },
      ),
    );
  }

  List<DataColumn> getColumns(List<String> columns) {
    return columns.map(
      (String column) {
        return DataColumn(
          label: Text(
            column,
            style: const TextStyle(fontSize: 16, color: Colors.deepPurple),
          ),
        );
      },
    ).toList();
  }
}

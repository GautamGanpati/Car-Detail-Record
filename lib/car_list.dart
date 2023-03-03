import 'package:cardetail_project/cardatamodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'widgets/list_widget.dart';

class CarList extends StatefulWidget {
  const CarList({super.key});

  @override
  State<CarList> createState() => _CarListState();
}

class _CarListState extends State<CarList> {

  @override
  Widget build(BuildContext context) {
    final columns = ['Car Name', 'Color', 'Type', 'Model', 'Cost'];
    final rows = [];

    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.deepPurple,
        title: Text('Car Detail List'),
        centerTitle: false,
      ),
      body: ScrollableWidget(
        child: DataTable(columns: getColumns(columns), rows: <DataRow>[
          DataRow(cells: <DataCell>[
            DataCell(Text('Aston')),
            DataCell(Text('Black')),
            DataCell(Text('AC')),
            DataCell(Text('S15')),
            DataCell(Text('2000000')),
          ]),
        ],
        )),
    );
  }

  List<DataColumn> getColumns(List<String> columns) {
  return columns.map((String Column) {
    return DataColumn(
      label: Text(Column),
      );
  }).toList();
  }

  // List<DataRow> getRows(List<DataRow> rows) => cars.map((Car car) {
  //   final cells = [car.Name, car.Color, car.Model, car.Type, car.Cost];

  //   return DataRow(
  //     cells: Utils.modelBuilder(cells, (index, cell) {
  //       return DataCell(Text('$rows'),
  //       showEditIcon: true,
  //       );
  //     }),
  //   );
  // }
  // );

}

class GetRow extends StatefulWidget {
  const GetRow({super.key});

  @override
  State<GetRow> createState() => _GetRowState();
}

class _GetRowState extends State<GetRow> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('car').snapshots(),
      builder:(BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if(!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        List<DataRow> rows =
              snapshot.data!.docs.map((QueryDocumentSnapshot doc) {
            Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
            return DataRow(cells: [
              DataCell(Text(data['car name'])),
              DataCell(Text(data['color'])),
              DataCell(Text(data['car type'])),
              DataCell(Text(data['model'])),
              DataCell(Text('\$${data['cost']}')),
            ]);
          }).toList();
          print(rows);
          return DataTable(
            columns: [
              DataColumn(label: Text('Name')),
              DataColumn(label: Text('Color')),
              DataColumn(label: Text('Type')),
              DataColumn(label: Text('Model')),
              DataColumn(label: Text('Cost')),
            ],
            rows: rows,
          );
      });
  }
}
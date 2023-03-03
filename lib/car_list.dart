// import 'package:cardetail_project/cardatamodel.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// import 'car.dart';

// class CarList extends StatefulWidget {
//   const CarList({super.key});

//   @override
//   State<CarList> createState() => _CarListState();
// }

// class _CarListState extends State<CarList> {

//   @override
//   Widget build(BuildContext context) {
//     final columns = ['Car Name', 'Color', 'Type', 'Model', 'Cost'];

//     return ScrollableWidget(
//       child: DataTable(columns: getColumns(columns), rows: getRows(cars),));
//   }

//   List<DataColumn> getColumns(List<String> columns) {
//   return columns.map((String Column) {
//     return DataColumn(
//       label: Text(Column),
//       );
//   }).toList();
//   }

//   List<CarDataModel> getRows(List<DataRow> rows) => cars.map((Car car) {
//     final cells = [car.name, car.type, car.color, car.model, car.cost];

//     return DataRow(
//       cells: Utils.modelBuilder(cells, (index, cell) {
//         return DataCell(Text('$cell'),
//         );
//       }),
//     );
//   }
//   );

// }

// class GetRow extends StatefulWidget {
//   const GetRow({super.key});

//   @override
//   State<GetRow> createState() => _GetRowState();
// }

// class _GetRowState extends State<GetRow> {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance.collection('car').snapshots(),
//       builder:(BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if(!snapshot.hasData) {
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//         List<DataRow> rows =
//               snapshot.data!.docs.map((QueryDocumentSnapshot doc) {
//             Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
//             return DataRow(cells: [
//               DataCell(Text(data['car name'])),
//               DataCell(Text(data['color'])),
//               DataCell(Text(data['car type'])),
//               DataCell(Text(data['model'])),
//               DataCell(Text('\$${data['cost']}')),
//             ]);
//           }).toList();
//           print(rows);
//           return DataTable(
//             columns: [
//               DataColumn(label: Text('Name')),
//               DataColumn(label: Text('Color')),
//               DataColumn(label: Text('Type')),
//               DataColumn(label: Text('Model')),
//               DataColumn(label: Text('Cost')),
//             ],
//             rows: rows,
//           );
//       });
//   }
// }


// // class CarList extends StatefulWidget {
// //   final List<Car> cars;
// //   final void Function(Car) onEdit;
// //   final void Function(Car) onDelete;

// //   CarList({
// //     Key? key,
// //     required this.cars,
// //     required this.onEdit,
// //     required this.onDelete,
// //   }) : super(key: key);

// //   @override
// //   _CarListState createState() => _CarListState();
// // }

// // class _CarListState extends State<CarList> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return DataTable(
// //       columns: [
// //         DataColumn(label: Text('Name')),
// //         DataColumn(label: Text('Color')),
// //         DataColumn(label: Text('Type')),
// //         DataColumn(label: Text('Model')),
// //         DataColumn(label: Text('Cost')),
// //         DataColumn(label: Text('Actions')),
// //       ],
// //       rows: widget.cars.map((car) {
// //         return DataRow(
// //           cells: [
// //             DataCell(Text(car.name)),
// //             DataCell(Text(car.color)),
// //             DataCell(Text(car.type)),
// //             DataCell(Text(car.model)),
// //             DataCell(Text('${car.cost}')),
// //             DataCell(Row(
// //               children: [
// //                 IconButton(
// //                   icon: Icon(Icons.edit),
// //                   onPressed: () {
// //                     widget.onEdit(car);
// //                   },
// //                 ),
// //                 IconButton(
// //                   icon: Icon(Icons.delete),
// //                   onPressed: () {
// //                     widget.onDelete(car);
// //                   },
// //                 ),
// //               ],
// //             )),
// //           ],
// //         );
// //       }).toList(),
// //     );
// //   }
// // }
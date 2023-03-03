import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Utils {
static List<T> modelBuilder<M, T>(
  List<M> models, T Function(int index, M model) builder
)=> models
.asMap()
.map<int, T>((index, model) => MapEntry(index, builder(index, model))).values.toList();

}

class ScrollableWidget extends StatelessWidget {
  final Widget child;
  const ScrollableWidget({super.key, required this.child, });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( 
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: child,
      ),
    );
  }
}
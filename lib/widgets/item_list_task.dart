import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ItemListTask extends ConsumerStatefulWidget {
  const ItemListTask({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ItemListTaskState();
}

class _ItemListTaskState extends ConsumerState<ItemListTask> {
  @override
  Widget build(BuildContext context) {
    final Color colorItem = Theme.of(context).colorScheme.onPrimary;
    final Color colorLine = Theme.of(context).colorScheme.error;
    const double initHeight = 88;
    return Container(
      padding: const EdgeInsets.all(3),
      margin: const EdgeInsets.only(bottom: 16),
      height: initHeight,
      decoration: BoxDecoration(
        color: colorItem,
        borderRadius: BorderRadius.circular(5), // Set the borderRadius
      ),
      child: Row(
        children: <Widget>[
          const Expanded(
            child: Column(children: <Widget>[
              Expanded(child: Text('09:10 AM')),
              Expanded(child: Text('09:10 AM'))
            ]),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: colorItem,
                border: const Border(
                  left: BorderSide(
                    color: Colors.black, // Màu sắc của đường kẻ bên trái
                    width: 2.0, // Độ dày của đường kẻ bên trái
                  ),
                ),
              ),
            ),
          ),
          const Expanded(
            flex: 2,
            child: Column(children: <Widget>[
              Expanded(child: Text('09:10 AM')),
              Expanded(child: Text('09:10 AM'))
            ]),
          ),
        ],
      ),
    );
  }
}

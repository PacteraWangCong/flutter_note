import 'package:flutter/material.dart';

typedef MFIndexStackComplete = Widget Function(BuildContext context, int index);

class MFIndexStack extends StatefulWidget {
  final int index;
  final int itemCount;
  final MFIndexStackComplete currentItem;

  MFIndexStack({Key key, this.index, this.itemCount, this.currentItem}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MFIndexStackState();
}

class _MFIndexStackState extends State<MFIndexStack> {

  List<Widget> items = List();

  @override
  void initState() {
    super.initState();
    if (items.length == 0) {
      for (int i = 0; i < widget.itemCount; i++) {
        items.add(SizedBox(
          key: Key(i.toString()),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (items[widget.index].key == Key(widget.index.toString())) {
      items[widget.index] = widget.currentItem(context, widget.index);
    }
    return IndexedStack(
      index: widget.index,
      children: items,
    );
  }
}

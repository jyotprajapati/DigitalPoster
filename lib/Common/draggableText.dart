import 'package:flutter/material.dart';

class DraggableTextWidget extends StatefulWidget {
  final double initialX;
  final double initialY;
  final String text;
  TextStyle textStyle;
  final void Function(String) onTextChanged;

  DraggableTextWidget({
    Key? key,
    required this.initialX,
    required this.initialY,
    required this.text,
    required this.textStyle,
    required this.onTextChanged,
  }) : super(key: key);

  @override
  _DraggableTextWidgetState createState() => _DraggableTextWidgetState();
}

class _DraggableTextWidgetState extends State<DraggableTextWidget> {
  late double x;
  late double y;
  late TextEditingController textEditingController;
  bool showMenue = false;
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    x = widget.initialX;
    y = widget.initialY;
    textEditingController = TextEditingController(text: widget.text);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 0),
      left: x,
      top: y,
      child: GestureDetector(
        onDoubleTap: () {
          _showMenu(context);
        },
        onTap: () {
          focusNode.requestFocus();
        },
        child: Column(
          children: [
            if (showMenue) _editingMenu(),
            Draggable(
              feedback: Material(
                color: Colors.transparent,
                child: Text(
                  textEditingController.text,
                  style: widget.textStyle,
                ),
              ),
              child: IntrinsicWidth(
                child: TextField(
                  focusNode: focusNode,
                  controller: textEditingController,
                  style: widget.textStyle,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  onChanged: widget.onTextChanged,
                ),
              ),
              onDragEnd: (details) {
                setState(() {
                  x = details.offset.dx;
                  y = details.offset.dy;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showMenu(BuildContext context) async {
    final result = await showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 200,
          child: Column(
            children: [
              ListTile(
                title: Text('Font Size'),
                onTap: () => Navigator.of(context).pop('font_size'),
              ),
              ListTile(
                title: Text('Font Weight'),
                onTap: () => Navigator.of(context).pop('font_weight'),
              ),
              ListTile(
                title: Text('Font Color'),
                onTap: () => Navigator.of(context).pop('font_color'),
              ),
            ],
          ),
        );
      },
    );

    if (result == 'font_size') {
      _editFontSize(context);
    } else if (result == 'font_weight') {
    } else if (result == 'font_color') {}
  }

  void _editFontSize(BuildContext context) async {
    final result = await showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text('Font Size'),
          children: [
            TextFormField(
              initialValue: widget.textStyle.fontSize.toString(),
              keyboardType: TextInputType.number,
              onSaved: (value) {
                setState(() {
                  widget.textStyle = widget.textStyle.copyWith(
                    fontSize: double.parse(value!),
                  );
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  Widget _editingMenu() {
    return Container(
      width: 100,
      height: 100,
      color: Colors.red,
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              widget.textStyle = widget.textStyle.copyWith(
                fontWeight: FontWeight.bold,
              );
              setState(() {
                showMenue = false;
              });
            },
            icon: Icon(Icons.format_bold),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.format_italic),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.format_underlined),
          ),
        ],
      ),
    );
  }
}

import 'package:boilerplate/constants/font_family.dart';
import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  ExpandableText(this.text);

  final String text;
  bool isExpanded = false;

  @override
  _ExpandableTextState createState() => new _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText>
    with TickerProviderStateMixin<ExpandableText> {
  @override
  Widget build(BuildContext context) {
    return new Column(children: <Widget>[
      new AnimatedSize(
          duration: const Duration(milliseconds: 500),
          child: new ConstrainedBox(
              constraints: widget.isExpanded
                  ? new BoxConstraints()
                  : new BoxConstraints(maxHeight: 100.0),
              child: new Text(
                widget.text,
                softWrap: true,
                overflow: TextOverflow.fade,style: DefaultFont.light,
              ))),
      widget.isExpanded
          ? new TextButton(onPressed: () => setState(() => widget.isExpanded = false), child: Text('Moins',style: DefaultFont.bold,))
          : new TextButton(
          child:  Text('Lire la suite',style: DefaultFont.light.copyWith(fontSize: 11),),
          onPressed: () => setState(() => widget.isExpanded = true))
    ]);
  }
}

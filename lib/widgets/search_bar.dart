import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final bool hideLeft;
  final String hint;
  final void Function() rightButtonClick;
  final ValueChanged<String> onChanged;

  SearchBar(
      {Key key,
      this.hideLeft,
      this.hint,
      this.rightButtonClick,
      this.onChanged});

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  bool showClear = false;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: _inputBox(),
        ),
        _warpTap(
            Container(
              padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
              child: Text(
                '搜索',
                style: TextStyle(color: Colors.blue, fontSize: 17),
              ),
            ),
            widget.rightButtonClick)
      ],
    );
  }

  _inputBox() {
    return Container(
      height: 30,
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      decoration: BoxDecoration(
          color: Color(0xffededed), borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [
          Icon(
            Icons.search,
            size: 20,
            color: Color(0xffa9a9a9),
          ),
          Expanded(
              flex: 1,
              child: TextField(
                controller: _controller,
                onChanged: _onChange,
                autofocus: true,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                    fontWeight: FontWeight.w300),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  hintText: widget.hint ?? '',
                  hintStyle: TextStyle(fontSize: 15),
                ),
              )),
          showClear
              ? _warpTap(
                  Icon(
                    Icons.clear,
                    size: 22,
                    color: Colors.grey,
                  ), () {
                  setState(() {
                    _controller.clear();
                  });
                  _onChange('');
                })
              : Container()
        ],
      ),
    );
  }

  _onChange(String text) {
    setState(() {
      showClear = text.length > 0;
    });
    if (widget.onChanged != null) {
      widget.onChanged(text);
    }
  }

  _warpTap(Widget child, void Function() callBack) {
    return GestureDetector(
      onTap: () {
        if (callBack != null) callBack();
      },
      child: child,
    );
  }
}

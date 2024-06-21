import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trener_app/widgets/navbar/navbar.dart';
import 'package:trener_app/widgets/service/navbar_scroll.dart';

class StackWindPattern extends StatefulWidget {
  StackWindPattern({
    super.key,
    required this.children,
    required this.page,
    required this.setPage,
    });
  Widget children;
  String page;
  final Function(String) setPage;

  @override
  State<StackWindPattern> createState() => _StackWindPatternState();
}

class _StackWindPatternState extends State<StackWindPattern> {
  ScrollController _scrollController = ScrollController();
  bool _isAtTop = true;


    @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    setState(() {
      _isAtTop = _scrollController.position.pixels == 0;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Stack(
        fit: StackFit.expand,
        children: [
          ListView(
            controller: _scrollController,
            children: [
              widget.children
            ],
          ),
          _isAtTop ? Navbar(page: widget.page,setPage:widget.setPage ,) : NavbarScroll()
        ],
      );;
  }
}
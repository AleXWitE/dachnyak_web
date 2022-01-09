import 'package:dachnyak_web/commons/widgets/header_widget.dart';
import 'package:dachnyak_web/commons/widgets/service_catalog_widget.dart';
import 'package:dachnyak_web/commons/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class TermsPage extends StatefulWidget {
  TermsPage({Key? key}) : super(key: key);

  @override
  _TermsPageState createState() => _TermsPageState();
}

class _TermsPageState extends State<TermsPage> {
  final GlobalKey _titleTermsKey = GlobalKey();
  late ScrollController _scrollController;
  Curve curve = Curves.easeIn;

  bool _showCatalog = false;
  bool _showUpButton = false;

  late double heightOfTitle;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController(
      initialScrollOffset: 0.0,
      keepScrollOffset: true,
    );
  }

  void _titleInfo() {
    final RenderBox renderBox =
    _titleTermsKey.currentContext?.findRenderObject() as RenderBox;
    _titleTermsKey.currentContext?.size;

    final Size size = renderBox.size;

    setState(() {
      heightOfTitle = size.height;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= heightOfTitle) {
        setState(() {
          _showUpButton = true;
          _showCatalog = true;
        });
      } else {
        setState(() {
          _showUpButton = false;
          _showCatalog = false;
        });
      }
    });

    Future.delayed(const Duration(milliseconds: 1), _titleInfo);

    return Scaffold(
      body: Column(children: [
        const SizedBox(height: 40.0, child: HeaderLine()),
        _showCatalog ? ServiceCatalog() : Container(),
        SizedBox(
            height: MediaQuery.of(context).size.height - 40.0,
            child: ListView(controller: _scrollController, children: [
              Column(
                key: _titleTermsKey,
                children: [
                  TitleHeader(),
                  ServiceCatalog(),
                ],
              ),
              Container(height: 1000.0, color: Colors.pinkAccent,),

            ]))
      ]),
      floatingActionButton: !_showUpButton
          ? null
          : FloatingActionButton(
          tooltip: "К началу сайта",
          child: const Icon(
            Icons.arrow_circle_up,
            color: Colors.teal,
            size: 65.0,
          ),
          elevation: 0.0,
          hoverElevation: 0.0,
          backgroundColor: const Color.fromARGB(0, 0, 0, 0),
          onPressed: () => _scrollController.animateTo(0.0,
              duration: const Duration(milliseconds: 800), curve: curve)),
    );
  }
}
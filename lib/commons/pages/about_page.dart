import 'package:dachnyak_web/commons/widgets/header_widget.dart';
import 'package:dachnyak_web/commons/widgets/service_catalog_widget.dart';
import 'package:dachnyak_web/commons/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final GlobalKey _titleKey = GlobalKey();
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
        _titleKey.currentContext?.findRenderObject() as RenderBox;
    _titleKey.currentContext?.size;

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
                key: _titleKey,
                children: [
                  TitleHeader(),
                  ServiceCatalog(),
                ],
              ),
              Container(height: 1000.0, color: Colors.blue,),
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

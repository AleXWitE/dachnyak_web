import 'package:dachnyak_web/commons/widgets/header_widget.dart';
import 'package:dachnyak_web/commons/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class ArticlesPage extends StatefulWidget {
  ArticlesPage({Key? key}) : super(key: key);

  @override
  _ArticlesPageState createState() => _ArticlesPageState();

}

class _ArticlesPageState extends State<ArticlesPage> {
  final GlobalKey _titleKey = GlobalKey();
  late ScrollController _scrollController;
  Curve curve = Curves.easeIn;

  bool _showCatalog = false;
  bool _showUpButton = false;

  late double heightOfTitle;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: [
            Container(
                height: 50.0,
                child: const HeaderLine()),
            Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height - 50.0,
              child: ListView(
                children: [
                  TitleHeader(),
                ],
              ),
            )
          ]
      ),
    );  }
}
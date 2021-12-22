import 'package:dachnyak_web/commons/widgets/header_widget.dart';
import 'package:dachnyak_web/commons/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class ExamplesPage extends StatefulWidget {
  ExamplesPage({Key? key}) : super(key: key);

  @override
  _ExamplesPageState createState() => _ExamplesPageState();

}

class _ExamplesPageState extends State<ExamplesPage> {
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
    );
  }
}
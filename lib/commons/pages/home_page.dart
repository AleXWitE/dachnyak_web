import 'package:dachnyak_web/commons/models/provider_model.dart';
import 'package:dachnyak_web/commons/widgets/header_widget.dart';
import 'package:dachnyak_web/commons/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<ProviderModel>(context);

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 40.0,
              child: const HeaderLine()),
          Container(
            height: MediaQuery.of(context).size.height - 40.0,
            child: ListView(
              children: [
                TitleHeader(),
                SizedBox(height: 10000,)
              ],
            ),
          )
        ]
      ),
    );
  }
}

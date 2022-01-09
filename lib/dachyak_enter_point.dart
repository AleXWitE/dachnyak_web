import 'package:dachnyak_web/commons/models/provider_model.dart';
import 'package:dachnyak_web/commons/pages/price_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'commons/pages/about_page.dart';
import 'commons/pages/articles_page.dart';
import 'commons/pages/contact_page.dart';
import 'commons/pages/discount_page.dart';
import 'commons/pages/examples_page.dart';
import 'commons/pages/home_page.dart';
import 'commons/pages/qa_page.dart';
import 'commons/pages/terms_page.dart';

class Dachnyak extends StatelessWidget {
  const Dachnyak({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<ProviderModel>(context);

    return MaterialApp(
      title: _provider.siteTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.green,
        accentColor: Colors.cyan,
      ),
      home: HomePage(),
      initialRoute: '/home',
      routes: {
        '/home': (BuildContext context) => HomePage(),
        '/contacts': (BuildContext context) => ContactPage(),
        '/q_a': (BuildContext context) => QAPage(),
        '/terms': (BuildContext context) => TermsPage(),
        '/discount': (BuildContext context) => DiscountPage(),
        // '/articles': (BuildContext context) => ArticlesPage(),
        '/examples': (BuildContext context) => ExamplesPage(),
        '/about': (BuildContext context) => AboutPage(),
        '/price': (BuildContext context) => PricePage(),
  },
    );
  }
}

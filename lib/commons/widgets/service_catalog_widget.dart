import 'package:dachnyak_web/commons/models/provider_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ServiceCatalog extends StatefulWidget {
  ServiceCatalog({Key? key}) : super(key: key);

  @override
  _ServiceCatalogState createState() => _ServiceCatalogState();
}

class _ServiceCatalogState extends State<ServiceCatalog> {
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
    final _provider = Provider.of<ProviderModel>(context);
    final _provTitle = _provider.siteTitle;

    final _popupMenu = PopupMenuButton(
      onSelected: (value) => Navigator.pushNamed(context, '$value'),
        padding: EdgeInsets.zero,
        tooltip: "Открыть каталог услуг",
        child: Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Row(
            children: const [
              Icon(
                Icons.menu,
                size: 30.0,
                color: Colors.white,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text("КАТАЛОГ УСЛУГ", style: TextStyle(fontSize: 24.0, color: Colors.white),)),
            ],
          ),
        ),
        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[

          const PopupMenuDivider(height: 2.0,),
          PopupMenuItem(
              mouseCursor: SystemMouseCursors.click,
              onTap: () {
                _provider.changeTitle("Примеры работ");
              },
              value: '/examples',
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: _provTitle == "Примеры работ"
                      ? Colors.greenAccent
                      : Colors.white,
                  child: const Text("Примеры работ"))),
          const PopupMenuDivider(height: 2.0,),
          PopupMenuItem(
              mouseCursor: SystemMouseCursors.click,
              onTap: () {
                _provider.changeTitle("Акции");
              },
              value: '/discount',
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: _provTitle == "Акции"
                      ? Colors.greenAccent
                      : Colors.white,
                  child: const Text("Акции"))),
          const PopupMenuDivider(height: 2.0,),
          PopupMenuItem(
              mouseCursor: SystemMouseCursors.click,
              onTap: () {
                _provider.changeTitle("Термины");
              },
              value: '/terms',
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: _provTitle == "Термины"
                      ? Colors.greenAccent
                      : Colors.white,
                  child: const Text("Термины"))),
          const PopupMenuDivider(height: 2.0,),
          PopupMenuItem(
              mouseCursor: SystemMouseCursors.click,
              onTap: () {
                _provider.changeTitle("Частые вопросы");
              },
              value: '/q_a',
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: _provTitle == "Частые вопросы"
                      ? Colors.greenAccent
                      : Colors.white,
                  child: const Text("Частые вопросы"))),
          const PopupMenuDivider(height: 2.0,),
          PopupMenuItem(
              mouseCursor: SystemMouseCursors.click,
              onTap: () {
                _provider.changeTitle("О компании");
              },
              value: '/about',
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: _provTitle == "О компании"
                      ? Colors.greenAccent
                      : Colors.white,
                  child: const Text("О компании"))),
          const PopupMenuDivider(height: 2.0,),
          PopupMenuItem(
              mouseCursor: SystemMouseCursors.click,
              onTap: () {
                _provider.changeTitle("Контакты");
              },
              value: '/contacts',
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: _provTitle == "Контакты"
                      ? Colors.greenAccent
                      : Colors.white,
                  child: const Text("Контакты"))),
        ]);


    return Container(
      height: 50.0,
      width: MediaQuery.of(context).size.width,
      color: Colors.teal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_popupMenu,],
      ),
    );
  }
}

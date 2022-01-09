import 'package:dachnyak_web/commons/models/provider_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeaderLine extends StatefulWidget {
  const HeaderLine({Key? key}) : super(key: key);

  @override
  State<HeaderLine> createState() => _HeaderLineState();
}

class _HeaderLineState extends State<HeaderLine> {
  bool _isOpen = false;

  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<ProviderModel>(context);
    final _provTitle = _provider.siteTitle;

    final rowHeader = Container(
        height: 50.0,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          MaterialButton(
              child: const Text("О компании"),
              minWidth: 100.0,
              height: 50.0,
              color: _provTitle == "О компании"
                  ? Colors.greenAccent[300]
                  : Colors.white,
              onPressed: () {
                _provider.changeTitle("О компании");
                Navigator.pushNamed(context, '/about');
              }),
          MaterialButton(
              child: const Text("Примеры работ"),
              minWidth: 100.0,
              height: 50.0,
              color: _provTitle == "Примеры работ"
                  ? Colors.greenAccent[300]
                  : Colors.white,
              onPressed: () {
                _provider.changeTitle("Примеры работ");
                Navigator.pushNamed(context, '/examples');
              }),
          // MaterialButton(
          //     child: const Text("Статьи"),
          //     minWidth: 100.0,
          //     height: 50.0,
          //     color: _provTitle == "Статьи"
          //         ? Colors.greenAccent[300]
          //         : Colors.white,
          //     onPressed: () {
          //       _provider.changeTitle("Статьи");
          //       Navigator.pushNamed(context, '/articles');
          //     }),
          MaterialButton(
              child: const Text("Акции"),
              minWidth: 100.0,
              height: 50.0,
              color: _provTitle == "Акции"
                  ? Colors.greenAccent[300]
                  : Colors.white,
              onPressed: () {
                _provider.changeTitle("Акции");
                Navigator.pushNamed(context, '/discount');
              }),
          MaterialButton(
              child: const Text("Термины"),
              minWidth: 100.0,
              height: 50.0,
              color: _provTitle == "Термины"
                  ? Colors.greenAccent[300]
                  : Colors.white,
              onPressed: () {
                _provider.changeTitle("Термины");
                Navigator.pushNamed(context, '/terms');
              }),
          MaterialButton(
              child: const Text("Частые вопросы"),
              minWidth: 100.0,
              height: 50.0,
              color: _provTitle == "Частые вопросы"
                  ? Colors.greenAccent[300]
                  : Colors.white,
              onPressed: () {
                _provider.changeTitle("Частые вопросы");
                Navigator.pushNamed(context, '/q_a');
              }),
          MaterialButton(
              child: const Text("Контакты"),
              minWidth: 100.0,
              height: 50.0,
              color: _provTitle == "Контакты"
                  ? Colors.greenAccent[300]
                  : Colors.white,
              onPressed: () {
                _provider.changeTitle("Контакты");
                Navigator.pushNamed(context, '/contacts');
              })
        ]));

    // final _popupMenu = PopupMenuButton(
    //     padding: EdgeInsets.zero,
    //     tooltip: "Открыть меню",
    //     onSelected: (value) => Navigator.pushNamed(context, '$value'),
    //     child: Padding(
    //       padding: EdgeInsets.only(left: 10.0),
    //       child: Row(
    //         children: const [
    //           Icon(
    //             Icons.menu,
    //             size: 20.0,
    //           ),
    //           Padding(
    //               padding: EdgeInsets.symmetric(horizontal: 10.0),
    //               child: Text("Меню")),
    //         ],
    //       ),
    //     ),
    //     itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
    //       const PopupMenuDivider(height: 2.0,),
    //       PopupMenuItem(
    //               mouseCursor: SystemMouseCursors.click,
    //               onTap: () {
    //                 _provider.changeTitle("О компании");
    //                 // Navigator.popAndPushNamed(context, '/about');
    //               },
    //               value: 'about',
    //               child: Container(
    //                   width: MediaQuery.of(context).size.width,
    //                   color: _provTitle == "О компании"
    //                       ? Colors.greenAccent
    //                       : Colors.white,
    //                   child: const Text("О компании"))),
    //           const PopupMenuDivider(height: 2.0,),
    //           PopupMenuItem(
    //               mouseCursor: SystemMouseCursors.click,
    //               onTap: () {
    //                 _provider.changeTitle("Примеры работ");
    //                 // Navigator.pushNamed(context, '/examples');
    //               },
    //               value: 'examples',
    //               child: Container(
    //                   width: MediaQuery.of(context).size.width,
    //                   color: _provTitle == "Примеры работ"
    //                       ? Colors.greenAccent
    //                       : Colors.white,
    //                   child: const Text("Примеры работ"))),
    //       const PopupMenuDivider(height: 2.0,),
    //       //     PopupMenuItem(
    //       //         mouseCursor: SystemMouseCursors.click,
    //       //         onTap: () {
    //       //           // _provider.changeTitle("Статьи");
    //       //           // Navigator.pushNamed(context, '/articles');
    //       //         },
    //       //         value: 'articles',
    //       //         child: Container(
    //       //             width: MediaQuery.of(context).size.width,
    //       //             color: _provTitle == "Статьи"
    //       //                 ? Colors.greenAccent
    //       //                 : Colors.white,
    //       //             child: const Text("Статьи"))),
    //       // const PopupMenuDivider(height: 2.0,),
    //           PopupMenuItem(
    //               mouseCursor: SystemMouseCursors.click,
    //               onTap: () {
    //                 // _provider.changeTitle("Акции");
    //                 // Navigator.pushNamed(context, '/discount');
    //               },
    //               value: 'discount',
    //               child: Container(
    //                   width: MediaQuery.of(context).size.width,
    //                   color: _provTitle == "Акции"
    //                       ? Colors.greenAccent
    //                       : Colors.white,
    //                   child: const Text("Акции"))),
    //       const PopupMenuDivider(height: 2.0,),
    //           PopupMenuItem(
    //               mouseCursor: SystemMouseCursors.click,
    //               onTap: () {
    //                 // _provider.changeTitle("Термины");
    //                 // Navigator.pushNamed(context, '/terms');
    //               },
    //               value: 'terms',
    //               child: Container(
    //                   width: MediaQuery.of(context).size.width,
    //                   color: _provTitle == "Термины"
    //                       ? Colors.greenAccent
    //                       : Colors.white,
    //                   child: const Text("Термины"))),
    //       const PopupMenuDivider(height: 2.0,),
    //           PopupMenuItem(
    //               mouseCursor: SystemMouseCursors.click,
    //               onTap: () {
    //                 // _provider.changeTitle("Частые вопросы");
    //                 // Navigator.pushNamed(context, '/q_a');
    //               },
    //               value: 'q_a',
    //               child: Container(
    //                   width: MediaQuery.of(context).size.width,
    //                   color: _provTitle == "Частые вопросы"
    //                       ? Colors.greenAccent
    //                       : Colors.white,
    //                   child: const Text("Частые вопросы"))),
    //       const PopupMenuDivider(height: 2.0,),
    //           PopupMenuItem(
    //               mouseCursor: SystemMouseCursors.click,
    //               onTap: () {
    //                 // _provider.changeTitle("Контакты");
    //                 // Navigator.pushNamed(context, '/contacts');
    //               },
    //               value: 'contacts',
    //               child: Container(
    //                   width: MediaQuery.of(context).size.width,
    //                   color: _provTitle == "Контакты"
    //                       ? Colors.greenAccent
    //                       : Colors.white,
    //                   child: const Text("Контакты"))),
    //       const PopupMenuDivider(height: 2.0,),
    //     ]);

    final drawerHeader = Container(
      height: 25.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PopupMenuButton(
              padding: EdgeInsets.zero,
              onSelected: (value) => Navigator.pushNamed(context, '$value'),
              tooltip: "Открыть меню",
              child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Row(
                  children: const [
                    Icon(
                      Icons.menu,
                      size: 20.0,
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text("Меню")),
                  ],
                ),
              ),
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuDivider(height: 2.0,),
                PopupMenuItem(
                    mouseCursor: SystemMouseCursors.click,
                    onTap: () {
                      _provider.changeTitle("О компании");
                      // Navigator.pushNamed(context, '/about');
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
                      _provider.changeTitle("Примеры работ");
                      // Navigator.pushNamed(context, '/examples');
                    },
                    value: '/examples',
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        color: _provTitle == "Примеры работ"
                            ? Colors.greenAccent
                            : Colors.white,
                        child: const Text("Примеры работ"))),
                const PopupMenuDivider(height: 2.0,),
                // PopupMenuItem(
                //     mouseCursor: SystemMouseCursors.click,
                //     onTap: () {
                //       _provider.changeTitle("Статьи");
                //       // Navigator.pushNamed(context, '/articles');
                //     },
                //     value: '/articles',
                //     child: Container(
                //         width: MediaQuery.of(context).size.width,
                //         color: _provTitle == "Статьи"
                //             ? Colors.greenAccent
                //             : Colors.white,
                //         child: const Text("Статьи"))),
                // const PopupMenuDivider(height: 2.0,),
                PopupMenuItem(
                    mouseCursor: SystemMouseCursors.click,
                    onTap: () {
                      _provider.changeTitle("Акции");
                      // Navigator.pushNamed(context, '/discount');
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
                      // Navigator.pushNamed(context, '/terms');
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
                      // Navigator.pushNamed(context, '/q_a');
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
                      _provider.changeTitle("Контакты");
                      // Navigator.pushNamed(context, '/contacts');
                    },
                    value: '/contacts',
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        color: _provTitle == "Контакты"
                            ? Colors.greenAccent
                            : Colors.white,
                        child: const Text("Контакты"))),
                const PopupMenuDivider(height: 2.0,),
              ]),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: MaterialButton(
                child: const Text(
                  "Цены на 2022",
                  style: TextStyle(fontSize: 16.0),
                ),
                minWidth: 100.0,
                color: _provTitle == "Цены на 2022"
                    ? Colors.greenAccent
                    : Colors.lightBlue,
                onPressed: () {
                  _provider.changeTitle("Цены на 2022");
                  Navigator.pushNamed(context, '/price');
                }),
          )
        ],
      ),
    );

    final pcRowHeader = Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
            height: 50.0,
            child: Row(children: [
              MaterialButton(
                  child: const Text("О компании"),
                  minWidth: 100.0,
                  height: 50.0,
                  color: _provTitle == "О компании"
                      ? Colors.greenAccent[300]
                      : Colors.white,
                  onPressed: () {
                    _provider.changeTitle("О компании");
                    Navigator.pushNamed(context, '/about');
                  }),
              MaterialButton(
                  child: const Text("Примеры работ"),
                  minWidth: 100.0,
                  height: 50.0,
                  color: _provTitle == "Примеры работ"
                      ? Colors.greenAccent[300]
                      : Colors.white,
                  onPressed: () {
                    _provider.changeTitle("Примеры работ");
                    Navigator.pushNamed(context, '/examples');
                  }),
              MaterialButton(
                  child: const Text("Статьи"),
                  minWidth: 100.0,
                  height: 50.0,
                  color: _provTitle == "Статьи"
                      ? Colors.greenAccent[300]
                      : Colors.white,
                  onPressed: () {
                    _provider.changeTitle("Статьи");
                    Navigator.pushNamed(context, '/articles');
                  }),
              MaterialButton(
                  child: const Text("Акции"),
                  minWidth: 100.0,
                  height: 50.0,
                  color: _provTitle == "Акции"
                      ? Colors.greenAccent[300]
                      : Colors.white,
                  onPressed: () {
                    _provider.changeTitle("Акции");
                    Navigator.pushNamed(context, '/discount');
                  }),
              MaterialButton(
                  child: const Text("Термины"),
                  minWidth: 100.0,
                  height: 50.0,
                  color: _provTitle == "Термины"
                      ? Colors.greenAccent[300]
                      : Colors.white,
                  onPressed: () {
                    _provider.changeTitle("Термины");
                    Navigator.pushNamed(context, '/terms');
                  }),
              MaterialButton(
                  child: const Text("Частые вопросы"),
                  minWidth: 100.0,
                  height: 50.0,
                  color: _provTitle == "Частые вопросы"
                      ? Colors.greenAccent[300]
                      : Colors.white,
                  onPressed: () {
                    _provider.changeTitle("Частые вопросы");
                    Navigator.pushNamed(context, '/q_a');
                  }),
              MaterialButton(
                  child: const Text("Контакты"),
                  minWidth: 100.0,
                  height: 50.0,
                  color: _provTitle == "Контакты"
                      ? Colors.greenAccent[300]
                      : Colors.white,
                  onPressed: () {
                    _provider.changeTitle("Контакты");
                    Navigator.pushNamed(context, '/contacts');
                  })
            ])),
        MaterialButton(
            child: const Text(
              "Цены на 2022",
              style: TextStyle(fontSize: 16.0),
            ),
            minWidth: 100.0,
            color: _provTitle == "Цены на 2022"
                ? Colors.greenAccent
                : Colors.lightBlue,
            onPressed: () {
              _provider.changeTitle("Цены на 2022");
              Navigator.pushNamed(context, '/price');
            }),
      ],
    );

    if (MediaQuery.of(context).size.width < 750) {
      // return drawerHeader;
      return drawerHeader;
    } else if (MediaQuery.of(context).size.width > 750 &&
        MediaQuery.of(context).size.width < 945) {
      return rowHeader;
    } else {
      return pcRowHeader;
    }
  }
}

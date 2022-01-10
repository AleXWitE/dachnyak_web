import 'package:dachnyak_web/commons/models/data_models.dart';
import 'package:dachnyak_web/commons/models/provider_model.dart';
import 'package:dachnyak_web/commons/widgets/header_widget.dart';
import 'package:dachnyak_web/commons/widgets/service_catalog_widget.dart';
import 'package:dachnyak_web/commons/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey _titleKey = GlobalKey();
  late ScrollController _scrollController;
  Curve curve = Curves.easeIn;

  bool _showCatalog = false;
  bool _showUpButton = false;

  late double heightOfTitle;

  List<CatalogBlockModel> catalogList = [
    CatalogBlockModel(
        id: 0,
        hover: false,
        title: "О компании",
        img:
            "https://pbs.twimg.com/profile_images/947873659938639878/oXpMnav3.jpg",
        link: '/about'),
    CatalogBlockModel(
        id: 1,
        hover: false,
        title: "Примеры работ",
        img: "https://r.mt.ru/r27/photoFA17/20485183647-0/jpg/bp.jpeg",
        link: '/examples'),
    CatalogBlockModel(
        id: 2,
        hover: false,
        title: "Акции",
        img:
            "https://avatars.mds.yandex.net/get-zen_doc/1706643/pub_5e10f1d398930900b3abc45f_5e18b32c3642b600afd3a2dd/scale_1200",
        link: '/discount'),
    CatalogBlockModel(
        id: 3,
        hover: false,
        title: "Контакты",
        img:
            "https://im0-tub-ru.yandex.net/i?id=db45bd28e86ee0a06050cfbdef12ee67-l&ref=rim&n=13&w=1068&h=1315",
        link: '/contacts'),
  ];

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
    final _provider = Provider.of<ProviderModel>(context);

    Widget galleryBlockHeader = Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(100, 0, 0, 0),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: const Text(
        "Дачняк",
        style: TextStyle(
            color: Colors.white, fontSize: 36.0, fontWeight: FontWeight.bold),
      ),
    );

    Widget galleryBlockDesc = Container(
      padding: const EdgeInsets.all(20.0),
      width: MediaQuery.of(context).size.width / 1.5,
      decoration: BoxDecoration(
        color: const Color.fromARGB(100, 0, 0, 0),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: const Text(
        "Все сроки прописаны в договоре",
        style: TextStyle(color: Colors.white, fontSize: 36.0),
      ),
    );

    Widget galleryBlockSubscription = Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(100, 0, 0, 0),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: const Text(
        "Многолетний опыт позволяет спрогнозировать все возможные риски",
        style: TextStyle(color: Colors.white, fontSize: 20.0),
      ),
    );

    Widget galleryBlock = Container(
        color: Colors.greenAccent[400],
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Positioned(top: 25.0, left: 50.0, child: galleryBlockHeader),
            Positioned(top: 140.0, left: 50.0, child: galleryBlockDesc),
            Positioned(
                bottom: 200.0,
                left: 50.0,
                right: 50.0,
                child: galleryBlockSubscription),
          ],
        ));

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

    // Widget videoBlock = Container(
    //   width: MediaQuery.of(context).size.width,
    //   height: MediaQuery.of(context).size.height,
    //   color: const Color.fromARGB(255, 200, 200, 200),
    //   child: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //       children: [
    //         const Text(
    //           "Наше видео",
    //           style: TextStyle(fontSize: 36.0),
    //         ),
    //         const Divider(
    //           color: Colors.teal,
    //           height: 5.0,
    //           thickness: 5.0,
    //         ),
    //         Container(
    //           width: MediaQuery.of(context).size.width - 100.0,
    //           height: MediaQuery.of(context).size.height - 250.0,
    //           color: Colors.blueGrey,
    //           child: const Center(child: Text("Video")),
    //         ),
    //       ],
    //     ),
    //   ),
    // );

    Widget infoBlock = Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
      color: Colors.greenAccent,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Дачняк",
              style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold)),
          const Text("оказываем услуги", style: TextStyle(fontSize: 30.0)),
          const Text(
              "по расчистке, озеленению и обустройству приусадебных участков ",
              style: TextStyle(fontSize: 20.0)),
          MediaQuery.of(context).size.width < 750
              ? const Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                  child: Divider(
                    height: 3.0,
                    thickness: 3.0,
                    color: Colors.teal,
                  ))
              : const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Divider(
                    height: 3.0,
                    thickness: 3.0,
                    color: Colors.teal,
                  )),
          MediaQuery.of(context).size.width < 750
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 200.0,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.blueGrey,
                        child: const Center(
                          child: Text("Picture"),
                        ),
                      ),
                      const Text(
                        "\nДачняк",
                        style: TextStyle(
                            fontSize: 36.0, fontWeight: FontWeight.bold),
                      ),
                      const Text("оказываем услуги",
                          style: TextStyle(fontSize: 30.0)),
                      const Text(
                          "по расчистке, озеленению и обустройству приусадебных участков ",
                          style: TextStyle(fontSize: 20.0)),
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      Container(
                        height: 200.0,
                        width: (MediaQuery.of(context).size.width / 2) - 60.0,
                        color: Colors.blueGrey,
                        child: const Center(
                          child: Text("Picture"),
                        ),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 2) - 80.0,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Дачняк",
                                style: TextStyle(
                                    fontSize: 36.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text("оказываем услуги",
                                  style: TextStyle(fontSize: 30.0)),
                              Text(
                                  "по расчистке, озеленению и обустройству приусадебных участков ",
                                  style: TextStyle(fontSize: 20.0)),
                            ]),
                      ),
                    ],
                  ),
                )
        ],
      ),
    );

    Widget _catalogColumn = Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            for (var item in catalogList)
              Column(children: [
                MouseRegion(
                  onEnter: (event) {
                    setState(() {
                      item.hover = !item.hover;
                    });
                  },
                  onExit: (event) {
                    setState(() {
                      item.hover = !item.hover;
                    });
                  },
                  child: Container(
                    height: 500.0,
                    width: MediaQuery.of(context).size.width - 40.0,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    ),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Positioned(
                            top: 0.0,
                            bottom: 0.0,
                            left: 0.0,
                            right: 0.0,
                            child: Image.network(
                              item.img,
                              fit: BoxFit.cover,
                            )),
                        item.hover != true
                            ? Container()
                            : Positioned(
                                top: 0.0,
                                bottom: 0.0,
                                left: 0.0,
                                right: 0.0,
                                child: Container(
                                  color: const Color.fromARGB(100, 0, 0, 0),
                                )),
                        Positioned(
                            left: 20.0,
                            bottom: 20.0,
                            child: item.hover != true
                                ? Text(
                                    item.title,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 30.0,
                                        fontWeight: FontWeight.bold),
                                  )
                                : MaterialButton(
                                    height: 40.0,
                                    color: Colors.cyan,
                                    minWidth: 250.0,
                                    child: const Center(
                                        child: Text(
                                      "Подробнее",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.bold),
                                    )),
                                    onPressed: () {
                                      _provider.changeTitle(item.title);
                                      Navigator.pushNamed(context, item.link);
                                    })),
                        item.hover != true
                            ? Container()
                            : Positioned(
                                left: 20.0,
                                top: 20.0,
                                child: Text(
                                  item.title,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold),
                                )),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25.0,
                )
              ]),
          ],
        ));

    Widget _catalogRow = Padding(padding: const EdgeInsets.symmetric(horizontal: 20.0), child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        for (var item in catalogList)
          Row(children: [
            MouseRegion(
              onEnter: (event) {
                setState(() {
                  item.hover = !item.hover;
                });
              },
              onExit: (event) {
                setState(() {
                  item.hover = !item.hover;
                });
              },
              child: item.id == 0 && MediaQuery.of(context).size.width > 750 && MediaQuery.of(context).size.width < 1124
                  ? Container()
                  : Container(
                height: 500.0,
                width: MediaQuery.of(context).size.width > 750 && MediaQuery.of(context).size.width < 1124
                    ? (MediaQuery.of(context).size.width - 200.0) / 3
                    : (MediaQuery.of(context).size.width - 200.0) / 4,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Positioned(
                        top: 0.0,
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Image.network(
                          item.img,
                          fit: BoxFit.cover,
                        )),
                    item.hover != true
                        ? Container()
                        : Positioned(
                        top: 0.0,
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          color: const Color.fromARGB(100, 0, 0, 0),
                        )),
                    Positioned(
                        left: 20.0,
                        bottom: 20.0,
                        child: item.hover != true
                            ? Text(
                          item.title,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold),
                        )
                            : MaterialButton(
                            height: 40.0,
                            color: Colors.cyan,
                            minWidth: 250.0,
                            child: const Center(
                                child: Text(
                                  "Подробнее",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold),
                                )),
                            onPressed: () {
                              _provider.changeTitle(item.title);
                              Navigator.pushNamed(context, item.link);
                            })),
                    item.hover != true
                        ? Container()
                        : Positioned(
                        left: 20.0,
                        top: 20.0,
                        child: Text(
                          item.title,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: item.id != 3 ? 25.0 : 0.0,
            )
          ]),
      ],
    ));

    Widget catalogBlock = Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
      color: Colors.greenAccent[100],
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Каталог услуг",
              style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold)),
          MediaQuery.of(context).size.width < 750
              ? const Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                  child: Divider(
                    height: 3.0,
                    thickness: 3.0,
                    color: Colors.teal,
                  ))
              : const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Divider(
                    height: 3.0,
                    thickness: 3.0,
                    color: Colors.teal,
                  )),
          MediaQuery.of(context).size.width < 750 ? _catalogColumn : _catalogRow
        ],
      ),
    );

    Future.delayed(const Duration(milliseconds: 1), _titleInfo);

    return Scaffold(
      body: Column(children: [
        const SizedBox(height: 40.0, child: HeaderLine()),
        _showCatalog ? ServiceCatalog() : Container(),
        SizedBox(
          height: MediaQuery.of(context).size.height - 40.0,
          child: ListView(
            controller: _scrollController,
            children: [
              Column(
                key: _titleKey,
                children: [
                  TitleHeader(),
                  ServiceCatalog(),
                ],
              ),
              galleryBlock,
              const Divider(
                height: 1.0,
                color: Colors.blueGrey,
              ),
              infoBlock,
              const Divider(
                height: 1.0,
                color: Colors.blueGrey,
              ),
              catalogBlock,
              const Divider(
                height: 1.0,
                color: Colors.blueGrey,
              ),
              // videoBlock,
              Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.green, Colors.blue],
                        stops: [0.5, 1.0])),
                height: 10000,
              )
            ],
          ),
        )
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

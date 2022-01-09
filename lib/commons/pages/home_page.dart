import 'package:dachnyak_web/commons/models/provider_model.dart';
import 'package:dachnyak_web/commons/widgets/header_widget.dart';
import 'package:dachnyak_web/commons/widgets/service_catalog_widget.dart';
import 'package:dachnyak_web/commons/widgets/title_widget.dart';
import 'package:flutter/material.dart';
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
        color: Colors.greenAccent,
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

    Widget videoBlock = Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: const Color.fromARGB(255, 200, 200, 200),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "Наше видео",
              style: TextStyle(fontSize: 36.0),
            ),
            const Divider(
              color: Colors.teal,
              height: 5.0,
              thickness: 5.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 100.0,
              height: MediaQuery.of(context).size.height - 250.0,
              color: Colors.blueGrey,
              child: const Center(child: Text("Video")),
            ),
          ],
        ),
      ),
    );

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

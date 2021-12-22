import 'package:dachnyak_web/commons/models/provider_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TitleHeader extends StatefulWidget {
  TitleHeader({Key? key}) : super(key: key);

  @override
  State<TitleHeader> createState() => _TitleHeaderState();
}

class _TitleHeaderState extends State<TitleHeader> {
  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<ProviderModel>(context);

    final logoButton = MaterialButton(
        color: Colors.greenAccent,
        child: Container(
          width: 320.0,
          height: 80.0,
          child: Text(
            "Здесь Лого и Название сайта, в виде картинки",
            style: TextStyle(fontSize: 30.0),
          ),
        ),
        onPressed: () {
          _provider
              .changeTitle("dachnyak.ru | Сайт по услугам ландшафного дизайна");
          Navigator.pushNamed(context, '/home');
        });

    final telNumber = Text(
      "+7 (903) 671-13-54",
      style: TextStyle(
        fontSize: MediaQuery.of(context).size.width < 750.0 ? 18.0 : 24.0,
        fontWeight: FontWeight.bold,
      ),
    );

    final city = Text(
      "Истра",
      style: TextStyle(
          decoration: TextDecoration.underline,
          color: Colors.green,
          fontSize: 20.0),
    );

    final textAlert = MouseRegion(
      cursor: SystemMouseCursors.click,
        child: GestureDetector(
      child: Text(
        "Заказать звонок",
        style: TextStyle(
            decoration: TextDecoration.underline,
            color: Colors.green,
            fontSize: 20.0),
      ),
      onTap: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Заказать звонок'),
          content: Column(children: [
            Text('AlertDialog description'),
          ]),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('Отправитьзаявку'),
            ),
          ],
        ),
      ),
    ));

    final openTime = RichText(
      text: TextSpan(text: "c ", style: TextStyle(fontSize: 20.0), children: [
        TextSpan(text: "9:00 ", style: TextStyle(fontSize: 30.0)),
        TextSpan(text: "до ", style: TextStyle(fontSize: 20.0)),
        TextSpan(text: "19:00\n", style: TextStyle(fontSize: 30.0)),
        TextSpan(text: "без выходных и перерывов", style: TextStyle(fontSize: 16.0, fontStyle: FontStyle.italic)),
      ]),
    );

    final drawerHeaderTitle = Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        logoButton,
        telNumber,
        city,
        textAlert,
        openTime,
      ],
    ));

    final rowHeaderTitle = Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          logoButton,
          Container(
            height: 100.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [telNumber, city],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [textAlert,],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [openTime,],
                )
              ],
            ),
          )
        ],
      ),
    );

    final pcRowHeaderTitle = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        logoButton,
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [telNumber, city],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [textAlert,],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [openTime,],
        )
      ],
    );

    if (MediaQuery.of(context).size.width < 750) {
      return drawerHeaderTitle;
    } else if (MediaQuery.of(context).size.width > 750 &&
        MediaQuery.of(context).size.width < 945) {
      return rowHeaderTitle;
    } else {
      return pcRowHeaderTitle;
    }
  }
}

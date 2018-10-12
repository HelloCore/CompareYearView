import 'package:flutter/cupertino.dart';

class CalendarView extends StatelessWidget {
  final int month;
  final int year;

  CalendarView({this.month, this.year});

  Widget smallText(int date) {
    return Flexible(
      fit: FlexFit.tight,
      child: Text(date.toString(),
          style: TextStyle(
              fontSize: 10.0,
              color: date > 0
                  ? Color.fromARGB(255, 0, 0, 0)
                  : Color.fromARGB(0, 0, 0, 0)),
          textAlign: TextAlign.center),
    );
  }

  @override
  Widget build(BuildContext context) {
    var firstDate = DateTime(year, month, 1);
    var lastDate =
        DateTime(firstDate.year, firstDate.month + 1, firstDate.day - 1);

    var numOfDate = lastDate.difference(firstDate).inDays + 1;
    var startIndex = 1;
    while (firstDate.weekday != DateTime.sunday) {
      firstDate = firstDate.add(Duration(days: -1));
      startIndex -= 1;
    }

    List<Widget> weeks = List();
    weeks.add(Text(month.toString()));

    List<Widget> child = List();
    for (var i = startIndex; i <= numOfDate; i++) {
      child.add(smallText(i));
      if (child.length == 7) {
        weeks.add(Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: child,
          ),
        ));
        child = List();
      }
    }
    if (child.length > 0 && child.length < 7) {
      while (child.length < 7) {
        child.add(smallText(-1));
      }

      weeks.add(Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: child,
          )));
    }

    return Flexible(
        fit: FlexFit.tight,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(children: weeks),
        ));
  }
}

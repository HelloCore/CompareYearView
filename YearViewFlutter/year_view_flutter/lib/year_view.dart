import 'package:flutter/cupertino.dart';
import './calendar_view.dart';

class YearView extends StatefulWidget {
  final int year;

  YearView({this.year: 2018});

  @override
  _YearViewState createState() => _YearViewState();
}

class _YearViewState extends State<YearView> {
  int _year;

  @override
  void initState() {
    super.initState();
    _year = widget.year;
  }

  void nextMonth() {
    setState(() {
      _year += 1;
    });
  }

  void prevMonth() {
    setState(() {
      _year -= 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("Year View"),
        ),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 64.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CupertinoButton(child: Text("<"), onPressed: prevMonth),
                    Text(_year.toString()),
                    CupertinoButton(child: Text(">"), onPressed: nextMonth)
                  ],
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      CalendarView(month: 1, year: _year),
                      CalendarView(month: 2, year: _year),
                      CalendarView(month: 3, year: _year)
                    ],
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      CalendarView(month: 4, year: _year),
                      CalendarView(month: 5, year: _year),
                      CalendarView(month: 6, year: _year)
                    ],
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      CalendarView(month: 7, year: _year),
                      CalendarView(month: 8, year: _year),
                      CalendarView(month: 9, year: _year)
                    ],
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      CalendarView(month: 10, year: _year),
                      CalendarView(month: 11, year: _year),
                      CalendarView(month: 12, year: _year)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

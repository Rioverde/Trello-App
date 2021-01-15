import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:trello_project_test/Models/card.dart' as Models;

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();

  final List<Models.Card> list;

  Dashboard(this.list);
}

List<Widget> tab1 = List();
List<Widget> tab2 = List();
List<Widget> tab3 = List();
List<Widget> tab4 = List();

class _DashboardState extends State<Dashboard>
    with AutomaticKeepAliveClientMixin<Dashboard> {
  @override
  void initState() {
    sortList(widget.list);
    super.initState();
  }

  Card buildCard(Models.Card element) {
    return Card(
        color: Colors.grey.shade800,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text("ID:   " + element.id.toString()),
              ),
              Text(
                utf8.decode(element.text.toString().runes.toList()),
              ),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: "On hold"),
              Tab(text: "In progress"),
              Tab(text: "Needs review"),
              Tab(text: "Approved"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView(children: tab1),
            ListView(children: tab2),
            ListView(children: tab3),
            ListView(children: tab4),
          ],
        ),
      ),
    );
  }

  sortList(List<Models.Card> cardList) {
    cardList.forEach((element) {
      if (element.row == "0") {
        tab1.add(buildCard(element));
      } else if (element.row == "1") {
        tab2.add(buildCard(element));
      } else if (element.row == "2") {
        tab3.add(buildCard(element));
      } else if (element.row == "3") {
        tab4.add(buildCard(element));
      }
    });
  }

  @override
  bool get wantKeepAlive => true;
}

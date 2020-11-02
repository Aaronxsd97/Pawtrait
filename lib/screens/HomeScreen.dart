import 'package:flutter/material.dart';

import 'package:Pawtrait/widgets/CustomDrawer.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: CustomDrawer(),
        body: NestedScrollView(
          // Setting floatHeaderSlivers to true is required in order to float
          // the outer slivers over the inner scrollable.
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                title: const Text('Home'),
                pinned: true,
                expandedHeight: 200.0,
                forceElevated: innerBoxIsScrolled,
              ),
            ];
          },
          body: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: 30,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 50,
                child: Center(child: Text('Item $index')),
              );
            },
          ),
        ),
      ),
    );
  }
}

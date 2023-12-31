import 'package:flutter/material.dart';
import '../widgets/drinks_list_horizontal.dart';
import '../widgets/content_title.dart';
import '../widgets/bottom_navigation.dart';
import '../blocs/drinks_bloc_provider.dart';

class Home extends StatelessWidget {
  final _contentTitleSize = 20.0;

  @override
  Widget build(BuildContext context) {
    final bloc = DrinksProvider.of(context);


    return SafeArea(
      child: Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.orange,
          leading: Icon(Icons.coffee),
          title: Text('Drink Me | Home'),
        ),
        body: Column(
          children: <Widget>[
            Container(padding: EdgeInsets.only(top: 20)),
            ContentTitle(
              title: 'Drink Me!',
              titleSize: 34,
              titleColor: Theme.of(context).primaryColor,
              titleWeight: FontWeight.w700,
              subtitle: 'Carilah Minuman Favorit Anda!',
              subtitleSize: 20.0,
            ),
            Expanded(child: popularDrinks(bloc), flex: 3),
          ],
        ),
      ),
    );
  }

  Widget popularDrinks(bloc) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ContentTitle(
        title: 'Minuman Populer',
        titleSize: _contentTitleSize,
      ),
        Expanded(
          flex: 1,
          child: DrinksListHorizontal(stream: bloc.popular),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:great_places/providers/great_places.dart';
import 'package:great_places/utils/app_routes.dart';
import 'package:provider/provider.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus lugares'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.PLACE_FORM);
            },
          )
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false).loadPlaces(),
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(child: CircularProgressIndicator())
            : Consumer<GreatPlaces>(
                child: Center(
                  child: Text('Nenhum local cadastrado'),
                ),
                builder: (ctx, greatPlaces, child) => greatPlaces.itemsCount ==
                        0
                    ? child
                    : ListView.builder(
                        itemCount: greatPlaces.itemsCount,
                        itemBuilder: (BuildContext ctx, int i) => ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                FileImage(greatPlaces.itemByIndex(i).image),
                          ),
                          title: Text(greatPlaces.itemByIndex(i).title),
                          subtitle:
                              Text(greatPlaces.itemByIndex(i).location.address),
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                AppRoutes.PLACE_DETAIL,
                                arguments: greatPlaces.itemByIndex(i));
                          },
                        ),
                      ),
              ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mvvm_newsapp/widgets/newsgrid.dart';
import 'package:flutter_mvvm_newsapp/viewmodel/listviewmodel.dart';
import 'package:flutter_mvvm_newsapp/constant/constants.dart';

class NewScreen extends StatefulWidget {
  @override
  _NewScreenState createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ListViewModel>(context, listen: false).fetchTopNewsHeadlines();
  }

  @override
  Widget build(BuildContext context) {

    var listviewmodel = Provider.of<ListViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Text('News App'),
        actions: <Widget> [
          PopupMenuButton(

            onSelected: (country) {

              listviewmodel.fetchNewsByCountry(Constants.Countries[country]);



            },

            icon: Icon(Icons.more_vert),
            itemBuilder: (_) {

              return Constants.Countries.keys.map((v) => PopupMenuItem(value:v, child: Text(v),)).toList();
            },


          ),

        ],
      ),

      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.only(left:30, bottom: 15, top:15),
              child: Text('Headlines', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            ),

            Expanded(
              child: NewsGrid(articles: listviewmodel.articles),


            ),













          ],



        ),



      ),



    );
  }
}

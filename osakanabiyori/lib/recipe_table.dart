import 'package:flutter/material.dart';

class RecipeTable extends StatelessWidget{
  //検索条件の有無を表示する部分
  Widget serchInfoSection = Container(
    padding: const EdgeInsets.all(10),
    width: double.infinity,
    color: Colors.orange,
    child: Text('検索条件の指定なし',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );

  //検索窓を実現している部分
  Widget inputSerchWordSection = Container(
    margin: const EdgeInsets.only(bottom: 0),
    width: double.infinity,
    child: TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.find_in_page
        ),
        border: OutlineInputBorder(),
        hintText: "レシピ名を入力",
      ),
    )
  );

  //レシピひとつひとつを構成してる部分
  Widget recipeSection = Container(
    margin: const EdgeInsets.only(left: 10),
    child: Row(
      children:[
        Image.asset(
          'images/recipe_photo.png',
          width: 120,
          height: 90,
          fit: BoxFit.cover,
        ),
        Container(
          padding: const EdgeInsets.only(left: 10),
          width: 250,
          child: Text(
            'レシピ名',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          child: Icon(
            Icons.arrow_forward_ios,
            color: Colors.black54,
          ),
        ),
      ]
    ),
  );
  
  //レシピのListViewを実現してる部分
  Widget get recipeTableSection {
    return ListView.builder(
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider(
          height: 2,
        );
        return recipeSection;
      },
      itemCount: 10 * 2, //recipeSection*2の個数を指定(間に線を引くため)
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Table',
      home: Scaffold(
        appBar: AppBar(
          title: new Center(
            child: Text('レシピ一覧',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          backgroundColor: Colors.white,
        ),
        //body: recipeTableSection,
        
        body: Column(
          children: [
            inputSerchWordSection,
            serchInfoSection,
            recipeTableSection,
          ],
        ),
      ),
    );
  }
}
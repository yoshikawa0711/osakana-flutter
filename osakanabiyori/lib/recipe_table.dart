import 'package:flutter/material.dart';

class RecipeTable extends StatelessWidget{
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

  Widget recipeSection = Container(
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

  Widget buildRecipeTable() {
    return ListTile(
      title: recipeSection,
    );
  }
  
  Widget recipeTableSection() {
    return ListView.builder(
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider();
        return recipeSection;
      },
      itemCount: 10,
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
        body: Column(
          children: [
            inputSerchWordSection,
            serchInfoSection,
            //recipeSection,
            recipeTableSection(), //home:直下に置くべきか...
          ],
        ),
      ),
    );
  }
}
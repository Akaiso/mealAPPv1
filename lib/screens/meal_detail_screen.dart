import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({Key key}) : super(key: key);

  static const routeName = "/meal_detail";

  Widget buildSectionTitle(BuildContext context, String text){
    return  Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoCondensed'),
      ),
    );
  }

  Widget buildContainer(child){
    return  Container(
        decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
    borderRadius: BorderRadius.circular(10),
    ),
    margin: EdgeInsets.all(10),
    padding: EdgeInsets.all(10),
    height: 150,
    width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pinkAccent,
          title: Text(
            ' ${selectedMeal.title}',
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              buildSectionTitle(context,'Ingredients'),
          buildContainer(ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                color: Colors.orangeAccent,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10 ),
                  child: Text(selectedMeal.ingredients[index]),
                ),
              );
            },
            itemCount: selectedMeal.ingredients.length,
          )),
              buildSectionTitle(context,'Steps'),
              buildContainer(ListView.builder(
                itemBuilder: (ctx, index)=> Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.pink,
                        child: Text('# ${index +1}',style: TextStyle(color: Colors.white),),
                      ),
                      title: Text(selectedMeal.steps[index]),
                    ),
                    Divider()
                  ],
                ),
                itemCount: selectedMeal.steps.length,

              ),),

            ],
          ),
        ),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.delete),onPressed: (){
        Navigator.of(context).pop(mealId);
      },),
    );
  }
}

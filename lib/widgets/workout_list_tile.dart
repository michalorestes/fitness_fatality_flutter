import 'package:flutter/material.dart';

class WorkoutListTile extends StatelessWidget 
{
  final String name; 
  final String type; 
  final String icon;
  final String actionTitle; 
  final Function onTap;
  final Function onChipTap;

  WorkoutListTile({
    this.name = "", 
    this.type = "",
    this.icon = "", 
    this.actionTitle = "",
    this.onTap, 
    this.onChipTap
  });

  @override
  Widget build(BuildContext context) {
     return Card(
       margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(16.0),
       ),
       child: InkWell(
         borderRadius: BorderRadius.circular(16),
        onTap: (){
          onTap();
        },
        child: Container(
          height: 82,
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: Image.asset(
                      icon,
                      width: 48,
                      height: 48,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(padding:EdgeInsets.only(bottom: 4), child: Text(name)),
                      Text(type, style: TextStyle(color: Colors.grey[600]),),
                    ],
                  ),
                ],
              ),
              ActionChip(
                label: Text("Tomorrow"),
                onPressed: () {
                  onChipTap();
                },
              )
            ],
          ),
        ),
    ),
     );
  }
}
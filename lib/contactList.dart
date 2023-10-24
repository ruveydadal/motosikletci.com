import 'package:flutter/material.dart';
import 'styles.dart';

class userCard extends StatelessWidget {
  final String? name;
  final String? phone;
  final String? city;
  final String? town;
  userCard(
      {@required this.name,
      @required this.phone,
      @required this.city,
      @required this.town});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    name!.substring(0, 1),
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              SizedBox(width: 20),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  name!,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 10),
                Text(
                  phone!,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  city!,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  town!,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ]),
              Padding(padding: const EdgeInsets.only(right: 250)),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Icon(Icons.delete),
                    style: ElevatedButton.styleFrom(
                      primary: secondaryColor,
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    child: Icon(Icons.edit),
                    style: ElevatedButton.styleFrom(
                      primary: secondaryColor,
                    ),
                  )
                ],
              )
            ],
          ),
          // trailing: Text('More Info'),
        ),
      ),
    );
  }
}

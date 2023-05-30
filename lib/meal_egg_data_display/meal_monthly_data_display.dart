import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

class Meal_monthly_data_display extends StatefulWidget {
  final meal_quantity;
  Meal_monthly_data_display({super.key, required this.meal_quantity});
  @override
  State<Meal_monthly_data_display> createState() =>
      _Meal_monthly_data_displayState();
}

class _Meal_monthly_data_displayState extends State<Meal_monthly_data_display> {
  // var totallunchcount = 0;
  final food_multiplier =
      FirebaseRemoteConfig.instance.getDouble('food_multiplier');
  List<int> meal_quantity_list = [];
  List<int> meal_day_list = [];
  late int data;
  Future<void> fortotallunch(int day) async {
    if (day <= now.day) {
      int l1 = await getStaffLunchCount(day);
      int l2 = await getGuestLunchCount(day);
//(l1 + l2) != 0 &&
      if ((l1 + l2) != 0) {
        print("$day : Total : ${(l1 + l2)}");
        //meal_quantity_list = [];

        data = ((l1 + l2) * food_multiplier).round();
        meal_quantity_list.add(data);
        int meal_day = day;
        meal_day_list.add(meal_day);
      }
      print(meal_day_list);
    }
  }

  Future<int> getStaffLunchCount(int day) async {
    int count = 0;
    await FirebaseFirestore.instance
        .collection('lunch_${day}-${now.month}-${now.year}')
        .where('date', isEqualTo: '${day}-${now.month}-${now.year}')
        .where('lunch', isEqualTo: true)
        .get()
        .then(
      (QuerySnapshot querySnapshot) {
        if (querySnapshot.size == 0) return;
        count = querySnapshot.size;
        setState(() {});
      },
    );
    return count;
  }

  Future<int> getGuestLunchCount(int day) async {
    int count = 0;
    await FirebaseFirestore.instance
        .collection('lunch_${day}-${now.month}-${now.year}')
        .where('date', isEqualTo: '${day}-${now.month}-${now.year}')
        .where('guestlunch', isEqualTo: true)
        .get()
        .then(
      (QuerySnapshot querySnapshot) {
        if (querySnapshot.size == 0) return;
        count = querySnapshot.size;
        setState(() {});
      },
    );
    return count;
  }

  void initState() {
    super.initState();
    int lastDayOfMonth = DateTime(now.year, now.month + 1, 0).day;
    for (int i = 1; i < lastDayOfMonth; i++) {
      fortotallunch(i);
    }
  }

  var now = DateTime.now();
  // String meal_date = '${now.month}';

  //CollectionReference total_egg_meal_storage =
  // FirebaseFirestore.instance.collection('monthly_counting');
  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Count'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: meal_quantity_list.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(left: 4, right: 4),
              child: Card(
                color: Colors.tealAccent[100],
                child: Container(
                  padding: EdgeInsets.all(4),
                  child: Row(
                    //crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.ramen_dining,
                            size: 30,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            '${meal_quantity_list[index]}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontSize: 20,
                                ),
                          ),
                        ],
                      ),
                      Text(
                        "${meal_day_list[index]}-${now.month}-${now.year}",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 19,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

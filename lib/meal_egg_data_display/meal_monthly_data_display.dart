import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Meal_monthly_data_display extends StatefulWidget {
  final meal_quantity;
  Meal_monthly_data_display({super.key, required this.meal_quantity});
  @override
  State<Meal_monthly_data_display> createState() =>
      _Meal_monthly_data_displayState();
}

class _Meal_monthly_data_displayState extends State<Meal_monthly_data_display> {
  @override
  var totallunchcount = 0;
  Future<void> fortotallunch(int day) async {
    if (day <= now.day) {
      int l1 = await getStaffLunchCount(day);
      int l2 = await getGuestLunchCount(day);
      if ((l1 + l2) != 0) {
        print("$day : Total : ${l1 + l2}");
      }
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
  CollectionReference total_egg_meal_storage =
      FirebaseFirestore.instance.collection('monthly_counting');
  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Count'),
      ),
      body: Center(
        child: Column(
          children: [
// basic card
            Container(
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
                            '${widget.meal_quantity}',
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
                        "${now.day}-${now.month}-${now.year}",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 19,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';


//final admin = FirebaseRemoteConfig.instance.getString('lunch_admin');
  
    //final user = FirebaseAuth.instance.currentUser;
   // var email = user!.email!;
class guest_display extends StatelessWidget {


  
  const guest_display({
    super.key,
  required this.guestlunchremovecount,
  required this.guestcount,
  //required this.fixedTime,
  });
  final guestlunchremovecount;
  final  guestcount;
 // final fixedTime;

    @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        
           Expanded(
             child: Text(
              "Guest",
            textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 21,
                  ),
                     ),
           ),
        
        Padding(
          padding: EdgeInsets.only(right: 25),
          child: SizedBox(
            width: 20,
            child: Text(
              ":",
              textAlign: TextAlign.end,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 21,
                  ),
            ),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
             // if (DateTime.now().hour >= fixedTime && user?.email == admin) 

              IconButton(
           // padding: EdgeInsets.only(left: 200),
                
              onPressed: () {
                guestlunchremovecount?.call();
              },
              icon: Icon(
                Icons.add,
                color: Color.fromARGB(255, 0, 0, 0),
                
              )),
                
          
             Text(
              guestcount.toString(),
             // textAlign: TextAlign.end,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 21,
                  ),
            ),
          
          //SizedBox(width: 24,)
                
          IconButton(
              onPressed: () {
                guestlunchremovecount?.call();
              },
              icon: Icon(
                Icons.remove,
                color: Color.fromARGB(255, 0, 0, 0),
                
              ))
            ],
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';

class Internetexceptionwidget extends StatefulWidget {
  const Internetexceptionwidget({super.key});

  @override
  State<Internetexceptionwidget> createState() =>
      _InternetexceptionwidgetState();
}

class _InternetexceptionwidgetState extends State<Internetexceptionwidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * .15,
        ),
        const Icon(
          Icons.cloud_off,
          color: Colors.red,
          size: 50,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Center(
            child: Text(
              "We are unable to show the result\n Please check your connection",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(fontSize: 20),
            ),
          ),
        ),
            SizedBox(
          height: MediaQuery.sizeOf(context).height * .15,
        ),
        ElevatedButton(onPressed: () {
          
        }, child:Text("Retry",style: Theme.of(context).textTheme.bodySmall,) )
      ],
    );
  }
}

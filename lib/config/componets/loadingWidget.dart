import 'package:flutter/material.dart';

class Loadingwidget extends StatefulWidget {
  final double size;
  const Loadingwidget({super.key, this.size = 60});

  @override
  State<Loadingwidget> createState() => _LoadingwidgetState();
}

class _LoadingwidgetState extends State<Loadingwidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: widget.size,
        width: widget.size,
        child:
            // Platform.isAndroid
            //     ?
            const CircularProgressIndicator(
          color: Colors.blue,
        )
        // : const CupertinoActivityIndicator(
        //     color: Colors.blue,
        );
    //);
  }
}

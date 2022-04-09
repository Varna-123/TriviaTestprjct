import 'package:flutter/material.dart';
import 'package:trivia/router/router_constants.dart';
import 'package:trivia/sreen2/screen2.dart';

class Home_Screen extends StatelessWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Text('TRIVIA APP')),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 70, vertical: 40),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RouterConstants.screen2Route);
                        // Navigator.of(context).push(
                        //     MaterialPageRoute<MaterialPageRoute>(
                        //         builder: (_) => Screen_2()));
                      },
                      child: const Center(child: Text('TAKE TRIVIA')),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

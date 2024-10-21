import 'package:flutter/cupertino.dart';
import 'package:mycommerce/constants.dart';

class AppbarCupertino extends StatelessWidget {

  const AppbarCupertino({
    super.key,
    required this.body,
    required this.navBarTitle,
  });

  final Widget body;
  final String navBarTitle;

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
    headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget> [
    CupertinoSliverNavigationBar(
      largeTitle: Text('$navBarTitle',
        style: TextStyle(
          color: kSecondaryColor,
        ),
      ),
      backgroundColor: kPrimaryColor,
    )
          ];
        },
        body: body,
          );
  }
}
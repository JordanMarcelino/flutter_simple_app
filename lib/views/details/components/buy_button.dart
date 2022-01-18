import 'package:flutter/material.dart';

import '../../../constants.dart';

class BuyButton extends StatelessWidget {
  const BuyButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Row(
        children: [
          SizedBox(
            width: size.width / 2,
            height: 84,
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'Buy Now',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                  shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(30))))),
            ),
          ),
          SizedBox(
            width: size.width / 2,
            height: 84,
            child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Description',
                  style: TextStyle(
                      color: kTextColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
          ),
        ],
      ),
    );
  }
}

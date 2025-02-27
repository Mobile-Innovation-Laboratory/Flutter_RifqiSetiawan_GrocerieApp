import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tubes_motion/app/routes/app_pages.dart';

void showCheckoutBottomSheet(BuildContext context, RxDouble totalPrice) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Checkout',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              color: Color.fromARGB(255, 141, 139, 139),
              thickness: 2,
            ),
            ListTile(
              title: Text('Delivery'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('Select Method'),
                  Icon(Icons.chevron_right),
                ],
              ),
            ),
            ListTile(
              title: Text('Payment'),
              trailing: Icon(Icons.credit_card),
            ),
            ListTile(
              title: Text('Promo Code'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Pick discount',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('Total Cost'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    '\$${totalPrice}',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text(
              'By placing an order you agree to our Terms And Conditions',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.CHECKOUT);
              },
              child: Text(
                'Place Order',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff53B175),
                minimumSize: Size(double.infinity, 67),
              ),
            ),
          ],
        ),
      );
    },
  );
}

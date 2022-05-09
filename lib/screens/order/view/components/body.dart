import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_admin_app/screens/add_product/view_model/add_product_view_model.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        child: getOrderList(context),
      ),
    );
  }

  Widget getOrderList(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('order')
            .orderBy('order_status')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            var ite = !snapshot.hasData;
            return const SizedBox.shrink();
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (BuildContext context, int index) {
              Map<String, dynamic> data =
                  snapshot.data!.docs[index].data() as Map<String, dynamic>;

              int status = data["order_status"];
              String address_line_1 =
                  data["address_line_1"];
              String address_line_2 =  data["address_line_2"];
              String city = data["city"];
              String country = data["country"];
              String phone = data["user_contact_number"];
              String user_name = data["user_name"];
              String product_name = data["product_name"];
              String qty = data["qty"];
              String order_date = data["order_date"].toDate().toString();
              String shipped_date = data["shipped_date"].toDate().toString();
              String delivered_date = data["delivered_date"].toDate().toString();
              String cancelled_date = data["cancelled_date"].toDate().toString();
              String price = data["price"];

              return Card(
                color: getCardColor(status),
                elevation: 5,
                child: ListTile(
                  title: Text(product_name + " | "+ qty + " | "+ price + "\$"),
                  trailing: Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 12,
                    children: [
                      _getStatus(status),
                      TextButton(
                        child: const Icon(
                          Icons.arrow_circle_right_outlined,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          var ref_id = snapshot.data!.docs[index].reference.id;
                          var instance = FirebaseFirestore.instance
                              .collection('order')
                              .doc(ref_id);

                          switch (status) {
                            case 0:
                              instance.update({'order_status': 1, 'shipped_date': DateTime.now()});
                              break;
                            case 1:
                              instance.update({'order_status': 2, 'delivered_date': DateTime.now()});
                              break;
                            case 2:
                              instance.update({'order_status': 3, 'cancelled_date': DateTime.now()});
                              break;
                            case 3:
                              instance.update({'order_status': 0});
                              break;
                          }
                        },
                      ),
                    ],
                  ),
                  subtitle: Column(children: [
                    Row(
                      children: [
                        Text(user_name + " | "),
                        Text(phone),
                      ],
                    ),
                    Row(
                      children: [
                        Text(address_line_1)
                      ],
                    ),
                    Row(
                      children: [
                        Text(address_line_2)
                      ],
                    ),
                    Row(
                      children: [
                        Text(city + " | "),
                        Text(country),
                      ],
                    ),
                    Row(
                      children: [
                        _getDate(status, order_date, shipped_date,
                            delivered_date, cancelled_date),
                      ],
                    ),
                  ]),
                ),
              );
            },
          );
        });
  }

  Color? getCardColor(int status) {
    switch (status) {
      case 0:
        return Colors.lightGreen[400];
      case 1:
        return Colors.yellow[700];
      case 2:
        return Colors.blue[200];
      case 3:
        return Colors.red[400];
    }
    return Colors.grey;
  }

  Widget _getStatus(int status) {
    switch (status) {
      case 0:
        return Text("New");
      case 1:
        return Text("Shipped");
      case 2:
        return Text("Delivered");
      case 3:
        return Text("Cancelled");
    }
    return Text("Error");
  }

  Widget _getDate(int status, String order_date, String shipped_date,
      String delivered_date, String cancelled_date) {
    switch (status) {
      case 0:
        return Text(order_date);

      case 1:
        return Text(shipped_date);

      case 2:
        return Text(delivered_date);

      case 3:
        return Text(cancelled_date);
    }
    return Text(order_date);
  }
}

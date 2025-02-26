import 'package:flutter/material.dart';

class ContainerGroceriesWidget extends StatelessWidget {
  final String? title;
  final String? thumbnail;
  final double? stock;
  final double? price;
  final VoidCallback onAddTap;

  const ContainerGroceriesWidget({
    required this.title,
    required this.thumbnail,
    required this.stock,
    required this.price,
    required this.onAddTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 170,
      margin: EdgeInsets.only(right: 16),
      padding: EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Color(0xffE2E2E2),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 160,
            child: Center(
              child: Image.network(
                thumbnail ?? "",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            title ?? "",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '${stock ?? 0}, Priceg',
            style: TextStyle(
              color: Color(0xff7C7C7C),
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${price ?? 0.0}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              GestureDetector(
                onTap: onAddTap, 
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    color: Color(0xff53B175),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.add,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

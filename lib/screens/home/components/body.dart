import 'package:appjar/components/title_text.dart';
import 'package:appjar/services/fetchCategories.dart';
import 'package:appjar/services/fetchProducts.dart';
import 'package:appjar/size_config.dart';
import 'package:flutter/material.dart';

import 'categories.dart';
import 'recommond_products.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    // It enables scrolling
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Divider(height: 5),
            // Right Now product is our demo product
            FutureBuilder(
              future: fetchProducts(),
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? RecommandProducts(products: snapshot.data)
                    : Center(child: Image.asset('assets/ripple.gif'));
              },
            ),
          ],
        ),
      ),
    );
  }
}

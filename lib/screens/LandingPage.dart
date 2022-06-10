import 'package:flutter/material.dart';
import 'package:realestateapp/custom/bordeBox.dart';
import 'package:realestateapp/util/constants.dart';
import 'package:realestateapp/util/custom_data.dart';
import 'package:realestateapp/util/custom_widgets.dart';
import 'package:intl/intl.dart';

import '../util/custom_fun.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);

    final double padding = 25;
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              addVerticalSpace(padding),
              Padding(
                padding: sidePadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    BorderBox(
                        padding: EdgeInsets.all(8.0),
                        height: 50.00,
                        width: 50.00,
                        child: Icon(
                          Icons.menu,
                          color: COLOR_BLACK,
                        )),
                    BorderBox(
                        padding: EdgeInsets.all(8.0),
                        height: 50.00,
                        width: 50.00,
                        child: Icon(
                          Icons.settings,
                          color: COLOR_BLACK,
                        ))
                  ],
                ),
              ),
              addVerticalSpace(15),
              Padding(
                padding: sidePadding,
                child: Text(
                  'City',
                  style: themeData.textTheme.bodyText2,
                ),
              ),
              addVerticalSpace(10),
              Padding(
                padding: sidePadding,
                child: Text(
                  'Ashtamichira',
                  style: themeData.textTheme.headline1,
                ),
              ),
              Padding(
                padding: sidePadding,
                child: Divider(
                  height: padding,
                  color: COLOR_GREY,
                ),
              ),
              addVerticalSpace(10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    "For Sale",
                    "For Rent",
                    "<10000",
                    "Single Owner",
                    "EMI Option"
                  ].map((filter) => ChoiceOption(text: filter)).toList(),
                ),
              ),
              addVerticalSpace(10),
              Expanded(
                  child: Padding(
                    padding: sidePadding,
                    child: ListView.builder(
                      itemCount: RE_DATA.length,
                    itemBuilder: (context, index) {
                return PropertyItem(itemData: RE_DATA[index],);
              }),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class ChoiceOption extends StatelessWidget {
  final String text;

  const ChoiceOption({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: COLOR_GREY.withAlpha(25),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      margin: const EdgeInsets.only(left: 25),
      child: Text(
        text,
        style: themeData.textTheme.headline5,
      ),
    );
  }
}

class PropertyItem extends StatelessWidget {
  final dynamic itemData;
  const PropertyItem({super.key, required this.itemData});
  @override
  Widget build(BuildContext context) {

    final ThemeData themeData = Theme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius:BorderRadius.circular(25),
                  child: Image.asset(itemData['image'])),
              const Positioned(
                top: 15,
                  right: 15,
                  child:
                  BorderBox(
                padding: EdgeInsets.all(8.0),
                height: 50.00,
                width: 50.00,
                child: Icon(Icons.favorite_border,color: Colors.black,),
              ))
            ],
          ),
          addVerticalSpace(10),
          Row(
            children: [
              Text(
                "${formatCurrency(itemData['amount'])}",
                style: themeData.textTheme.headline1,),
              addHorizontalSpace(10),
              Text(
                "${itemData['address']}",
                style: themeData.textTheme.bodyText2,),

            ],
          ),
          Text(
            "${itemData['bedrooms']} bedrooms / ${itemData['bathrooms']} bathrooms",
            style: themeData.textTheme.headline5,),

        ],
      ),
    );
  }
}


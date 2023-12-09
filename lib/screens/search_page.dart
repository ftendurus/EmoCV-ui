import 'package:flutter/material.dart';

import '../models/colors.dart' as custom_colors;

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color: custom_colors.pinkPrimary,
                borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: TextField(
                  onSubmitted: (value) {},
                  controller: searchController,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                      hintText: 'Search...',
                      border: InputBorder.none),
                ),
              ),
            ),
          )),
      body: Column(
        children: [Text("Test")],
      ),
    );
  }
}

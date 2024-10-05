import 'package:flutter/material.dart';

class SearchBarContainer extends StatelessWidget {
  SearchBarContainer({Key? key}) : super(key: key);

  // const SearchBarContainer({
  //   Key? key,
  //   required TextEditingController searchController,
  // })  : _searchController = searchController,
  //       super(key: key);
  // final TextEditingController _searchController;

  final _searchController = TextEditingController();
  void clearText() {
    _searchController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      width: MediaQuery.of(context).size.width,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        controller: _searchController,
        // onChanged: (value) {
        // setState(() {});
        // },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 5),
          border: InputBorder.none,
          hintText: "Search here...",
          hintStyle: TextStyle(color: Colors.grey.shade300),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey.shade300,
            size: 25,
          ),
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear, size: 22),
            color: Colors.grey.shade300,
            onPressed: clearText,
          ),
          // suffixIcon: _searchController.text.isEmpty
          //     ? null
          //     : IconButton(
          //         icon: const Icon(Icons.clear, size: 22),
          //         color: Colors.grey.shade300,
          //         onPressed: () {
          //           _searchController.clear();
          //         },
          //       ),
        ),
      ),
    );
  }
}

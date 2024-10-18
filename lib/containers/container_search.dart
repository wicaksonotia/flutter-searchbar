import 'package:flutter/material.dart';
import 'package:searchbar/common/colors.dart';

class SearchBarContainer extends StatelessWidget {
  SearchBarContainer({super.key});

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
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        // border: Border.all(color: MyColors.main),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: _searchController,
              // onChanged: (value) {
              // setState(() {});
              // },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 5),
                border: InputBorder.none,
                hintText: "Search here...",
                hintStyle: TextStyle(
                  // color: Colors.black54,
                  color: MyColors.main,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  // color: Colors.black54,
                  color: MyColors.main,
                  size: 25,
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear, size: 22),
                  // color: Colors.black54,
                  color: MyColors.main,
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
          ),
          IconButton(
              onPressed: () {},
              // setState(() {
              //   showModalBottomSheet(
              //       // ignore: prefer_const_constructors
              //       shape: RoundedRectangleBorder(
              //         borderRadius: const BorderRadius.vertical(
              //           top: Radius.circular(25),
              //         ),
              //       ),
              //       clipBehavior: Clip.antiAliasWithSaveLayer,
              //       context: context,
              //       builder: (context) =>
              //           _custombottomSheetFilter(context));
              // });
              icon: const Icon(
                Icons.format_list_bulleted_rounded,
                // color: Colors.black54,
                color: MyColors.main,
              )),
        ],
      ),
    );
  }
}

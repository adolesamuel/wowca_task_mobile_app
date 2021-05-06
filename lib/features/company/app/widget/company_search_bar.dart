import 'package:flutter/material.dart';
import 'package:wowca_task/features/company/domain/entity/company_entity.dart';

class CompanySearchBar extends StatefulWidget {
  @override
  _CompanySearchBarState createState() => _CompanySearchBarState();
}

class _CompanySearchBarState extends State<CompanySearchBar> {
  final TextEditingController searchfilter = TextEditingController();
  String searchText;
  List<CompanyEntity> listOfCompanies = []; // populate with API names
  List<CompanyEntity> filteredCompanies =
      []; // companies after filtering with text

  //return search widget right now
  //ask gabby how he wants us to do search on database

  //on entering search text a dialog should be returned that shows the search results
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Search for Companies',
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}

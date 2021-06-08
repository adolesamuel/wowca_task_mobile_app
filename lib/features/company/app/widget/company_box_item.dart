import 'package:flutter/material.dart';
import 'package:wowca_task/core/utils/strings.dart';
import 'package:wowca_task/features/company/app/widget/company_modal_bottom_sheet.dart';
import 'package:wowca_task/features/company/domain/entity/company_entity.dart';

class CompanyBoxItem extends StatefulWidget {
  final CompanyEntity company;

  const CompanyBoxItem({Key key, this.company}) : super(key: key);
  @override
  _CompanyBoxItemState createState() => _CompanyBoxItemState();
}

class _CompanyBoxItemState extends State<CompanyBoxItem> {
  @override
  Widget build(BuildContext context) {
    //wrap with a gesture detector that creates a dialog of company data
    //and gives the user an option of joining or not
    return InkWell(
      onTap: () {
        print('company Icon pressed');
        showCompanyBottomSheet(
          context: context,
          company: widget.company,
        );
      },
      child: Container(
          height: 90,
          width: 90,
          color: Colors.grey[300],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 30.0,
                width: 30.0,
                child: widget.company.companyLogo == null
                    ? Image(
                        image: AssetImage(
                            'lib/core/assets/company_placeholder.png'))
                    : Image.file(widget.company.companyLogo),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.company.companyName == null
                      ? AppStrings.companyNameText
                      : widget.company.companyName,
                  style: TextStyle(fontSize: 10.0),
                ),
              )
            ],
          )),
    );
  }
}

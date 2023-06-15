import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ob_component/src/ob_widget/picker/address_picker/address_result.dart';
import 'package:ob_component/src/ob_widget/picker/address_picker/area_tree.dart';
import 'package:ob_component/src/ob_widget/picker/address_picker/china_area.dart';
import 'package:ob_component/src/ob_widget/picker/picker_selection_overlay.dart';
import 'package:ob_component/src/ob_widget/picker/picker_title.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

///
class AddressPicker extends StatefulWidget {
  ///
  const AddressPicker({Key? key}) : super(key: key);

  @override
  AddressPickerState createState() => AddressPickerState();
}

///
class AddressPickerState extends State<AddressPicker> {
  late FixedExtentScrollController _provinceScrollCtrl;
  late FixedExtentScrollController _cityScrollCtrl;
  late FixedExtentScrollController _townScrollCtrl;

  late List<AreaTree> _provinces;
  late AreaTree _selectedProvince;
  late AreaTree _selectedCity;
  late AreaTree _selectedTown;

  @override
  void initState() {
    _provinces = buildTree();
    _selectedProvince = _provinces.first;
    _selectedCity = _selectedProvince.child.first;
    _selectedTown = _selectedCity.child.first;

    _provinceScrollCtrl = FixedExtentScrollController();
    _cityScrollCtrl = FixedExtentScrollController();
    _townScrollCtrl = FixedExtentScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _provinceScrollCtrl.dispose();
    _cityScrollCtrl.dispose();
    _townScrollCtrl.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          PickerTitle(
            onCancelListener: Navigator.of(context).pop,
            onConfirmListener: () => Navigator.of(context).pop(
              AddressResult(
                _selectedProvince.areaCode,
                _selectedProvince.areaName,
                _selectedCity.areaCode,
                _selectedCity.areaName,
                _selectedTown.areaCode,
                _selectedTown.areaName,
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: CupertinoPicker.builder(
                    scrollController: _provinceScrollCtrl,
                    itemExtent: 40,
                    childCount: _provinces.length,
                    onSelectedItemChanged: (int index) {
                      _onProvinceChange(_provinces[index]);
                    },
                    selectionOverlay: const PickerSelectionOverlay(),
                    itemBuilder: (_, int index) {
                      return Center(
                        child: Text(
                          _provinces[index].areaName,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: CupertinoPicker.builder(
                    scrollController: _cityScrollCtrl,
                    itemExtent: 40,
                    childCount: _selectedProvince.child.length,
                    onSelectedItemChanged: (int index) {
                      _onCityChange(_selectedProvince.child[index]);
                    },
                    selectionOverlay: const PickerSelectionOverlay(),
                    itemBuilder: (_, int index) {
                      return Center(
                        child: Text(
                          _selectedProvince.child[index].areaName,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: CupertinoPicker.builder(
                    scrollController: _townScrollCtrl,
                    itemExtent: 40,
                    childCount: _selectedCity.child.length,
                    onSelectedItemChanged: (int index) {
                      _onTownChange(_selectedCity.child[index]);
                    },
                    selectionOverlay: const PickerSelectionOverlay(),
                    itemBuilder: (_, int index) {
                      return Center(
                        child: Text(
                          _selectedCity.child[index].areaName,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onCityChange(AreaTree city) {
    setState(() {
      Vibrate.feedback(FeedbackType.impact);
      _selectedCity = city;
      if (_selectedCity.areaCode.isNotEmpty) {
        _selectedTown = _selectedCity.child.first;
      }
      _townScrollCtrl.jumpToItem(0);
    });
  }

  void _onProvinceChange(AreaTree province) {
    setState(() {
      Vibrate.feedback(FeedbackType.impact);
      _selectedProvince = province;
      _selectedCity = province.child.first;
      if (_selectedCity.areaCode.isNotEmpty) {
        _selectedTown = _selectedCity.child.first;
      }
      _cityScrollCtrl.jumpToItem(0);
      _townScrollCtrl.jumpToItem(0);
    });
  }

  void _onTownChange(AreaTree town) {
    setState(() {
      Vibrate.feedback(FeedbackType.impact);
      _selectedTown = town;
    });
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:kanguka/models/chat.dart';
import 'package:kanguka/utils/styles.dart';
import 'package:kanguka/widgets/appBar.dart';

const String MIN_DATETIME = '2015-01-01';
const String MAX_DATETIME = '2021-11-25';
const String INIT_DATETIME = '2019-05-17';

class ArchivesScreen extends StatefulWidget {
  @override
  _ArchivesScreenState createState() => _ArchivesScreenState();
}

class _ArchivesScreenState extends State<ArchivesScreen> {
  bool _showTitle = true;

  DateTimePickerLocale _locale = DateTimePickerLocale.en_us;
  List<DateTimePickerLocale> _locales = DateTimePickerLocale.values;

  String _format = 'yyyy-MMMM';
  TextEditingController _formatCtrl = TextEditingController();

  DateTime _dateTime;

  @override
  void initState() {
    super.initState();
    _formatCtrl.text = _format;
    _dateTime = DateTime.parse(INIT_DATETIME);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Archives'),
      body: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: ChatModel.dummyData.length,
        itemBuilder: (context, index) {
          ChatModel _model = ChatModel.dummyData[index];
          return Column(
            children: <Widget>[
              index != 0 ? Divider(height: 12.0) : Container(),
              ListTile(
                leading: CircleAvatar(
                  radius: 24.0,
                  backgroundImage: NetworkImage(_model.avatarUrl),
                ),
                title: Text(_model.name),
                subtitle: Row(
                  children: [
                    Text(
                      _model.datetime,
                      style: TextStyle(fontSize: 12.0),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.get_app,
                          color: AppTheme.secondaryColor,
                          size: 14,
                        ),
                        Text(
                          "Téléchargé",
                          style: TextStyle(
                              color: AppTheme.secondaryColor, fontSize: 12),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          DatePicker.showDatePicker(
            context,
            pickerTheme: DateTimePickerTheme(
              showTitle: _showTitle,
              confirm: Text('Appliquer', style: TextStyle(color: Theme.of(context).primaryColor)),
              cancel:
                  Text('Annuler', style: TextStyle(color: Colors.red)),
            ),
            minDateTime: DateTime.parse(MIN_DATETIME),
            maxDateTime: DateTime.parse(MAX_DATETIME),
            initialDateTime: _dateTime,
            dateFormat: _format,
            locale: _locale,
            onClose: () => print("----- onClose -----"),
            onCancel: () => print('onCancel'),
            onChange: (dateTime, List<int> index) {
              setState(() {
                _dateTime = dateTime;
              });
            },
            onConfirm: (dateTime, List<int> index) {
              setState(() {
                _dateTime = dateTime;
              });
            },
          );
        },
        label: Text('Filtrer'),
        icon: Icon(Icons.filter_list),
        backgroundColor: Theme.of(context).primaryColor,
        tooltip: 'Trier dans les archives',
      ),
    );
  }
}

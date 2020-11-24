import 'package:bonyeza_kazi/common/constants/strings.dart';
import 'package:bonyeza_kazi/common/constants/style.dart';
import 'package:division/division.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart' as load;
import 'package:responsive_widgets/responsive_widgets.dart';

class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  Iterable<Contact> _contacts;
  String selectedContact;
  List<String> contactslist;

  @override
  void initState() {
    getContacts();
    super.initState();
  }

  Future<void> getContacts() async {
    final Iterable<Contact> contacts =
        await ContactsService.getContacts(withThumbnails: false);
    setState(() {
      _contacts = contacts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3.h,
        backgroundColor: kBlueBackgroundColor,
        centerTitle: true,
        title: TextResponsive(
          'Invite Your Friends',
          style: kAppBarTxtStyle1,
        ),
      ),
      body: _contacts != null
          ? Column(
              children: [
                SizedBoxResponsive(height: 20),
                Parent(
                  style: ParentStyle()
                    ..borderRadius(all: 5)
                    ..boxShadow(
                      color: kBoxShadowColor,
                      blur: kBoxShadowBlur,
                      offset: kBoxShadowOffset,
                    )
                    ..background.color(Colors.white)
                    ..height(60.h)
                    ..margin(left: 20.h, right: 20.h)
                    ..padding(left: 10.h)
                    ..ripple(true),
                  child: DropdownSearch<Contact>(
                    dropdownSearchDecoration: InputDecoration.collapsed(
                      hintText: 'Search for someone...',
                      hintStyle: TextStyle(
                          fontSize: 21.sp,
                          color: Colors.black54,
                          fontWeight: FontWeight.w400),
                    ),
                    mode: Mode.DIALOG,
                    items: _contacts.toList(),
                    showSearchBox: true,
                    hint: 'Search for someone...',
                    popupItemBuilder: (context, contact, itemAsStringy) {
                      return contact?.displayName != null
                          ? ContainerResponsive(
                              padding: EdgeInsets.only(left: 20.h),
                              height: 70,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: TextResponsive(contact.displayName,
                                    style: TextStyle(
                                        fontSize: 21, color: Colors.black54)),
                              ),
                            )
                          : Container();
                    },
                    showSelectedItem: false,
                    showClearButton: false,
                    itemAsString: (Contact contact) => contact?.displayName,
                    onChanged: (contact) async {
                      selectedContact =
                          contact.displayName ?? contact.phones.first.value;
                      String userContact = contact.phones.first.value;
                      String newUserContact;
                      if (userContact.startsWith('0') ||
                          userContact.startsWith('(')) {
                        newUserContact = userContact
                            .replaceFirst('0', '+254')
                            .replaceAll(' ', '');
                      } else {
                        newUserContact = userContact.replaceAll(' ', '');
                      }
                      await FlutterOpenWhatsapp.sendSingleMessage(
                          newUserContact, SOCIAL_SHARE_MESSAGE);
                    },
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: _contacts?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      Contact contact = _contacts?.elementAt(index);
                      return ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 18),
                        leading: (contact.avatar != null &&
                                contact.avatar.isNotEmpty)
                            ? CircleAvatar(
                                backgroundImage: MemoryImage(contact.avatar),
                              )
                            : CircleAvatar(
                                child: TextResponsive(
                                  contact.initials(),
                                  style: TextStyle(
                                      fontSize: 21,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                backgroundColor: kBlueBackgroundColor,
                              ),
                        title: TextResponsive(
                          contact.displayName ?? '',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.black87.withOpacity(0.6),
                              fontWeight: FontWeight.bold),
                        ),
                        trailing: MaterialButton(
                            elevation: 1.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.h, vertical: 10.h),
                            color: kBlueBackgroundColor.withOpacity(0.8),
                            child: TextResponsive(
                              'Invite',
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () async {
                              String userContact = contact.phones.first.value;
                              String newUserContact;
                              if (userContact.startsWith('0') ||
                                  userContact.startsWith('(')) {
                                newUserContact = userContact
                                    .replaceFirst('0', '+254')
                                    .replaceAll(' ', '');
                              } else {
                                newUserContact =
                                    userContact.replaceAll(' ', '');
                              }
                              await FlutterOpenWhatsapp.sendSingleMessage(
                                  newUserContact, SOCIAL_SHARE_MESSAGE);
                            }),
                      );
                    },
                  ),
                )
              ],
            )
          : Center(
              child: Container(
                height: 50.h,
                width: 50.h,
                child: load.LoadingIndicator(
                    indicatorType: load.Indicator.ballTrianglePath,
                    color: kBlueBackgroundColor),
              ),
            ),
    );
  }
}

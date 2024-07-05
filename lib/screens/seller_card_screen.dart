import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:manikvhai/utils/text_utils.dart';

import '../constant/colors.dart';

class SellerCard extends StatefulWidget {
  const SellerCard({super.key});

  @override
  State<SellerCard> createState() => _SellerCardState();
}

class _SellerCardState extends State<SellerCard> {
  bool CheckboxValue = false;
  bool toggleValue = false;

  String? SelectedCountry;
  String? Selectedflag;
  String? SelectedCity;
  String? SelectedArea;
  String? SelectedDeliverylogo;

  List<Map<String, dynamic>> countryList = [
    {"title": "Qatar", "logo": "assets/icons/Qatar.svg"},
    {"title": "Saudi Arabia", "logo": "assets/icons/Saudi.svg"},
  ];

  List<Map<String, dynamic>> CityList = [
    {"title": "Al Rayan", "logo": "assets/icons/city.svg"},
    {"title": "Doha", "logo": "assets/icons/city.svg"},
    {"title": "Al khor", "logo": "assets/icons/city.svg"},
    {"title": "Dukhan", "logo": "assets/icons/city.svg"},
    {"title": "Al Mesaied", "logo": "assets/icons/city.svg"},
    {"title": "Sumay Simah", "logo": "assets/icons/city.svg"},
  ];

  List<Map<String, dynamic>> LocationList = [
    {"title": "Ferej Al Soudan", "logo": "assets/icons/location.svg"},
    {"title": "Al Mamoura", "logo": "assets/icons/location.svg"},
    {"title": "Al Waab", "logo": "assets/icons/location.svg"},
    {"title": "Dukhan", "logo": "assets/icons/location.svg"},
    {"title": "Abu Hamour", "logo": "assets/icons/location.svg"},
    {"title": "Ain Khaled", "logo": "assets/icons/location.svg"},
  ];

  List<Map<String, dynamic>> DeliveryLogo = [
    {"title":  "assets/icons/Sonu.svg", "logo":""},
    {"title": "assets/icons/talabat.svg", "logo":"" },
    {"title": "assets/icons/Kadad.svg", "logo": ""},
    {"title":"assets/icons/Rafeek.svg", "logo":"" },
    {"title":  "assets/icons/Cart.svg", "logo":""},
    {"title": "assets/icons/FedEx.svg", "logo":"" },
  ];

  void rebuild(){
    setState(() {

    });
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, setState) {

              void updateData(int index, String title, String logo) {
                if(index==1){
                  setState(() {
                    SelectedCountry = title;
                    Selectedflag = logo;
                  });
                }
                else if(index==2){
                  setState(() {
                    SelectedCity=title;
                  });
                }


                else if(index==3){
                  setState((){
                    SelectedArea=title;
                  });
                }
                else if(index == 4){
                  setState(() {
                    SelectedDeliverylogo=title;
                  });
                }

              }






              return Dialog(
                insetPadding: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),

                child: Container(
                  width: double.infinity,

                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.width * .1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(
                                    Icons.arrow_back_ios_new_rounded,
                                    size: 15,
                                  )),
                              Center(
                                child: Text(
                                  "Address & Delivery partner",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Container(
                                  alignment: Alignment.topRight,
                                  child: InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: SvgPicture.asset(
                                          'assets/icons/cancel.svg')))
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Apply for others"),
                            Switch(
                              value: toggleValue,
                              onChanged: (bool value) {
                                setState(() {
                                  toggleValue = value;
                                });
                              },
                            ),
                            Text(
                              "Only this seller",
                              style: TextStyle(fontSize: 14, color: ktSubTitle),
                            )
                          ],
                        ),
                        Expanded(child: Container(
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(vertical:10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      "Country",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: ktMainTextColor),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Color(0xffA5A5A5)),
                                          borderRadius: BorderRadius.circular(8)),
                                      child: ListTile(
                                        leading: SvgPicture.asset(Selectedflag ?? "assets/icons/global.svg"),
                                        title: Text(
                                          SelectedCountry ?? "Select Country",
                                          style: TextStyle(fontSize: 14, color:SelectedCountry !=null?null: Color(0xff787777)),
                                        ),
                                        trailing: SvgPicture.asset("assets/icons/arrowDown.svg"),
                                        onTap: () {
                                          _showBottomSheet(1, context, updateData, countryList,175);
                                        },
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      "Select City",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: ktMainTextColor),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Color(0xffA5A5A5)),
                                          borderRadius: BorderRadius.circular(8)),
                                      child: ListTile(
                                        leading: SvgPicture.asset( "assets/icons/city.svg"),
                                        title: Text(
                                          SelectedCity ?? "Select Country",
                                          style: TextStyle(fontSize: 14, color:SelectedCity !=null?null: Color(0xff787777)),
                                        ),
                                        trailing: SvgPicture.asset("assets/icons/arrowDown.svg"),
                                        onTap: () {
                                          _showBottomSheet(2, context, updateData, CityList,878);
                                        },
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      "Area",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: ktMainTextColor),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Color(0xffA5A5A5)),
                                          borderRadius: BorderRadius.circular(8)),
                                      child: ListTile(
                                        leading: SvgPicture.asset( "assets/icons/location.svg"),
                                        title: Text(
                                          SelectedArea ?? "Select area",
                                          style: TextStyle(fontSize: 14, color:SelectedArea !=null?null: Color(0xff787777)),
                                        ),
                                        trailing: SvgPicture.asset("assets/icons/arrowDown.svg"),
                                        onTap: () {
                                          _showBottomSheet(3,context, updateData, LocationList,878);
                                        },
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      "Select a Delivery Partner",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: ktMainTextColor),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Color(0xffA5A5A5)),
                                          borderRadius: BorderRadius.circular(8)),
                                      child: ListTile(
                                        leading:SelectedDeliverylogo ==null? null: SvgPicture.asset( "assets/icons/check.svg"),
                                        title:SelectedDeliverylogo == null?  Text("Select a Delivery partner",
                                          style: TextStyle(fontSize: 14, color: Color(0xff787777)),
                                        )
                                            :SvgPicture.asset(SelectedDeliverylogo!, alignment: Alignment.centerLeft,),

                                        trailing: SvgPicture.asset("assets/icons/arrowDown.svg"),
                                        onTap: () {
                                          _showBottomSheet(4,context, updateData, DeliveryLogo,878);
                                        },
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
                        SizedBox(
                          height: 10,
                        ),
                        DeliveryCharge(SelectedDeliverylogo??null),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 40,
                                child: TextButton(

                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                    child: Text("Cancel",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xff787777)
                                    ),
                                    ),),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 40,
                                child: ElevatedButton(
                                    onPressed: (){
                                      Navigator.pop(context);
                                      _ShowSeccondDialog();
                                    },
                                    child: Text("Confirm", style: TextStyle(fontSize: 14),),
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    backgroundColor: ktMainTextColor,
                                    foregroundColor: Colors.white
                                  ),

                                ),
                              ),
                            )
                          ],
                        )

                      ],
                    ),
                  ),
                ),
              );
            },
          );
        });
  }


  void _ShowSeccondDialog() {
    int ontap = 0;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            void updateData(int indx, String title, String logo) {
              setState(() {
                SelectedDeliverylogo = title;
              });
            }

            return Dialog(
              insetPadding: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: IntrinsicHeight(
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: SvgPicture.asset("assets/icons/cancel.svg"),
                        ),
                      ),
                      Text(
                        "Select Delivery Option",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xffF3F3F3),
                          border: Border.all(
                            color: Color(0xffE8E8E8),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    "Select a Delivery Partner",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: ktMainTextColor,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Color(0xffA5A5A5)),
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          spreadRadius: 1.5,
                                          blurRadius: 4,
                                          offset: Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: ListTile(
                                      leading: SelectedDeliverylogo == null
                                          ? null
                                          : SvgPicture.asset("assets/icons/check.svg"),
                                      title: SelectedDeliverylogo == null
                                          ? Text(
                                        "Select a Delivery partner",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff787777),
                                        ),
                                      )
                                          : SvgPicture.asset(
                                        SelectedDeliverylogo!,
                                        alignment: Alignment.centerLeft,
                                      ),
                                      trailing: SvgPicture.asset("assets/icons/arrowDown.svg"),
                                      onTap: () {
                                        _showBottomSheet(4, context, updateData, DeliveryLogo, 878);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Select delivery type",
                              style: TextStyle(
                                fontSize: 16,
                                color: ktMainTextColor,
                              ),
                            ),
                            SizedBox(height: 20),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  ontap = 0;
                                });
                              },
                              child: Container(
                                width: double.infinity,
                                height: 70,
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: ontap == 0 ? ktMainTextColor : Color(0xffE8E8E8),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Normal delivery",
                                          style: TextStyle(
                                            color: ontap == 0 ? ktMainTextColor : ktSubTitle,
                                          ),
                                        ),
                                        Container(
                                          width: 16,
                                          height: 16,
                                          child: ontap == 0 ? SvgPicture.asset('assets/icons/check.svg') : null,
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "5-7 days",
                                      style: TextStyle(
                                        color: ktSubTitle,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 25),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  ontap = 1;
                                });
                              },
                              child: Container(
                                width: double.infinity,
                                height: 70,
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: ontap == 1 ? ktMainTextColor : Color(0xffE8E8E8),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Express delivery",
                                          style: TextStyle(
                                            color: ontap == 1 ? ktMainTextColor : ktSubTitle,
                                          ),
                                        ),
                                        Container(
                                          width: 16,
                                          height: 16,
                                          child: ontap == 1 ? SvgPicture.asset('assets/icons/check.svg') : null,
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "2-3 days",
                                      style: TextStyle(
                                        color: ktSubTitle,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      DeliveryCharge(SelectedDeliverylogo),
                      SizedBox(height: 10),
                      Divider(
                        thickness: 0.5,
                        height: 0.5,
                        color: ktSubTitle,
                      ),
                      SizedBox(height: 30),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 40,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff787777),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () {
                                  rebuild();
                                  Navigator.pop(context);

                                },
                                child: Text(
                                  "Confirm",
                                  style: TextStyle(fontSize: 14),
                                ),
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  backgroundColor: ktMainTextColor,
                                  foregroundColor: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }




  Widget DeliveryCharge(var logo){
    if(logo !=null){
      return Container(
        height: 52,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Delivery Charge",
                  style: TextStyle(
                    color: ktMainTextColor,
                    fontSize: 14
                  ) ,),

                   Tooltip(
                     message: "",

                     child: SizedBox(
                      height: 20,
                      width: 20,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                          onPressed: (){},
                          icon: SvgPicture.asset("assets/icons/!icon.svg")
                      ),
                                       ),
                   ),


              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Local Deliver",
                style: TextStyle(
                  fontSize: 14,
                  color: ktSubTitle
                ),
                ),
                Text("Qar 123.45",
                  style: TextStyle(
                      fontSize: 14,
                      color: ktSubTitle
                  ),
                )
              ],
            )
          ],
        ),
      );
    }else{
      return Container();
    }
  }



  void _showBottomSheet(int indx, BuildContext context , Function(int, String, String, ) updateData, List listMap, double height) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      builder: (context) {
        return Container(
          height: height,
          color: Color(0xffFFFFFF),
          padding: EdgeInsets.only(top: 30, right: 16, left: 16, bottom: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Select Country",
                    style: TextStyle(fontSize: 16, color: ktMainTextColor),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset("assets/icons/cancel.svg"))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                height: 1,
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                  child: Container(
                child: ListView.builder(
                  itemCount: listMap.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        updateData(indx,
                            listMap[index]['title'], listMap[index]['logo']);
                        Navigator.pop(context);
                      },
                      leading:indx==4?null: SvgPicture.asset(listMap[index]["logo"]),
                      title:height>175?Center(child: indx==4? SvgPicture.asset(listMap[index]["title"]): Text(listMap[index]["title"])): Text(listMap[index]["title"]),
                    );
                  },
                ),
              ))
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final ScWidth = MediaQuery.of(context).size.width;
    final ScHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xffF3F3F3),
      body: SafeArea(
        child: Container(
          color: Color(0xffFFFFFF),
          child: ListTileTheme(
            data: ListTileTheme.of(context).copyWith(dense: true),
            child: ExpansionTile(
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              childrenPadding: EdgeInsets.symmetric(
                horizontal: 25,
              ),
              shape: OutlineInputBorder(borderSide: BorderSide.none),
              leading: LeadingCheckbox(),
              title: TitleRow(),
              children: [
                Divider(
                  height: 0.5,
                ),
                SizedBox(
                  height: 10,
                ),
                ChildrenContainer(
                  ScHeight: ScHeight,
                  showdialog: _showDialog,
                  Logopath: SelectedDeliverylogo??"assets/icons/talabat.svg",

                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Checkbox LeadingCheckbox() {
    return Checkbox(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      activeColor: Color(0xff4B4A4A),
      value: CheckboxValue,
      onChanged: (bool? value) {
        CheckboxValue = value!;
        setState(() {});
      },
    );
  }
}

class ChildrenContainer extends StatelessWidget {
  final Function showdialog;
  final double ScHeight;
  final String Logopath;
  const ChildrenContainer(
      {super.key, required this.ScHeight, required this.showdialog, required this.Logopath});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScHeight * 0.10,
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Delivery by",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: ktMainTextColor),
                  ),
                  SizedBox(
                    height: ScHeight * 0.01,
                  ),
                  Row(
                    children: [
                      Text(
                        "Edit partner",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: ktMainTextColor),
                      ),
                      SizedBox(
                        width: 20,
                        height: 20,
                        child: MaterialButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            showdialog();
                          },
                          child: SvgPicture.asset(
                            'assets/icons/pen.svg',
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )),
          Expanded(
              flex: 4,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Color(0xffECF0F0),
                            borderRadius: BorderRadius.circular(5)),
                        child: SvgPicture.asset(Logopath),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Express",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff4B4A4A)),
                            ),
                            SvgPicture.asset("assets/icons/!icon.svg"),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Get at 9th - 10th may",
                          style: TextStyle(fontSize: 12, color: ktSubTitle),
                        )
                      ],
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}

class TitleRow extends StatelessWidget {
  const TitleRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("#1"),
        SvgPicture.asset(
          'assets/icons/nimbus_marketing.svg',
        ),
        Text(
          TextUtils().truncateText("Abdullah kashifuddin", 15),
        ),
        SvgPicture.asset(
          'assets/icons/blue_tick.svg',
        ),
        SvgPicture.asset('assets/icons/comment.svg'),
        SvgPicture.asset('assets/icons/van.svg')
      ],
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:lms/Screens/signupPage.dart';

class SemesterPayment extends StatefulWidget {
  String Course;
  String semester;

  SemesterPayment({Key? key, required this.Course, required this.semester})
      : super(key: key);

  @override
  State<SemesterPayment> createState() => SemesterPaymentState();
}

class SemesterPaymentState extends State<SemesterPayment> {
  bool _isProcessing = false;
  User? user = FirebaseAuth.instance.currentUser;
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: IntrinsicHeight(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 210,
                  width: 350,
                  child: CreditCardWidget(
                    cardNumber: cardNumber,
                    expiryDate: expiryDate,
                    cardHolderName: cardHolderName,
                    cvvCode: cvvCode,
                    showBackView: isCvvFocused,
                    obscureCardNumber: true,
                    obscureCardCvv: true,
                    isHolderNameVisible: true,
                    cardBgColor: Colors.grey.shade500,
                    isSwipeGestureEnabled: true,
                    onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
                  ),
                ),
                Column(
                  children: <Widget>[
                    CreditCardForm(
                      formKey: formKey,
                      obscureCvv: true,
                      obscureNumber: true,
                      cardNumber: cardNumber,
                      cvvCode: cvvCode,
                      isHolderNameVisible: true,
                      isCardNumberVisible: true,
                      isExpiryDateVisible: true,
                      cardHolderName: cardHolderName,
                      expiryDate: expiryDate,
                      themeColor: Colors.blue,
                      textColor: Colors.black54,
                      cardNumberDecoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Number',
                        hintText: 'XXXX XXXX XXXX XXXX',
                        hintStyle: const TextStyle(color: Colors.black54),
                        labelStyle: const TextStyle(color: Colors.black54),
                        focusedBorder: border,
                        enabledBorder: border,
                      ),
                      expiryDateDecoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintStyle: const TextStyle(color: Colors.black54),
                        labelStyle: const TextStyle(color: Colors.black54),
                        focusedBorder: border,
                        enabledBorder: border,
                        labelText: 'Expired Date',
                        hintText: 'XX/XX',
                      ),
                      cvvCodeDecoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintStyle: const TextStyle(color: Colors.black54),
                        labelStyle: const TextStyle(color: Colors.black54),
                        focusedBorder: border,
                        enabledBorder: border,
                        labelText: 'CVV',
                        hintText: 'XXX',
                      ),
                      cardHolderDecoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintStyle: const TextStyle(color: Colors.black54),
                        labelStyle: const TextStyle(color: Colors.black54),
                        focusedBorder: border,
                        enabledBorder: border,
                        labelText: 'Card Holder',
                      ),
                      onCreditCardModelChange: onCreditCardModelChange,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          setState(
                            () {
                              _isProcessing = true;
                            },
                          );
                          FirebaseFirestore.instance
                              .collection('Courses')
                              .doc(widget.Course)
                              .collection(user!.uid)
                              .doc(widget.semester)
                              .update({
                            'payment': true,
                            'enrollment': true
                          }).then((value) => showDialog(
                                  context: context,
                                  builder: (BuildContext context) => AlertDialog(
                                        title: new Text('Payment Done'),
                                        content: new Text(
                                            'Your payment has been successfully completed!'),
                                        actions: <Widget>[
                                          IconButton(
                                              icon: Icon(Icons.close),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              })
                                        ],
                                      )));
                          setState(() {
                            _isProcessing = false;
                          });
                        } else {
                          setState(() {
                            _isProcessing = false;
                          });
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 30),
                        width: 340,
                        height: 50,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0xFFC5B7B7),
                              offset: Offset(2, 1),
                              blurRadius: 8,
                              spreadRadius: 2,
                            )
                          ],
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: const Color(0xFF6F6DD2)),
                          color: const Color(0xFF6F6DD2),
                        ),
                        child: const Center(
                          child: Text(
                            'Submit',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
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
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}

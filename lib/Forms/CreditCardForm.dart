import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:lms/Screens/signupPage.dart';

class CreditCard extends StatefulWidget {
  final Function() notifyParent;
  String Course;

  CreditCard({Key? key, required this.notifyParent, required this.Course})
      : super(key: key);

  @override
  State<CreditCard> createState() => CreditCardState();
}

class CreditCardState extends State<CreditCard> {
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
    return Column(
      children: <Widget>[
        Container(
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
                if (user != null) {
                  if (formKey.currentState!.validate()) {
                    setState(
                      () {
                        _isProcessing = true;
                      },
                    );
                    FirebaseFirestore.instance
                        .collection('users')
                        .doc(user!.uid)
                        .update({'appliedTo': widget.Course});
                    FirebaseFirestore.instance
                        .collection('Courses')
                        .doc(widget.Course)
                        .collection(user!.uid)
                        .doc('1')
                        .update({'payment': true}).then((value) => showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                                  title: new Text('Await Verification'),
                                  content: new Text(
                                      'You will be contacted once your document and profile is verified'),
                                  actions: <Widget>[
                                    IconButton(
                                        icon: Icon(Icons.close),
                                        onPressed: () {
                                          FirebaseAuth.instance.signOut();
                                          Navigator.popUntil(context,
                                              (route) => route.isFirst);
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
                } else {
                  formnumber--;
                  widget.notifyParent();
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

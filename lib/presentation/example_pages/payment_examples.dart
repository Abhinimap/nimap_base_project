import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:starter_template_get_x/domain/domain.dart';
import 'package:uuid/uuid.dart';

import 'package:flutter_cashfree_pg_sdk/api/cfcard/cfcardlistener.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfcard/cfcardwidget.dart';
import 'package:flutter_cashfree_pg_sdk/api/cferrorresponse/cferrorresponse.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfpayment/cfcard.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfpayment/cfcardpayment.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfpayment/cfdropcheckoutpayment.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfpayment/cfnetbanking.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfpayment/cfnetbankingpayment.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfpayment/cfupi.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfpayment/cfupipayment.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfpayment/cfwebcheckoutpayment.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfpaymentcomponents/cfpaymentcomponent.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfpaymentgateway/cfpaymentgatewayservice.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfsession/cfsession.dart';
import 'package:flutter_cashfree_pg_sdk/api/cftheme/cftheme.dart';
import 'package:flutter_cashfree_pg_sdk/utils/cfenums.dart';
import 'package:flutter_cashfree_pg_sdk/utils/cfexceptions.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfupi/cfupiutils.dart';

import 'package:starter_template_get_x/config/config.dart';
import 'package:starter_template_get_x/data/data.dart';
import 'package:starter_template_get_x/data/utils/custom_popup.dart';
import 'package:starter_template_get_x/presentation/presentation.dart';

class PaymentExamples extends StatefulWidget {
  const PaymentExamples({super.key});

  @override
  State<StatefulWidget> createState() {
    return PaymentExamplesState();
  }
}

class PaymentExamplesState extends State<PaymentExamples> {
  String? orderIdByUUID;
  var cfPaymentGatewayService = CFPaymentGatewayService();

  final uuid = const Uuid();

  String orderId = "order_6032i376cpyIuTTVae9vnqfmtgT8Hj";
  String paymentSessionId =
      "session_nfU1ZczDG136bf7N7EQv6C6kL0dZn3Xw8EYtHmpmt0_dqt493wRnYG7PuUEuv96G57DuMOobE39WVnUth3tgd5k_odWFHa8dHIWoFzs3RzHS";

  CFEnvironment environment = CFEnvironment.SANDBOX;
  String selectedId = "";

  @override
  void initState() {
    super.initState();
    orderIdByUUID = generateUniqueId();
    cfPaymentGatewayService.setCallback(verifyPayment, onError);
  }

  String generateUniqueId() {
    String uniqueId =
        uuid.v4(); // Generates a random unique ID (UUID version 4)
    return uniqueId;
  }

  void verifyPayment(String orderId) {
    // TODO: If payment is completed then the flow comes here.
    //  Handle the success flow here
    print("Verify Payment $orderId");
    orderId = generateUniqueId();
  }

  void onError(CFErrorResponse errorResponse, String orderId) {
    // TODO: If payment is completed then the flow comes here.
    //  Handle the error flow here.
    print("Error while making payment");
    orderIdByUUID = generateUniqueId();
  }

  initiatePayment() async {
    // TODO: Following are the test credentials please use your test credentials
    const String appId = "TEST10305710b52a49a6d8b83818378201750301";
    const String secretKey =
        "cfsk_ma_test_65c1b4e827bb98b7b5d6c4418e8bc72a_0824f09b";

    final String orderamount = (299 + 29.00).toStringAsFixed(2).toString();

    final headers = {
      'Content-Type': 'application/json',
      'x-client-id': appId,
      'x-client-secret': secretKey,
      'x-api-version': '2025-01-01',
    };

    final data = {
      'order_id': orderIdByUUID,
      'order_amount': orderamount,
      'order_currency': 'INR',
      'customer_details': {
        'customer_id': 'CUST001',
        'customer_email': "vikrantp758@gmail.com",
        'customer_phone': "9021902190",
      },
      'order_note': 'Test Order',
      'order_meta': {
        'return_url':
            'https://example.com/return', // Replace with your return URL
      },
    };

    final response = await Dio().post('https://sandbox.cashfree.com/pg/orders',
        options: Options(headers: headers), data: data);
    // final response = await http.post(
    //   Uri.parse('https://sandbox.cashfree.com/pg/orders'),
    //   headers: headers,
    //   body: json.encode(data),
    // );

    final responseData = await response.data;
    print('response data  :${responseData}');
    return responseData;
    // await createSession(responseData);
  }

  Future<CFSession?> createSession() async {
    try {
      final mySessionIDData = await initiatePayment();

      var session = CFSessionBuilder()
          .setEnvironment(CFEnvironment.SANDBOX)
          .setOrderId(mySessionIDData["order_id"])
          .setPaymentSessionId(mySessionIDData["payment_session_id"])
          .build();
      return session;
    } on CFException catch (e) {
      print(e.message);
    }
    return null;
  }

  startPayment() async {
    try {
      var session = await createSession();
      var cfWebCheckout =
          CFWebCheckoutPaymentBuilder().setSession(session!).build();
      cfPaymentGatewayService.doPayment(cfWebCheckout);
    } on CFException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      addSafeArea: true,
      selectedDrawerElement: DrawerElements.logout,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            PrimaryButton(
              onPressed: startPayment,
              buttonText: "Cash Free Example",
            ),
            SizedBox(
              height: 20,
            ),
            PrimaryButton(
              onPressed: startPayment,
              buttonText: "Stripe Setup",
            ),

          ],
        ),
      ),
    );
  }
}

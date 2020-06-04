import 'package:bookit_app/utils/snackbar.dart';
import 'package:flutter/material.dart';

submittedAllFields(context, data, image, createAdvert) {
  if (data.title != null &&
      data.author != null &&
      data.description != null &&
      image != null) {
    if (data.delivery == "DELIVERY") {
      if ((data.shippingCostsCreator || data.shippingCostsReciever) &&
          data.shippingAgreement) {
        Navigator.of(context).pop();
        createAdvert();
      } else {
        createSnackBar(context, "Missing information");
      }
    } else if (data.delivery == "MEET") {
      if (data.meetCity != null && data.meetUpAgreement) {
        Navigator.of(context).pop();
        createAdvert();
      } else {
        createSnackBar(context, "Missing information");
      }
    } else {
      createSnackBar(context, "Missing information");
    }
  }
}

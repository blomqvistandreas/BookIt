import 'package:flutter/material.dart';

Text displayDeliveryText(data) {
  if (data.delivery == "DELIVERY") {
    if (data.shippingCostsCreator) {
      return Text("• Fraktkostnaden är betald.");
    } else {
      return Text("• Mottagaren står för fraktkostnaden.");
    }
  } else if (data.delivery == "MEET") {
    return Text("• Kan hämtas i ${data.meetCity}");
  } else {
    return Text("");
  }
}

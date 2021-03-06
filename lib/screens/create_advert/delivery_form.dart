import 'package:bookit_app/styles/colors.dart';
import 'package:flutter/material.dart' hide Colors;

class DeliveryForm extends StatefulWidget {
  final Function(bool) shippingCostsCreater;
  final Function(bool) shippingCostsReciever;
  final Function(bool) shippingAgreement;

  DeliveryForm(
      {Key key,
      this.shippingCostsCreater,
      this.shippingCostsReciever,
      this.shippingAgreement})
      : super(key: key);

  _DeliveryFormState createState() => _DeliveryFormState();
}

class _DeliveryFormState extends State<DeliveryForm> {
  bool _shippingCostsCreater = false;
  bool _shippingCostsReciever = false;
  bool _shippingAgreement = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        border: Border.all(
          width: 2.0,
          color: formComplete() ? Colors.primary : Colors.grey,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Du har valt att posta din bok, här väljer du vem som får stå för fraktkostnader. Tänk på att det går snabbare att hitta en matchning om man väljer att betala för frakten.",
              style: TextStyle(fontSize: 14),
            ),
            buildPaidCheckbox(),
            buildNotPaidCheckbox(),
            Divider(),
            Text(
                "Du förväntas skicka boken inom 48 timmar efter eventuell matchning. För mer information läs Shipping Agreement."),
            SizedBox(height: 5),
            buildAgreementCheckbox(),
          ],
        ),
      ),
    );
  }

  Row buildAgreementCheckbox() {
    return Row(
      children: [
        Checkbox(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          checkColor: Colors.primary,
          activeColor: Colors.transparent,
          value: _shippingAgreement,
          onChanged: (bool value) {
            setState(() {
              widget.shippingAgreement(value);
              _shippingAgreement = value;
            });
          },
        ),
        Expanded(
          child: Text(
              "Jag accepterar Shipping Agreement och kommer att skicka boken inom 48 timmar.",
              style: TextStyle(fontSize: 12)),
        ),
      ],
    );
  }

  Row buildNotPaidCheckbox() {
    return Row(
      children: [
        Checkbox(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          checkColor: Colors.primary,
          activeColor: Colors.transparent,
          value: _shippingCostsReciever,
          onChanged: (bool value) {
            setState(() {
              _shippingCostsReciever = value;
              widget.shippingCostsReciever(value);
              _shippingCostsCreater = false;
              widget.shippingCostsCreater(false);
            });
          },
        ),
        Expanded(
          child: Text("Mottagaren får betala fraktkostnaderna för denna bok.",
              style: TextStyle(fontSize: 12)),
        ),
      ],
    );
  }

  Row buildPaidCheckbox() {
    return Row(
      children: [
        Checkbox(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          checkColor: Colors.primary,
          activeColor: Colors.transparent,
          value: _shippingCostsCreater,
          onChanged: (bool value) {
            setState(() {
              _shippingCostsCreater = value;
              widget.shippingCostsCreater(value);
              _shippingCostsReciever = false;
              widget.shippingCostsReciever(false);
            });
          },
        ),
        Expanded(
          child: Text("Jag betalar fraktkostnaderna för denna bok.",
              style: TextStyle(fontSize: 12)),
        ),
      ],
    );
  }

  bool formComplete() {
    if (_shippingAgreement &&
        (_shippingCostsCreater || _shippingCostsReciever)) {
      return true;
    }
    return false;
  }
}

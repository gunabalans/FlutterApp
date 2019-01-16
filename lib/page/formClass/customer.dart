class Customer {
  final title = "Customer";

  final primaryKey = "ID";
  final form = {
    "Name": {"inputType": "TEXT", "min": 6, "required": true},
    "CustGSTN": {"inputType": "TEXT", "max": 15, "required": true},
    "Address": {"inputType": "MULTILINETEXT", "min": 6, "required": true},
    "City": {"inputType": "TEXT", "min": 4, "required": true},
    "Pincode": {"inputType": "NUMBER", "mask": "609 605", "maskSeperator": " "},
    "State": {"inputType": "TEXT", "min": 4, "required": true},
    "Country": {"inputType": "TEXT", "min": 4, "required": true},
    "MobileNo": {"inputType": "NUMBER", "max": 10},
    "Email": {"inputType": "EMAIL", "min": 6, "required": true},
    "DOB": {
      "inputType": "NUMBER",
      "mask": "dd/mm/yyyy",
      "maskSeperator": "/",
      "min": 10,
      "required": true
    }
  };
}

import 'package:me_arun/config/config.dart';
import 'package:me_arun/util/http_client.dart';

class Enquiry {
  static HttpClient myhttp = new HttpClient();
  //Enquiry(this.myhttp);
  final title = "Enquiry";

  final primaryKey = "EnquiryID";

  final form = {
    "customer_ID": {
      "flex": 12,
      "inputType": "SELECTFROMURL",
      "url": Config.url_base + "/commonAcc/customer"
    },
    "NoOfInfants": {"flex": 4, "inputType": "NUMBER"},
    "NoOfChildren": {"flex": 8, "inputType": "NUMBER"},
    "NoOfAdult": {"flex": 4, "inputType": "NUMBER"},
    "NoOfSenior": {"flex": 8, "inputType": "NUMBER"},
    "Remarks": {"flex": 12, "inputType": "MULTILINETEXT"},
    "CBFromPlace": {"flex": 12, "inputType": "NUMBER"},
    "CBToPlace": {"flex": 12, "inputType": "NUMBER"},
    "CBPickupLocation": {"flex": 12, "inputType": "MULTILINETEXT"},
    "CBDropLocation": {"flex": 12, "inputType": "MULTILINETEXT"},
    "CBJourneyDateTime": {
      "flex": 6,
      "inputType": "TEXT",
      "mask": "dd/mm/yyyy",
      "maskSeperator": "/"
    },
    "CBReturnDateTime": {
      "flex": 6,
      "inputType": "TEXT",
      "mask": "dd/mm/yyyy",
      "maskSeperator": "/"
    }
  };
}

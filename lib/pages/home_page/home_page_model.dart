import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for postalCodeField widget.
  TextEditingController? postalCodeFieldController;
  String? Function(BuildContext, String?)? postalCodeFieldControllerValidator;
  // Stores action output result for [Backend Call - API (get address by cep)] action in searchButton widget.
  ApiCallResponse? apiResultpjq;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    postalCodeFieldController?.dispose();
  }

  /// Additional helper methods are added here.

}

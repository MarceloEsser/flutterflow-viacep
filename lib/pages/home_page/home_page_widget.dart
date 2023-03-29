import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({
    Key? key,
    this.cep,
  }) : super(key: key);

  final String? cep;

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    _model.postalCodeFieldController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Page Title',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22.0,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2.0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 24.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                        child: TextFormField(
                          controller: _model.postalCodeFieldController,
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'CEP',
                            hintText: 'Digite seu cep',
                            hintStyle: FlutterFlowTheme.of(context).bodyText2,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedErrorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                          ),
                          style: FlutterFlowTheme.of(context).bodyText1,
                          keyboardType: TextInputType.number,
                          validator: _model.postalCodeFieldControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 56.0,
                      fillColor: FlutterFlowTheme.of(context).alternate,
                      icon: Icon(
                        Icons.search,
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                        size: 14.0,
                      ),
                      showLoadingIndicator: true,
                      onPressed: () async {
                        _model.address = await GetAddressByCepCall.call(
                          cep: _model.postalCodeFieldController.text,
                        );
                        if ((_model.address?.succeeded ?? true)) {
                          setState(() {
                            _model.postalCodeFieldController?.clear();
                          });
                        } else {
                          setState(() {
                            _model.postalCodeFieldController?.clear();
                          });
                        }

                        setState(() {
                          _model.postalCodeFieldController?.clear();
                        });

                        setState(() {});
                      },
                    ),
                  ],
                ),
                Text(
                  (_model.address?.jsonBody ?? '').toString(),
                  style: FlutterFlowTheme.of(context).bodyText1,
                ),
                Text(
                  GetAddressByCepCall.cep(
                    (_model.address?.jsonBody ?? ''),
                  ).toString(),
                  style: FlutterFlowTheme.of(context).bodyText1,
                ),
                Text(
                  'Hello World',
                  style: FlutterFlowTheme.of(context).bodyText1,
                ),
                Text(
                  'Hello World',
                  style: FlutterFlowTheme.of(context).bodyText1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

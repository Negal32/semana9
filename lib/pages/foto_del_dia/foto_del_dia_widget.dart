import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'foto_del_dia_model.dart';
export 'foto_del_dia_model.dart';

class FotoDelDiaWidget extends StatefulWidget {
  const FotoDelDiaWidget({Key? key}) : super(key: key);

  @override
  _FotoDelDiaWidgetState createState() => _FotoDelDiaWidgetState();
}

class _FotoDelDiaWidgetState extends State<FotoDelDiaWidget> {
  late FotoDelDiaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FotoDelDiaModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFF3352DA),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Foto del Dia',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
            child: FutureBuilder<ApiCallResponse>(
              future: MiFotoDelDiaCall.call(),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                    ),
                  );
                }
                final columnMiFotoDelDiaResponse = snapshot.data!;
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 150.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: FlutterFlowCalendar(
                              color: FlutterFlowTheme.of(context).primary,
                              iconColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              weekFormat: true,
                              weekStartsMonday: false,
                              rowHeight: 30.0,
                              onChange: (DateTimeRange? newSelectedDate) {
                                setState(() => _model.calendarSelectedDay =
                                    newSelectedDate);
                              },
                              titleStyle:
                                  FlutterFlowTheme.of(context).headlineSmall,
                              dayOfWeekStyle:
                                  FlutterFlowTheme.of(context).labelLarge,
                              dateStyle:
                                  FlutterFlowTheme.of(context).bodyMedium,
                              selectedDateStyle:
                                  FlutterFlowTheme.of(context).titleSmall,
                              inactiveDateStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          MiFotoDelDiaCall.titulo(
                            columnMiFotoDelDiaResponse.jsonBody,
                          ).toString(),
                          maxLines: 2,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 16.0,
                                  ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: MiFotoDelDiaCall.derechos(
                                  columnMiFotoDelDiaResponse.jsonBody,
                                ).toString(),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Color(0xFFEFD139),
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              TextSpan(
                                text: MiFotoDelDiaCall.fecha(
                                  columnMiFotoDelDiaResponse.jsonBody,
                                ).toString(),
                                style: TextStyle(
                                  color: Color(0xFFC30707),
                                ),
                              ),
                              TextSpan(
                                text: MiFotoDelDiaCall.explicacion(
                                  columnMiFotoDelDiaResponse.jsonBody,
                                ).toString(),
                                style: TextStyle(
                                  color: Color(0xFF13960A),
                                ),
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 10.0,
                                ),
                          ),
                          textAlign: TextAlign.justify,
                          maxLines: 20,
                        ),
                      ],
                    ),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          MiFotoDelDiaCall.imagen(
                            columnMiFotoDelDiaResponse.jsonBody,
                          ),
                          width: 300.0,
                          height: 200.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

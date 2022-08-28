import 'dart:io';

import 'package:lms/SupportiveWidgets.dart/utils.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:pdf/widgets.dart' as pw;

import '../SupportiveWidgets.dart/TranscriptApiModel/student.dart';
import '../SupportiveWidgets.dart/TranscriptApiModel/lms.dart';
import '../SupportiveWidgets.dart/TranscriptApiModel/transcript.dart';
import 'PdfApi.dart';
import 'TranscriptApiModel/student.dart';
import 'TranscriptApiModel/transcript.dart';

class pdfTranscriptApi {
  static Future<File> generate(Transcript transcript) async {
    final pdf = Document();

    pdf.addPage(MultiPage(
      margin: EdgeInsets.only(
        left: 5,
        right: 5,
      ),
      pageFormat: PdfPageFormat.a4,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      build: (context) => [
        buildHeader(transcript),
        buildTable(transcript, 1),
        buildTable(transcript, 2),
        buildTable(transcript, 3),
        buildTable(transcript, 4),
        Divider(),
        buildTotal(transcript),
      ],
    ));

    return PdfApi.saveDocument(name: 'my_transcript.pdf', pdf: pdf);
  }

  static Widget buildHeader(Transcript transcript) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildlmsDetails(transcript.lms),
              Container(
                height: 35,
                width: 30,
                child: BarcodeWidget(
                  barcode: Barcode.qrCode(),
                  data: transcript.Details.program,
                ),
              ),
            ],
          ),
          Center(
            child: Text('Academic Transcript',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                )),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildStudentMain(transcript.student),
              buildProgramDetails(transcript.Details),
            ],
          ),
        ],
      );

  static Widget buildStudentMain(Student student) => Container(
      width: 6.5 * PdfPageFormat.cm,
      height: 2 * PdfPageFormat.cm,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text('Full Name:', style: TextStyle(fontSize: 10)),
              ),
              Text(student.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10)),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Text('Date of Birth:',
                    style: TextStyle(
                      fontSize: 10,
                    )),
              ),
              Text(student.dob,
                  style: TextStyle(
                    fontSize: 10,
                  )),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Text('ID:', style: TextStyle(fontSize: 10)),
              ),
              Text(student.id, style: TextStyle(fontSize: 10)),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Text('Gender:', style: TextStyle(fontSize: 10)),
              ),
              Text(student.gender, style: TextStyle(fontSize: 10)),
            ],
          ),
        ],
      ));

  static Widget buildProgramDetails(ProgramInfo info) {
    final titles = <String>['Program:', 'Major:', 'Degree:', 'Dated:'];
    final data = <String>[
      info.program,
      info.major,
      info.degree,
      Utils.formatDate(info.date),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(titles.length, (index) {
        final title = titles[index];
        final value = data[index];

        return buildText(title: title, value: value, width: 200);
      }),
    );
  }

  static Widget buildlmsDetails(LMS supplier) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(supplier.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 10,
              )),
          SizedBox(height: 1 * PdfPageFormat.mm),
          Text(supplier.address, style: TextStyle(fontSize: 10)),
        ],
      );

  static Widget buildTable(Transcript transcript, int a) {
    final headers1 = a == 1
        ? [
            a,
            'Subject Code',
            'Subject',
            'CRH',
            'Grade',
            'Grade Point',
            num.parse(Utils.GetSGPA(transcript, a).toStringAsFixed(2)),
          ]
        : a == 2
            ? [
                a + 1,
                'Subject Code',
                'Subject',
                'CRH',
                'Grade',
                'Grade Point',
                num.parse(Utils.GetSGPA(transcript, a + 1).toStringAsFixed(2)),
              ]
            : a == 3
                ? [
                    a + 2,
                    'Subject Code',
                    'Subject',
                    'CRH',
                    'Grade',
                    'Grade Point',
                    num.parse(
                        Utils.GetSGPA(transcript, a + 2).toStringAsFixed(2)),
                  ]
                : [
                    a + 4,
                    'Subject Code',
                    'Subject',
                    'CRH',
                    'Grade',
                    'Grade Point',
                    num.parse(
                        Utils.GetSGPA(transcript, a + 4).toStringAsFixed(2)),
                  ];
    final headers2 = a == 1
        ? [
            a + 1,
            'Subject Code',
            'Subject',
            'CRH',
            'Grade',
            'Grade Point',
            num.parse(Utils.GetSGPA(transcript, a + 1).toStringAsFixed(2)),
          ]
        : a == 2
            ? [
                a + 2,
                'Subject Code',
                'Subject',
                'CRH',
                'Grade',
                'Grade Point',
                num.parse(Utils.GetSGPA(transcript, a + 2).toStringAsFixed(2)),
              ]
            : a == 3
                ? [
                    a + 3,
                    'Subject Code',
                    'Subject',
                    'CRH',
                    'Grade',
                    'Grade Point',
                    num.parse(
                        Utils.GetSGPA(transcript, a + 3).toStringAsFixed(2)),
                  ]
                : [
                    a + 4,
                    'Subject Code',
                    'Subject',
                    'CRH',
                    'Grade',
                    'Grade Point',
                    num.parse(
                        Utils.GetSGPA(transcript, a + 4).toStringAsFixed(2)),
                  ];
    final data1 = a == 1
        ? transcript.semester1.map(
            (semester) {
              return [
                semester.semesterNo,
                semester.code,
                semester.name,
                semester.crh,
                semester.grade,
                semester.gradePoint,
                semester.SGPA,
              ];
            },
          ).toList()
        : a == 2
            ? transcript.semester3.map((semester) {
                return [
                  semester.semesterNo,
                  semester.code,
                  semester.name,
                  semester.crh,
                  semester.grade,
                  semester.gradePoint,
                  semester.SGPA,
                ];
              }).toList()
            : a == 3
                ? transcript.semester5.map((semester) {
                    return [
                      semester.semesterNo,
                      semester.code,
                      semester.name,
                      semester.crh,
                      semester.grade,
                      semester.gradePoint,
                      semester.SGPA,
                    ];
                  }).toList()
                : transcript.semester7.map((semester) {
                    return [
                      semester.semesterNo,
                      semester.code,
                      semester.name,
                      semester.crh,
                      semester.grade,
                      semester.gradePoint,
                      semester.SGPA,
                    ];
                  }).toList();
    final data2 = a == 1
        ? transcript.semester2.map((semester) {
            return [
              semester.semesterNo,
              semester.code,
              semester.name,
              semester.crh,
              semester.grade,
              semester.gradePoint,
              semester.SGPA,
            ];
          }).toList()
        : a == 2
            ? transcript.semester4.map((semester) {
                return [
                  semester.semesterNo,
                  semester.code,
                  semester.name,
                  semester.crh,
                  semester.grade,
                  semester.gradePoint,
                  semester.SGPA,
                ];
              }).toList()
            : a == 3
                ? transcript.semester6.map((semester) {
                    return [
                      semester.semesterNo,
                      semester.code,
                      semester.name,
                      semester.crh,
                      semester.grade,
                      semester.gradePoint,
                      semester.SGPA,
                    ];
                  }).toList()
                : transcript.semester8.map((semester) {
                    return [
                      semester.semesterNo,
                      semester.code,
                      semester.name,
                      semester.crh,
                      semester.grade,
                      semester.gradePoint,
                      semester.SGPA,
                    ];
                  }).toList();

    return Row(
      children: [
        Container(
          width: 4.1 * PdfPageFormat.inch,
          child: Table.fromTextArray(
            headers: headers1,
            data: data1,
            cellStyle: TextStyle(
              fontSize: 5,
            ),
            border: pw.TableBorder(right: BorderSide()),
            headerStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 6,
            ),
            headerDecoration: BoxDecoration(color: PdfColors.grey300),
            cellHeight: 0,
            defaultColumnWidth: IntrinsicColumnWidth(),
            cellAlignments: {
              0: Alignment.centerLeft,
              1: Alignment.centerLeft,
              2: Alignment.centerLeft,
              3: Alignment.centerLeft,
              4: Alignment.center,
              5: Alignment.center,
              6: Alignment.center,
              7: Alignment.centerRight,
            },
          ),
        ),
        Container(
          width: 4.1 * PdfPageFormat.inch,
          child: Table.fromTextArray(
            headers: headers2,
            data: data2,
            cellStyle: TextStyle(
              fontSize: 5,
            ),
            border: pw.TableBorder(left: BorderSide()),
            headerStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 6,
            ),
            headerDecoration: BoxDecoration(color: PdfColors.grey300),
            cellHeight: 0,
            defaultColumnWidth: IntrinsicColumnWidth(),
            cellAlignments: {
              0: Alignment.centerLeft,
              1: Alignment.centerLeft,
              2: Alignment.centerLeft,
              3: Alignment.centerLeft,
              4: Alignment.center,
              5: Alignment.center,
              6: Alignment.center,
              7: Alignment.centerRight,
            },
          ),
        )
      ],
    );
  }

  static Widget buildTotal(Transcript transcript) {
    final totalcrh =
        num.parse(Utils.GetTotalCRH(transcript).toStringAsFixed(2));
    final totalGrades =
        num.parse(Utils.GetTotalPoints(transcript).toStringAsFixed(2));
    final total = totalGrades / totalcrh;
    final cgpa = num.parse(total.toStringAsFixed(2));

    return Container(
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Spacer(flex: 6),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildText(
                  title: 'Total Credit Hours',
                  value: totalcrh.toString(),
                  unite: true,
                ),
                buildText(
                  title: 'Total Grade Points',
                  value: totalGrades.toString(),
                  unite: true,
                ),
                Divider(),
                buildText(
                  title: 'CGPA',
                  titleStyle: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                  value: cgpa.toString(),
                  unite: true,
                ),
                SizedBox(height: 2 * PdfPageFormat.mm),
                Container(height: 1, color: PdfColors.grey400),
                SizedBox(height: 0.5 * PdfPageFormat.mm),
                Container(height: 1, color: PdfColors.grey400),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget buildFooter(Transcript invoice) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Divider(),
          SizedBox(height: 2 * PdfPageFormat.mm),
          buildSimpleText(title: 'Address', value: invoice.lms.address),
          SizedBox(height: 1 * PdfPageFormat.mm),
          buildSimpleText(title: 'Paypal', value: ''),
        ],
      );

  static buildSimpleText({
    required String title,
    required String value,
  }) {
    final style = TextStyle(fontWeight: FontWeight.bold, fontSize: 10);

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: pw.CrossAxisAlignment.end,
      children: [
        Text(title, style: style),
        SizedBox(width: 2 * PdfPageFormat.mm),
        Text(value),
      ],
    );
  }

  static buildText({
    required String title,
    required String value,
    double width = double.infinity,
    TextStyle? titleStyle,
    bool unite = false,
  }) {
    final style =
        titleStyle ?? TextStyle(fontWeight: FontWeight.bold, fontSize: 10);

    return Container(
      width: width,
      child: Row(
        children: [
          Expanded(child: Text(title, style: style)),
          Text(value, style: unite ? style : TextStyle(fontSize: 10)),
        ],
      ),
    );
  }
}

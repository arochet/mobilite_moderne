import 'package:mobilite_moderne/PRESENTATION/core/_components/spacing.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/table_sticky_headers.dart';
import 'package:flutter/material.dart';

class DisplayDBTable extends StatelessWidget {
  final List<CellHeader> titles;
  final int rowLength;
  final Object? Function(int columnIndex, int rowIndex) cell;
  final String? nameTable;
  const DisplayDBTable(
      {super.key, required this.titles, required this.rowLength, required this.cell, this.nameTable});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (nameTable != null) ...[
          const SpaceH10(),
          Text(nameTable!, style: Theme.of(context).textTheme.titleMedium),
        ],
        const SpaceH10(),
        Expanded(
          child: StickyHeadersTable(
            columnsLength: titles.length,
            rowsLength: rowLength,
            widthCell: (rowIndex) => titles[rowIndex].width.toDouble(),
            cellDimensions: const CellDimensions(
              contentCellWidth: 60,
              contentCellHeight: 30,
              stickyLegendWidth: 40,
              stickyLegendHeight: 30,
            ),
            columnsTitleBuilder: (i) => titles[i].toWidget(),
            rowsTitleBuilder: (i) => Padding(
              padding: const EdgeInsets.all(3.0),
              child: Center(child: Text((i + 1).toString())),
            ),
            contentCellBuilder: (column, row) {
              final valueCell = cell(column, row);

              if (valueCell is String)
                return _cellFromText(valueCell);
              else if (valueCell is int)
                return _cellFromInt(valueCell);
              else if (valueCell is bool)
                return _cellFromBool(valueCell);
              else if (valueCell is Widget)
                return valueCell;
              else {
                return const SizedBox(width: 5, height: 5);
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _cellFromText(String text) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Text('$text '),
      ),
    );
  }

  Widget _cellFromInt(int num) {
    return Center(
      child: Text('$num '),
    );
  }

  Widget _cellFromBool(bool value) {
    return Center(
      child: value
          ? const Icon(
              Icons.check,
              color: Colors.white,
            )
          : const Icon(
              Icons.close,
              color: Colors.white,
            ),
    );
  }
}

class CellHeader {
  final String title;
  final int width;
  const CellHeader(this.title, {this.width = 60});

  Widget toWidget() {
    return SizedBox(
      width: width.toDouble(),
      child: Center(child: Text(title)),
    );
  }
}

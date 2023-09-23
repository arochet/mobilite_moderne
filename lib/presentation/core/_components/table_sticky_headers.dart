import 'package:flutter/material.dart' hide DateUtils;

import '../_core/app_widget.dart';

/// Table with sticky headers. Whenever you scroll content horizontally
/// or vertically - top and left headers always stay.
class StickyHeadersTable extends StatefulWidget {
  StickyHeadersTable({
    /// Number of Columns (for content only)
    required this.columnsLength,

    /// Number of Rows (for content only)
    required this.rowsLength,

    /// Builder for column titles. Takes index of content column as parameter
    /// and returns String for column title
    required this.columnsTitleBuilder,

    /// Builder for row titles. Takes index of content row as parameter
    /// and returns String for row title
    required this.rowsTitleBuilder,

    /// Builder for content cell. Takes index for content column first,
    /// index for content row second and returns String for cell
    required this.contentCellBuilder,
    Key? key,

    /// Title for Top Left cell (always visible)
    this.legendCell = const Text(' '),

    /// Width Cell by column
    this.widthCell,

    /// Table cell dimensions
    this.cellDimensions = CellDimensions.base,

    /// Type of fit for content
    this.cellFit = BoxFit.scaleDown,

    /// Click on the row
    this.rowSelect,
    this.isRowSelected,
  }) : super(key: key);

  final int rowsLength;
  final int columnsLength;
  final Widget legendCell;
  final Widget Function(int colulmnIndex) columnsTitleBuilder;
  final Widget Function(int rowIndex) rowsTitleBuilder;
  final Widget Function(int columnIndex, int rowIndex) contentCellBuilder;
  final Function(int rowIndex)? rowSelect;
  final double Function(int rowIndex)? widthCell;
  final CellDimensions cellDimensions;
  final BoxFit cellFit;
  final bool Function(int rowIndex)? isRowSelected;

  @override
  _StickyHeadersTableState createState() => _StickyHeadersTableState();
}

class _StickyHeadersTableState extends State<StickyHeadersTable> {
  final ScrollController _verticalTitleController = ScrollController();
  final ScrollController _verticalBodyController = ScrollController();

  final ScrollController _horizontalBodyController = ScrollController();
  final ScrollController _horizontalTitleController = ScrollController();

  late _SyncScrollController _verticalSyncController;
  late _SyncScrollController _horizontalSyncController;

  final double paddingBottom = 50;

  @override
  void initState() {
    super.initState();
    _verticalSyncController = _SyncScrollController(<ScrollController>[
      _verticalTitleController,
      _verticalBodyController,
    ]);
    _horizontalSyncController = _SyncScrollController(<ScrollController>[
      _horizontalTitleController,
      _horizontalBodyController,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final colorRow = colorpanel(50);
    final colorSelection = Theme.of(context).primaryColor.withOpacity(0.2);
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            // STICKY LEGEND
            SizedBox(
              width: widget.cellDimensions.stickyLegendWidth,
              height: widget.cellDimensions.stickyLegendHeight,
              child: FittedBox(
                fit: widget.cellFit,
                child: widget.legendCell,
              ),
            ),
            // STICKY ROW
            Expanded(
              child: NotificationListener<ScrollNotification>(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List<Widget>.generate(
                      widget.columnsLength,
                      (int i) => SizedBox(
                        width: widget.widthCell != null
                            ? widget.widthCell!(i)
                            : widget.cellDimensions.contentCellWidth,
                        height: widget.cellDimensions.stickyLegendHeight,
                        child: FittedBox(
                          fit: widget.cellFit,
                          child: widget.columnsTitleBuilder(i),
                        ),
                      ),
                    ),
                  ),
                  controller: _horizontalTitleController,
                ),
                onNotification: (ScrollNotification notification) {
                  _horizontalSyncController.processNotification(notification, _horizontalTitleController);
                  return true;
                },
              ),
            )
          ],
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // STICKY COLUMN
              NotificationListener<ScrollNotification>(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: paddingBottom),
                    child: Column(children: [
                      //DIVIDER
                      Container(
                          width: widget.cellDimensions.stickyLegendWidth,
                          child: Divider(height: 1, color: colorpanel(50))),
                      //LIST GENERATE
                      ...List<Widget>.generate(
                        widget.rowsLength,
                        (int i) => Container(
                          width: widget.cellDimensions.stickyLegendWidth,
                          height: widget.cellDimensions.contentCellHeight,
                          decoration: BoxDecoration(
                            color: widget.isRowSelected != null
                                ? (widget.isRowSelected!(i) ? colorSelection : (i % 2 == 1 ? colorRow : null))
                                : (i % 2 == 1 ? colorRow : null),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(6), bottomLeft: Radius.circular(6)),
                          ),
                          child: SizedBox(
                            width: widget.cellDimensions.stickyLegendWidth,
                            height: widget.cellDimensions.contentCellHeight,
                            child: widget.rowsTitleBuilder(i),
                          ),
                        ),
                      ),
                    ]),
                  ),
                  controller: _verticalTitleController,
                ),
                onNotification: (ScrollNotification notification) {
                  _verticalSyncController.processNotification(notification, _verticalTitleController);
                  return true;
                },
              ),
              // CONTENT
              Expanded(
                child: NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification notification) {
                    _horizontalSyncController.processNotification(notification, _horizontalBodyController);
                    return true;
                  },
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    controller: _horizontalBodyController,
                    child: NotificationListener<ScrollNotification>(
                      child: SingleChildScrollView(
                          controller: _verticalBodyController,
                          child: Padding(
                            padding: EdgeInsets.only(bottom: paddingBottom),
                            child: Column(children: [
                              //DIVIDER
                              Container(
                                  width: widget.widthCell != null
                                      ? calculateTotalWidth(widget.columnsLength, widget.widthCell!)
                                      : widget.cellDimensions.contentCellWidth * widget.columnsLength,
                                  child: Divider(height: 1, color: colorpanel(50))),
                              //ROWS CONTENT
                              ...List.generate(
                                widget.rowsLength,
                                (int i) => InkWell(
                                  onTap: (() {
                                    if (widget.rowSelect != null) {
                                      widget.rowSelect!(i);
                                    }
                                  }),
                                  child: Row(
                                    children: List<Container>.generate(
                                      widget.columnsLength,
                                      (int j) => Container(
                                        width: widget.widthCell != null
                                            ? widget.widthCell!(j)
                                            : widget.cellDimensions.contentCellWidth,
                                        height: widget.cellDimensions.contentCellHeight,
                                        //Arrondis + Couleur
                                        decoration: BoxDecoration(
                                          color: widget.isRowSelected != null
                                              ? (widget.isRowSelected!(i)
                                                  ? colorSelection
                                                  : (i % 2 == 1 ? colorRow : null))
                                              : (i % 2 == 1 ? colorRow : null),
                                          borderRadius: j == widget.columnsLength - 1
                                              ? BorderRadius.only(
                                                  topRight: Radius.circular(6),
                                                  bottomRight: Radius.circular(6))
                                              : null,
                                        ),
                                        child: FittedBox(
                                          fit: widget.cellFit,
                                          child: widget.contentCellBuilder(j, i),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                          )),
                      onNotification: (ScrollNotification notification) {
                        _verticalSyncController.processNotification(notification, _verticalBodyController);
                        return true;
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  double calculateTotalWidth(int numberOfColumns, double Function(int) widthCell) {
    double totalWidth = 0;
    for (int i = 0; i < numberOfColumns; i++) {
      double cellWidth = widthCell(i);
      totalWidth += cellWidth;
    }
    return totalWidth;
  }
}

/// Dimensions for table
class CellDimensions {
  const CellDimensions({
    /// Content cell width. It also applied to sticky row width.
    required this.contentCellWidth,

    /// Content cell height. It also applied to sticky column height.
    required this.contentCellHeight,

    /// Sticky legend width. It also applied to sticky column width.
    required this.stickyLegendWidth,

    /// Sticky legend height/ It also applied to sticky row height.
    required this.stickyLegendHeight,
  });

  final double contentCellWidth;
  final double contentCellHeight;
  final double stickyLegendWidth;
  final double stickyLegendHeight;

  static const CellDimensions base = CellDimensions(
    contentCellWidth: 70.0,
    contentCellHeight: 50.0,
    stickyLegendWidth: 120.0,
    stickyLegendHeight: 50.0,
  );
}

/// SyncScrollController keeps scroll controllers in sync.
class _SyncScrollController {
  _SyncScrollController(List<ScrollController> controllers) {
    controllers.forEach(
      (ScrollController controller) => _registeredScrollControllers.add(controller),
    );
  }

  final List<ScrollController> _registeredScrollControllers = [];

  ScrollController? _scrollingController;
  bool _scrollingActive = false;

  void processNotification(ScrollNotification notification, ScrollController sender) {
    if (notification is ScrollStartNotification && !_scrollingActive) {
      _scrollingController = sender;
      _scrollingActive = true;
      return;
    }

    if (identical(sender, _scrollingController) && _scrollingActive) {
      if (notification is ScrollEndNotification) {
        _scrollingController = null;
        _scrollingActive = false;
        return;
      }

      if (notification is ScrollUpdateNotification) {
        for (ScrollController controller in _registeredScrollControllers) {
          if (identical(_scrollingController, controller)) {
            continue;
          } else if (_scrollingController != null) {
            controller.jumpTo(_scrollingController!.offset);
          }
        }
      }
    }
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:kanbanapp2/shared/kanban_board_helpers/boardview_controller.dart';
import 'package:kanbanapp2/shared/kanban_board_helpers/board_list.dart';
import 'package:kanbanapp2/shared/kanban_board_helpers/board_item.dart';
import 'package:kanbanapp2/shared/kanban_board_helpers/boardview.dart';

class KanbanBoard extends StatefulWidget {
  final List<BoardListObject> _listData;

  @override
  KanbanBoard(this._listData, {Key key}) : super(key: key);

  @override
  _KanbanBoardState createState() => _KanbanBoardState();
}

class _KanbanBoardState extends State<KanbanBoard> {
  var boardViewController = BoardViewController();

  var titleCreateCardTextFormFieldController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    List<BoardList> _lists = [];
    for (var listDatum in widget._listData) {
      _lists.add(_createBoardList(listDatum));
    }

    return BoardView(
      lists: _lists,
      boardViewController: boardViewController,
    );
  }

  Widget _createBoardList(BoardListObject list) {
    List<BoardItem> items = [];
    for (var item in list.items) {
      items.add(buildBoardItem(item));
    }

    list.textEditingController.text = list.title;
    return BoardList(
      onStartDragList: (int listIndex) {},
      onTapList: (int listIndex) async {},
      onDropList: (int listIndex, int oldListIndex) {
        list = widget._listData[oldListIndex];
        widget._listData.removeAt(oldListIndex);
        widget._listData.insert(listIndex, list);
      },
      headerBackgroundColor: Color.fromRGBO(210, 210, 210, 1),
      backgroundColor: Color.fromRGBO(210, 210, 210, 1),
      header: [
        // Header of BoardList // BKMRK
        Expanded(
          child: Wrap(
            children: [
              Padding(
                padding: EdgeInsets.all(5),
                child: EditableText(
                  onSubmitted: (String newBoardListTitle) {
                    setState(() {
                      list.title = newBoardListTitle;
                    });
                  },
                  controller: list.textEditingController,
                  focusNode: FocusNode(),
                  cursorColor: Colors.grey,
                  backgroundCursorColor: Colors.yellow,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Row(
                children: [
                  FlatButton(
                    child: Icon(
                      Icons.add,
                      color: Colors.grey,
                    ),
                    minWidth: 20,
                    onPressed: () {
                      // TODO: factor this logic out into its own method

                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: Stack(
                                children: <Widget>[
                                  Center(
                                    child: Form(
                                      key: _formKey,
                                      child: Column(
                                        children: [
                                          TextFormField(
                                            controller:
                                                titleCreateCardTextFormFieldController,
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return 'Please enter some text';
                                              }
                                              return null;
                                            },
                                          ),
                                          DropdownButton(
                                            // TODO: finish implementing velocity picker
                                            // Velocity picker
                                            onTap: () {
                                              // TODO: Implement
                                            },
                                            items: [
                                              DropdownMenuItem(
                                                  child: Text('1')),
                                              DropdownMenuItem(
                                                  child: Text('2')),
                                              DropdownMenuItem(
                                                  child: Text('3')),
                                            ],
                                          ),
                                          RaisedButton(
                                            child: Text('Create card'),
                                            onPressed: () {
                                              if (_formKey.currentState
                                                  .validate()) {
                                                // FIXME: validation is not working. The form doen't enforce that title field needs to be filled
                                                //   // FIXME: snack bar breaks everything
                                                //   // Scaffold.of(context)
                                                //   //     .showSnackBar(SnackBar(
                                                //   //         backgroundColor:
                                                //   //             Colors.red,
                                                //   //         elevation: 100,
                                                //   //         content: Text(
                                                //   //             'Processing Data')));
                                              }

                                              /* Use form data to construct new card */
                                              setState(
                                                () {
                                                  list.items.add(
                                                      BoardItemObject(this
                                                          .titleCreateCardTextFormFieldController
                                                          .value
                                                          .text));

                                                  // Blank out field for next time add button is clicked
                                                  this.titleCreateCardTextFormFieldController =
                                                      TextEditingController();
                                                },
                                              );

                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });

                      // BKMRK
                    }, // TODO: Implement edit column label logic
                  ),
                  FlatButton(
                    child: Icon(
                      Icons.delete,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Column(
                              children: [
                                Text(
                                    'Are you sure you want to delete all cards in this column?'),
                                Center(
                                  child: Row(
                                    children: [
                                      FlatButton(
                                        color: Colors.lightGreen,
                                        child: Text('Yes'),
                                        onPressed: () {
                                          // TODO: implement
                                        },
                                      ),
                                      RaisedButton(
                                        color: Colors.red,
                                        child: Text('No'),
                                        onPressed: () {
                                          // TODO: implement
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ],
      items: items,
    );
  }

  Widget buildBoardItem(BoardItemObject itemObject) {
    return BoardItem(
      onStartDragItem: (int listIndex, int itemIndex, BoardItemState state) {},
      onDropItem: (int listIndex, int itemIndex, int oldListIndex,
          int oldItemIndex, BoardItemState state) {
        var item = widget._listData[oldListIndex].items[oldItemIndex];
        widget._listData[oldListIndex].items.removeAt(oldItemIndex);
        widget._listData[listIndex].items.insert(itemIndex, item);
      },
      onTapItem: (int listIndex, int itemIndex, BoardItemState state) async {},
      item: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(itemObject.title),
        ),
      ),
    );
  }
}

class BoardListObject {
  String title;
  List<BoardItemObject> items;
  TextEditingController textEditingController;

  BoardListObject({this.title, this.items}) {
    if (this.title == null) {
      this.title = "";
    }
    if (this.items == null) {
      this.items = [];
    }

    this.textEditingController = TextEditingController();
  }
}

class BoardItemObject {
  String title;

  BoardItemObject(this.title) {
    if (this.title == null) {
      this.title = "";
    }
  }
}

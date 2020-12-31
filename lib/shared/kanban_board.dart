import 'package:flutter/material.dart';

import 'package:kanbanapp2/shared/kanban_board_helpers/boardview_controller.dart';
import 'package:kanbanapp2/shared/kanban_board_helpers/board_list.dart';
import 'package:kanbanapp2/shared/kanban_board_helpers/board_item.dart';
import 'package:kanbanapp2/shared/kanban_board_helpers/boardview.dart';

class KanbanBoard extends StatefulWidget {
  KanbanBoard({Key key}) : super(key: key);

  // TODO: initialize to empty list after adding create new task button
  final List<BoardListObject> _listData = [
    BoardListObject(title: "To Do", items: <BoardItemObject>[
      BoardItemObject("board item object 1"),
    ]),
    BoardListObject(title: "In Progress", items: <BoardItemObject>[
      BoardItemObject("board item object 2"),
    ]),
    BoardListObject(title: "Waiting", items: <BoardItemObject>[
      BoardItemObject("board item object 3"),
    ]),
    BoardListObject(title: "Done", items: <BoardItemObject>[
      BoardItemObject("board item object 4"),
    ]),
  ];

  @override
  _KanbanBoardState createState() => _KanbanBoardState();
}

class _KanbanBoardState extends State<KanbanBoard> {
  var boardViewController =
      BoardViewController(); // TODO: can I make this final?

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
              Align(
                alignment: Alignment.center,
                child: FlatButton(
                  minWidth: 20,
                  onPressed: () {
                    // TODO: factor this logic out into its own method

                    /* TODO: jump to a new screen where we fill out a simple form to create a task. When the form
                    is submitted, we jump back to original screen. (Or instead, try to overlay something)
                     */

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
                                        DropdownButton( // TODO: finish implementing velocity picker
                                          // Velocity picker
                                          onTap: () {
                                            // TODO: Implement
                                          },
                                          items: [
                                            DropdownMenuItem(child: Text('1')),
                                            DropdownMenuItem(child: Text('2')),
                                            DropdownMenuItem(child: Text('3')),
                                          ],
                                        ),
                                        RaisedButton(
                                          child: Text('Create card'),
                                          onPressed: () {
                                            if (_formKey.currentState
                                                .validate()) { // FIXME: validation is not working. The form doen't enforce that title field needs to be filled
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
                                                list.items.add(BoardItemObject(this
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
                  child: Icon(
                    Icons.add,
                    color: Colors.grey,
                  ),
                ),
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

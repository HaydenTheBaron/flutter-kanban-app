import 'package:flutter/material.dart';
import 'package:kanbanapp2/shared/kanban_board.dart';

class SprintBoard extends KanbanBoard {
  SprintBoard({Key key})
      : super(<BoardListObject>[
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
          ])
        ], key: key);
}

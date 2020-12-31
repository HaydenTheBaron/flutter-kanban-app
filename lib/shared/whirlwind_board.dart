import 'package:flutter/material.dart';
import 'package:kanbanapp2/shared/kanban_board.dart';


class WhirlwindBoard extends KanbanBoard {
  WhirlwindBoard({Key key})
      : super(<BoardListObject>[
          BoardListObject(title: "High Priority", items: <BoardItemObject>[
            BoardItemObject("w item object 1"),
          ]),
          BoardListObject(title: "Mid Priority", items: <BoardItemObject>[
            BoardItemObject("w item object 2"),
          ]),
          BoardListObject(title: "Low Priority", items: <BoardItemObject>[
            BoardItemObject("w item object 3"),
          ]),
          BoardListObject(title: "TRASH", items: <BoardItemObject>[
          ]),

        ], key: key);
}

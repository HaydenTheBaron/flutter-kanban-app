import 'package:flutter/material.dart';
import 'package:kanbanapp2/shared/kanban_board.dart';


class SummitsBoard extends KanbanBoard {
  SummitsBoard({Key key})
      : super(<BoardListObject>[
          BoardListObject(title: "Summit 1", items: <BoardItemObject>[
          ]),
          BoardListObject(title: "Summit 2", items: <BoardItemObject>[
          ]),
          BoardListObject(title: "Summit 3", items: <BoardItemObject>[
          ]),
          BoardListObject(title: "Summit 4", items: <BoardItemObject>[
          ]),
          BoardListObject(title: "TRASH", items: <BoardItemObject>[
          ]),
        ], key: key);
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_firestore_steam1/models/schedule/todo.dart';
import 'package:riverpod_firestore_steam1/models/schedule/todo_api_repository.dart';

final todoListViewModel = StateNotifierProvider<TodoListViewModel, List<Todo>>((ref) {
  return TodoListViewModel([], ref)..initViewModel(); //초기화는 []과 ref ..cascade
});

class TodoListViewModel extends StateNotifier<List<Todo>> {
  Ref _ref; // ref를 받고
  TodoListViewModel(super.state, this._ref); // 상태에 []

  void initViewModel() async {
    // view모델을 초기화하는 메서드
    print("실행됨");
  }

  void refresh(List<Todo> productsDto) {
    state = productsDto;
  }

  void addTodo(Todo TodoReqDto) {
    state = [...state, TodoReqDto];
  }
}

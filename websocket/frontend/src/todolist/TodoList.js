import React, { Component } from 'react';
import TodoForm from "./Todoform";
import TodoItem from "./TodoItem";

const apiURL = 'http://localhost:3001/api/v1/todos/';

class TodoList extends Component {
  constructor(props) {
    super(props);

    this.state = {
      items: []
    };

    this.updateTodoList = this.updateTodoList.bind(this);
  };

  componentDidMount() {
    this.getTasks();
  };

  getTasks() {
    fetch(apiURL)
      .then(response => response.json())
      .then(responseItems => {
        this.setState({
          items: responseItems
        });
      });
  };

  updateTodoList(item) {
    const currentItems = this.state.items;
    this.setState({
      items: [item, ...currentItems]
    });
  };

  render() {
    return (
      <div>
        <TodoForm apiURL={apiURL} updateTodoList={this.updateTodoList}/>
        <ul id="todoList">
          {
            this.state.items.map((item) => (
              <TodoItem
                key={item.id}
                item={item}
              />
            ))
          }
        </ul>
      </div>
    );
  };
};

export default TodoList;

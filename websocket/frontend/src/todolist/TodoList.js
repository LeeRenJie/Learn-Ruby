import React, { Component } from 'react';
import TodoForm from "./Todoform"
import TodoItem from "./TodoItem"
import Grid from '@material-ui/core/Grid';

const apiURL = 'http://localhost:3001/api/v1/todos/';

class TodoList extends Component {
  constructor(props) {
    super(props);

    this.state = {
      items: []
    };

    this.updateTodoList = this.updateTodoList.bind(this);
    this.deleteItem = this.deleteItem.bind(this);
  };

  componentDidMount() {
    this.getTasks();
  };

  getTasks() {
    fetch(apiURL)
    .then(response => response.json())
    .then(response_items => {
      this.setState({
        items: response_items.reverse()
      });
    });
  };

  updateTodoList(item) {
    let currentItems = this.state.items;
    this.setState({
      items: [item, ...currentItems]
    });
  };

  deleteItem(item) {
    // delete the item through API
    // localhost:3001//api/v1/todos + /:id
    let deleteURL = apiURL + `/${item.id}`;
    fetch(deleteURL, {
      method: 'DELETE'
    }).then(() => {
      // Client side delete
      let currentItems = this.state.items;
      let index = currentItems.indexOf(item);
      currentItems.splice(index, 1);
      this.setState({
        items: currentItems
      });
    });
  };

  render() {
    return (
      <Grid container spacing={3}>
        <Grid item xs={12}>
          <TodoForm apiURL={apiURL} updateTodoList={this.updateTodoList}/>
        </Grid>
        <Grid item xs={12} id="todoList">
          {this.state.items.map((item) => (
            <TodoItem
              key={item.id}
              item={item}
              deleteItem={this.deleteItem}
            />
            ))
          }
        </Grid>
      </Grid>
    );
  };
};

export default TodoList;

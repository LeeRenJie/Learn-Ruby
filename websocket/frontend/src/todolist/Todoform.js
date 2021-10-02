import React, { Component } from 'react';
import TextField from '@material-ui/core/TextField';
import Button from '@material-ui/core/Button';

class TodoForm extends Component {
  constructor(props) {
    super(props);
    this.state = {
      task: "",
    };
    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleTaskChange = this.handleTaskChange.bind(this);
  }

  handleSubmit(event) {
    event.preventDefault();
    this.formSubmit(event.target);
  }

  formSubmit(formData) {
    const data = new FormData(formData);
    const obj = {
      method: 'POST',
      mode: 'cors',
      body: data,
    };
    fetch(this.props.apiURL, obj)
    .then(res => res.json())
    .then(resJson => this.props.updateTodoList(resJson));
  }

  handleTaskChange(event) {
    this.setState({
      task: event.target.value,
    });
  };

  render() {
    return (
      <div>
        <form onSubmit={this.handleSubmit} id="todoForm" autoComplete="off">
          <TextField
            id="taskInput"
            label="Task Description"
            variant="outlined"
            type="text"
            name="todo[task]"
            onChange={this.handleTaskChange}
          />
          <Button
            variant="contained"
            type="submit"
            color="primary"
          >
            Add Task
          </Button>
        </form>
      </div>
    );
  };
};

export default TodoForm;

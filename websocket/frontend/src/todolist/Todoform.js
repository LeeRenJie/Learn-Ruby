import React, { Component } from 'react';
import TextField from '@material-ui/core/TextField';
import Button from '@material-ui/core/Button';
import Grid from '@material-ui/core/Grid';

class TodoForm extends Component {
  constructor(props) {
    super(props);
    this.state = {
      apiURL: props.apiURL,
      task: "",
    };
    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleTaskChange = this.handleTaskChange.bind(this);
  };

  handleSubmit(event) {
    event.preventDefault();
    this.formSubmit(event.target);
  };

  async formSubmit(formData) {
    const data = new FormData(formData);
    const obj = {
      method: 'POST',
      mode: 'cors',
      body: data,
    };
    const res = await fetch(this.state.apiURL, obj).then(response => response.json());
    this.props.updateTodoList(res);
  };

  handleTaskChange(event) {
    this.setState({
      task: event.target.value,
    });
  };

  render() {
    return (
      <Grid container>
        <Grid item xs></Grid>
        <Grid item xs={10}>
          <form onSubmit={this.handleSubmit} id="todoForm" autoComplete="off">
            <Grid container>
              <Grid item xs={10}>
                <TextField
                  id="taskInput"
                  label="Task Description"
                  variant="outlined"
                  type="text"
                  name="todo[task]"
                  onChange={this.handleTaskChange}
                  fullWidth
                />
              </Grid>
              <Grid item xs={2}>
                <Button
                  variant="contained"
                  type="submit"
                  color="primary"
                  style={{ height:"100%" }}
                >
                  Add Task
                </Button>
              </Grid>
            </Grid>
          </form>
        </Grid>
        <Grid item xs></Grid>
      </Grid>
    );
  };
};

export default TodoForm;

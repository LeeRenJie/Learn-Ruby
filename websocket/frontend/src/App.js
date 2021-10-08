import './App.css';
import React from 'react';
import TodoList from './todolist/TodoList'
import Typography from '@material-ui/core/Typography';
import { makeStyles } from '@material-ui/core';

const useStyles = makeStyles({
  title: {
    textAlign: 'center',
  },
})

function App() {
  const classes = useStyles();
  return (
    <div className="App">
      <header className="App-header">
        <Typography variant="h1" className={classes.title}>Todo Stream</Typography>
        <hr/>
        <TodoList/>
      </header>
    </div>
  );
}

export default App;

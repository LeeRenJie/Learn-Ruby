import React, { Component } from "react";
import Grid from "@material-ui/core/Grid";
import Paper from "@material-ui/core/Paper";
import { withStyles } from "@material-ui/core";
import Button from "@material-ui/core/Button";
import DeleteIcon from "@material-ui/icons/Delete";

const useStyles = theme => ({
  root: {
    padding: "2em",
    height: "3em",
    margin: "1em"
  }
});

class TodoItem extends Component {
  constructor(props) {
    super(props);
    this.handleDelete = this.handleDelete.bind(this);
  };

  handleDelete() {
    this.props.deleteItem(this.props.item);
  };

  render(){
    const { classes } = this.props;
    return (
      <Grid container spacing={0}>
        <Grid item xs={9}>
          <Paper elevation={3} className={classes.root}>
            {this.props.item.task}
            <hr/>
            <Button
              variant="contained"
              color="secondary"
              size="small"
              startIcon={<DeleteIcon />}
              onClick={this.handleDelete}
            >
              Delete
            </Button>
          </Paper>
        </Grid>
      </Grid>
    );
  };
};

export default withStyles(useStyles)(TodoItem);

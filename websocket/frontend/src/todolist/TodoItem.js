import React, { Component } from "react";
import Grid from "@material-ui/core/Grid";
import Paper from "@material-ui/core/Paper";
import { withStyles } from "@material-ui/core";
import Button from "@material-ui/core/Button";
import DeleteIcon from "@material-ui/icons/Delete";
import Typography from "@material-ui/core/Typography";

const useStyles = ({
  root: {
    padding: "2em",
    margin: "1em",
    height: "auto"
  },
  divider: {
    margin: "1em",
    marginLeft:"37.5%",
    width: "25%"
  },
  paper: {
    margin: "1em",
    padding: "2em",
    textAlign: "justify"
  },
  heading: {
    textAlign: "center"
  },
  body: {
    padding: "1em"
  },
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
        <Grid item xs={1}></Grid>
        <Grid item xs={10}>
          <Paper elevation={10} className={classes.paper}>
            <Typography variant="h4" className={classes.heading}>
              {this.props.item.task}
            </Typography>
            <hr className={classes.divider}/>
            <div className={classes.body}>
              <Typography variant="body1">
                {this.props.item.body}
              </Typography>
            </div>
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

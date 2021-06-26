import React, { Fragment, useState } from "react";
import { makeStyles } from "@material-ui/core";
import { Avatar, Button, Checkbox, Tooltip, Typography } from "@material-ui/core";
import Paper from '@material-ui/core/Paper';
import InputBase from '@material-ui/core/InputBase';
import Divider from '@material-ui/core/Divider';
import IconButton from '@material-ui/core/IconButton';
import MenuIcon from '@material-ui/icons/Menu';
import SearchIcon from '@material-ui/icons/Search';
import DirectionsIcon from '@material-ui/icons/Directions';
import List from '@material-ui/core/List';
import ListItem from '@material-ui/core/ListItem';
import ListItemSecondaryAction from '@material-ui/core/ListItemSecondaryAction';
import ListItemText from '@material-ui/core/ListItemText';
import ListItemAvatar from '@material-ui/core/ListItemAvatar';
import PermMediaIcon from '@material-ui/icons/PermMedia';
import DeleteIcon from '@material-ui/icons/Delete';
import CreateIcon from '@material-ui/icons/Create';
import ConfirmDeleteDialog from "../components/ConfirmDeleteDialog";
import CreatePlantDialog from "../components/CreatePlantDialog";
import EditPlantDialog from "../components/EditPlantDialog";
import { Table, TableHead, TableBody, TableRow, TableCell, Select, MenuItem, InputLabel } from '@material-ui/core'

const useStyles = makeStyles((theme) => ({
  root: {
    padding: '2px 4px',
    display: 'flex',
    alignItems: 'center',
    width: 400,
  },
  input: {
    marginLeft: theme.spacing(1),
    flex: 1,
  },
  iconButton: {
    padding: 10,
  },
  divider: {
    height: 28,
    margin: 4,
  },
  largeIcon: {
    width: theme.spacing(7),
    height: theme.spacing(7),
  },
  inline: {
    display: 'inline',
  },
}));

export default function Home() {
  const classes = useStyles();
  const [deleteDialog, setDeleteDialog] = useState(false)
  const [createDialog, setCreateDialog] = useState(false)
  const [editDialog, setEditDialog] = useState(false)

  return (
    <Fragment>
      <div className="app-wrapper">
        <div className="app-header">
           <Button onClick={() => setCreateDialog(true)} variant="contained" color="primary">Nieuwe Plant</Button>
           <div className="app-filters">
              <Paper component="form" className={classes.root}>
                <IconButton type="submit" className={classes.iconButton} aria-label="search">
                  <SearchIcon />
                </IconButton>
                <Divider className={classes.divider} orientation="vertical" />
                <InputBase className={classes.input} placeholder="Search Plants" inputProps={{ 'aria-label': 'search google maps' }} />
              </Paper>
           </div>
        </div>
        <div className="table-container">
        <Paper elevation={3}>
                <Table>
                    <TableHead>
                        <TableRow>
                            <TableCell>Plantcode</TableCell>
                            <TableCell>Naam</TableCell>
                            <TableCell align="right">Soort</TableCell>
                            <TableCell align="right">Kleur</TableCell>
                            <TableCell align="right">Hoogte</TableCell>
                            <TableCell align="right">Start bloeitijd</TableCell>
                            <TableCell align="right">Einde bloeitijd</TableCell>
                            <TableCell align="right">Prijs</TableCell>
                            <TableCell align="right">Acties</TableCell>
                        </TableRow>
                    </TableHead>
                    <TableBody>
                        <TableRow>
                            <TableCell>12</TableCell>
                            <TableCell>Lorem</TableCell>
                            <TableCell align="right">Ipsum</TableCell>
                            <TableCell align="right">Dolor</TableCell>
                            <TableCell align="right">Sit</TableCell>
                            <TableCell align="right">2</TableCell>
                            <TableCell align="right">6</TableCell>
                            <TableCell align="right">16.43</TableCell>
                            <TableCell align="right">
                                <Tooltip title="Plant bewerken" aria-label="bewerken">
                                  <IconButton type="submit" onClick={() => setEditDialog(true)} className={classes.iconButton} aria-label="search">
                                    <CreateIcon />
                                  </IconButton>
                                </Tooltip>
                                <Tooltip title="Plant verwijderen" aria-label="verwijderen">
                                  <IconButton type="submit" onClick={() => setDeleteDialog(true)} className={classes.iconButton} aria-label="search">
                                    <DeleteIcon />
                                  </IconButton>
                                </Tooltip>
                            </TableCell>
                        </TableRow>
                    </TableBody>
                </Table>
            </Paper>
        </div>
      </div>

      {deleteDialog && (
        <ConfirmDeleteDialog 
          isOpen={deleteDialog} 
          handleClose={() => setDeleteDialog(false)} 
          plantTitle="Roos" 
        />
      )}

      {createDialog && (
        <CreatePlantDialog
          isOpen={createDialog} 
          handleClose={() => setCreateDialog(false)} 
        />
      )}

      {editDialog && (
        <EditPlantDialog
          isOpen={editDialog} 
          handleClose={() => setEditDialog(false)} 
        />
      )}
    </Fragment>
  )
}

import React, { useState } from 'react'
import { Button, TextField, Dialog, DialogActions, DialogContent, DialogContentText, DialogTitle, InputBase, Select, MenuItem, FormControl } from '@material-ui/core'
import { createStyles, makeStyles, withStyles, Theme } from '@material-ui/core/styles';

interface DialogContentProps {
    isOpen: boolean
    handleClose: () => void
}

const BootstrapInput = withStyles((theme: Theme) =>
  createStyles({
    root: {
      'label + &': {
        marginTop: theme.spacing(3),
      },
    },
    input: {
      borderRadius: 4,
      position: 'relative',
      backgroundColor: theme.palette.background.paper,
      border: '1px solid #ced4da',
      fontSize: 16,
      padding: '10px 26px 10px 12px',
      transition: theme.transitions.create(['border-color', 'box-shadow']),
      // Use the system font instead of the default Roboto font.
      fontFamily: [
        '-apple-system',
        'BlinkMacSystemFont',
        '"Segoe UI"',
        'Roboto',
        '"Helvetica Neue"',
        'Arial',
        'sans-serif',
        '"Apple Color Emoji"',
        '"Segoe UI Emoji"',
        '"Segoe UI Symbol"',
      ].join(','),
      '&:focus': {
        borderRadius: 4,
        borderColor: '#80bdff',
        boxShadow: '0 0 0 0.2rem rgba(0,123,255,.25)',
      },
    },
  }),
)(InputBase);

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    margin: {
      margin: theme.spacing(1),
    },
    marginForm: {
      marginTop: theme.spacing(1)
    } 
  }),
);

const CreatePlantDialog: React.FC<DialogContentProps> = ({ isOpen, handleClose }) => {
  const classes = useStyles();
  const [kleur, setKleur] = useState('');
  const handleKleurInput = (event: React.ChangeEvent<{ value: unknown }>) => {
    setKleur(event.target.value as string);
  };
    return (
      <React.Fragment>
        <Dialog open={isOpen} onClose={handleClose} aria-labelledby="form-dialog-title">
          <DialogTitle id="form-dialog-title">Plant toevoegen</DialogTitle>
          <DialogContent>
            <DialogContentText>
              Lorem ipsum dolor sit amet consectetur adipisicing elit. Quos, nobis?
            </DialogContentText>
            <TextField  variant="outlined" autoFocus margin="dense" id="title" label="Naam" type="text" fullWidth />
            <FormControl fullWidth>
              <Select fullWidth value={kleur} onChange={handleKleurInput} placeholder="Test" input={<BootstrapInput />} >
                <MenuItem value="">
                  <em>None</em>
                </MenuItem>
                <MenuItem value={10}>Ten</MenuItem>
                <MenuItem value={20}>Twenty</MenuItem>
                <MenuItem value={30}>Thirty</MenuItem>
              </Select>
            </FormControl>
            <FormControl fullWidth className={classes.marginForm}>
              <Select fullWidth value={kleur} onChange={handleKleurInput} placeholder="Test" input={<BootstrapInput />} >
                <MenuItem value="">
                  <em>None</em>
                </MenuItem>
                <MenuItem value={10}>Ten</MenuItem>
                <MenuItem value={20}>Twenty</MenuItem>
                <MenuItem value={30}>Thirty</MenuItem>
              </Select>
            </FormControl>
            <TextField variant="outlined" margin="dense" id="description" label="Hoogte" type="text" fullWidth />
            <TextField variant="outlined" margin="dense" id="description" label="Start bloeitijd" type="number" fullWidth />
            <TextField variant="outlined" margin="dense" id="description" label="Einde bloeitijd" type="number" fullWidth />
            <TextField variant="outlined" margin="dense" id="description" label="Prijs" type="number" fullWidth />
          </DialogContent>
          <DialogActions>
            <Button onClick={handleClose} color="primary">
              Cancel
            </Button>
            <Button onClick={handleClose} color="primary">
              Aanmaken
            </Button>
          </DialogActions>
        </Dialog>
      </React.Fragment>
    )
}

export default CreatePlantDialog

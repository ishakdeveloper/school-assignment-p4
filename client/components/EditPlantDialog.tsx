import React, { useState } from 'react'
import { Button, TextField, Dialog, DialogActions, DialogContent, DialogContentText, DialogTitle, InputBase, Select, MenuItem, FormControl } from '@material-ui/core'
import { createStyles, makeStyles, withStyles, Theme } from '@material-ui/core/styles';
import { PlantI } from '../types/models/plant-model';
import { useForm } from 'react-hook-form';

interface DialogContentProps {
    isOpen: boolean
    handleClose: () => void
    handleEditPlant: (id: number, payload: PlantI) => void
    plant: PlantI
    kleuren: string[]
    soorten: string[]
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

const EditPlantDialog: React.FC<DialogContentProps> = ({ isOpen, handleClose, handleEditPlant, plant, kleuren, soorten }) => {
  const classes = useStyles();
  const { register, handleSubmit } = useForm()

  const handleFormSubmit = (data) => {
    handleEditPlant(plant.plantcode, data)
    console.log(data)
    handleClose()
  }

  return (
      <Dialog open={isOpen} onClose={handleClose} aria-labelledby="form-dialog-title">
      <DialogTitle id="form-dialog-title">Plant bewerken</DialogTitle>
      <DialogContent>
        <DialogContentText>
          Lorem ipsum dolor sit amet consectetur adipisicing elit. Quos, nobis?
        </DialogContentText>
        <form onSubmit={handleSubmit(handleFormSubmit)}>
          <TextField {...register('plantnaam')} defaultValue={plant.plantnaam} variant="outlined" margin="dense" id="title" label="Naam" type="text" fullWidth />
          <FormControl fullWidth>
            <Select {...register('soort')} defaultValue={plant.soort} fullWidth placeholder="Test" input={<BootstrapInput />} >
                {soorten.map((soort, index) => (
                  <MenuItem key={index} value={soort}>{soort}</MenuItem>
                ))}
            </Select>
          </FormControl>
          <FormControl fullWidth className={classes.marginForm}>
            <Select {...register('kleur')} defaultValue={plant.kleur} fullWidth placeholder="Test" input={<BootstrapInput />} >
                {kleuren.map((kleur, index) => (
                  <MenuItem key={index} value={kleur}>{kleur}</MenuItem>
                ))}
            </Select>
          </FormControl>
          <TextField {...register('hoogte')} defaultValue={plant.hoogte} variant="outlined" margin="dense" id="description" label="Hoogte" type="number" fullWidth />
          <TextField {...register('bloeitijd_start')} defaultValue={plant.bloeitijd_start} variant="outlined" margin="dense" id="description" label="Start bloeitijd" type="number" fullWidth />
          <TextField {...register('bloeitijd_eind')} defaultValue={plant.bloeitijd_einde} variant="outlined" margin="dense" id="description" label="Einde bloeitijd" type="number" fullWidth />
          <TextField {...register('prijs')} defaultValue={plant.prijs} variant="outlined" margin="dense" id="description" label="Prijs" type="number" fullWidth />
        </form>
      </DialogContent>
      <DialogActions>
        <Button onClick={handleClose} color="primary">
          Cancel
        </Button>
        <Button onClick={handleSubmit(handleFormSubmit)} color="primary">
          Bewerken
        </Button>
      </DialogActions>
    </Dialog>
  )
}

export default EditPlantDialog

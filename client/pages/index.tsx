import React, { Fragment, useEffect, useState } from "react";
import { makeStyles, withStyles, createStyles, Select, MenuItem, Theme } from "@material-ui/core";
import { Button, Tooltip } from "@material-ui/core";
import Paper from '@material-ui/core/Paper';
import InputBase from '@material-ui/core/InputBase';
import Divider from '@material-ui/core/Divider';
import IconButton from '@material-ui/core/IconButton';
import SearchIcon from '@material-ui/icons/Search';
import DeleteIcon from '@material-ui/icons/Delete';
import CreateIcon from '@material-ui/icons/Create';
import ConfirmDeleteDialog from "../components/ConfirmDeleteDialog";
import CreatePlantDialog from "../components/CreatePlantDialog";
import EditPlantDialog from "../components/EditPlantDialog";
import { Table, TableHead, TableBody, TableRow, TableCell } from '@material-ui/core'
import { PlantI } from "../types/models/plant-model";
import { addPlant, deletePlant, getPlants, updatePlant } from "../services/plant-service";
import { getColors } from "../services/color-service";
import { getSoorten } from "../services/soorten-service";
import { useForm } from "react-hook-form";

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
  const [plants, setPlants] = useState<PlantI[]>([])
  const [filteredPlants, setFilteredPlants] = useState<PlantI[]>(plants)
  const [kleuren, setKleuren] = useState<string[]>([])
  const [kleurenValue, setKleurenValue] = useState<string>('')
  const [soorten, setSoorten] = useState<string[]>([])
  const [plantInfo, setPlantInfo] = useState(null)
  const [search, setSearch] = useState<string>('')
  const [loading, setLoading] = useState<boolean>(true)
  const [deleteDialog, setDeleteDialog] = useState<boolean>(false)
  const [createDialog, setCreateDialog] = useState<boolean>(false)
  const [editDialog, setEditDialog] = useState<boolean>(false)
  const handleSearchQuery = (event) => { setSearch(event.target.value) }
  const onUpdate = (plants: PlantI[]) => {setPlants(plants), setFilteredPlants(plants)}
  const setData = () => getPlants().then(plants => onUpdate(plants))
  const handleAddPlant = (payload: PlantI) => { addPlant(payload).then(() => setData()) }
  const handleEditPlant = (id: number, payload: PlantI) => { updatePlant(id, payload).then(() => setData()) }
  const handleDeletePlant = (id: number) => { deletePlant(id).then(() => setData()) }

  const handleColorFilter = (event) => {
    setKleurenValue(event.target.value)
    let result = plants.filter(plant => plant.kleur === event.target.value)
    if(event.target.value == "ALL") { result = plants.filter(plant => plant) }
    setFilteredPlants(result)
  }
  
  useEffect(() => { 
    getPlants().then((data: PlantI[]) => {setPlants(data), setFilteredPlants(data)})
    getColors().then((data: string[]) => setKleuren(data))
    getSoorten().then((data: string[]) => setSoorten(data))
    setLoading(false) 
  }, [])

  useEffect(() => {
    const result = plants.filter(plant => { return plant.plantnaam.toLowerCase().includes(search.toLowerCase()) })
    setFilteredPlants(result)
  }, [search])

  return (
    <Fragment>
      <div className="app-wrapper">
        <div className="app-header">
           <Button onClick={() => setCreateDialog(true)} variant="contained" color="primary">Nieuwe Plant</Button>
           <div className="app-filters">
             <div>
              <Select value={kleurenValue} defaultValue="ALL" onChange={handleColorFilter} fullWidth input={<BootstrapInput />} >
                <MenuItem value="ALL">ALL</MenuItem>
                {kleuren.map((kleur, index) => (
                  <MenuItem key={index} value={kleur}>{ kleur }</MenuItem>
                ))}
              </Select>
             </div>
             <div>
              <Paper component="form" className={classes.root}>
                <IconButton className={classes.iconButton} aria-label="search">
                  <SearchIcon />
                </IconButton>
                <Divider className={classes.divider} orientation="vertical" />
                <InputBase value={search} onChange={(event) => handleSearchQuery(event)} className={classes.input} placeholder="Search plants by name" inputProps={{ 'aria-label': 'search' }} />
              </Paper>
             </div>
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
                      {loading ? <div>Loading...</div> : filteredPlants.slice().reverse().map((p, i) => (
                        <TableRow key={i}>
                            <TableCell>{ p.plantcode }</TableCell>
                            <TableCell>{ p.plantnaam }</TableCell>
                            <TableCell align="right">{ p.soort }</TableCell>
                            <TableCell align="right">{ p.kleur }</TableCell>
                            <TableCell align="right">{ p.hoogte }</TableCell>
                            <TableCell align="right">{ p.bloeitijd_start }</TableCell>
                            <TableCell align="right">{ p.bloeitijd_einde }</TableCell>
                            <TableCell align="right">{ p.prijs }</TableCell>
                            <TableCell align="right">
                                <Tooltip title="Plant bewerken" aria-label="bewerken">
                                  <IconButton type="submit" onClick={() => {setEditDialog(true); setPlantInfo(p)}} className={classes.iconButton} aria-label="search">
                                    <CreateIcon />
                                  </IconButton>
                                </Tooltip>
                                <Tooltip title="Plant verwijderen" aria-label="verwijderen">
                                  <IconButton type="submit" onClick={() => {setDeleteDialog(true); setPlantInfo(p)}} className={classes.iconButton} aria-label="search">
                                    <DeleteIcon />
                                  </IconButton>
                                </Tooltip>
                            </TableCell>
                        </TableRow>
                      ))}
                    </TableBody>
                </Table>
            </Paper>
        </div>
      </div>

      {deleteDialog && (
        <ConfirmDeleteDialog 
          isOpen={deleteDialog} 
          handleClose={() => setDeleteDialog(false)} 
          handleDelete={handleDeletePlant}
          plant={plantInfo} 
        />
      )}

      {createDialog && (
        <CreatePlantDialog
          isOpen={createDialog} 
          handleClose={() => setCreateDialog(false)} 
          handleAddPlant={handleAddPlant}
          plants={plants}
          kleuren={kleuren}
          soorten={soorten}
        />
      )}

      {editDialog && (
        <EditPlantDialog
          isOpen={editDialog} 
          handleClose={() => setEditDialog(false)} 
          handleEditPlant={handleEditPlant}
          plant={plantInfo}
          kleuren={kleuren}
          soorten={soorten}
        />
      )}
    </Fragment>
  )
}

import React, { Fragment, useEffect, useState } from "react";
import { makeStyles } from "@material-ui/core";
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
import { SyntheticEvent } from "react";

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
  const [soorten, setSoorten] = useState<string[]>([])
  const [plantInfo, setPlantInfo] = useState(null)
  const [search, setSearch] = useState<string>('')
  const [loading, setLoading] = useState<boolean>(true)
  const [deleteDialog, setDeleteDialog] = useState<boolean>(false)
  const [createDialog, setCreateDialog] = useState<boolean>(false)
  const [editDialog, setEditDialog] = useState<boolean>(false)
  const handleAddPlant = (payload: PlantI) => { addPlant(payload) }
  const handleEditPlant = (id: number, payload: PlantI) => { updatePlant(id, payload) }
  const handleDeletePlant = (id: number) => { deletePlant(id) }

  const handleSearchQuery = (event) => {
    setSearch(event.target.value)
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
              <Paper component="form" className={classes.root}>
                <IconButton type="submit" className={classes.iconButton} aria-label="search">
                  <SearchIcon />
                </IconButton>
                <Divider className={classes.divider} orientation="vertical" />
                <InputBase value={search} onChange={(event) => handleSearchQuery(event)} className={classes.input} placeholder="Search plants by name" inputProps={{ 'aria-label': 'search' }} />
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

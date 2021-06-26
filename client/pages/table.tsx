import { Paper, Table, TableHead, TableBody, TableRow, TableCell, IconButton, Button, Tooltip } from '@material-ui/core'
import DeleteIcon from '@material-ui/icons/Delete';
import CreateIcon from '@material-ui/icons/Create';
import React from 'react'

function TablePage() {
    return (
        <React.Fragment>
            <Paper elevation={3}>
                <Table>
                    <TableHead>
                        <TableRow>
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
                            <TableCell>Naam</TableCell>
                            <TableCell align="right">Soort</TableCell>
                            <TableCell align="right">Kleur</TableCell>
                            <TableCell align="right">Hoogte</TableCell>
                            <TableCell align="right">Start bloeitijd</TableCell>
                            <TableCell align="right">Einde bloeitijd</TableCell>
                            <TableCell align="right">Prijs</TableCell>
                            <TableCell align="right">
                                <Tooltip title="Plant bewerken" aria-label="bewerken">
                                    <IconButton type="submit" aria-label="search">
                                        <CreateIcon />
                                    </IconButton>
                                </Tooltip>
                                <Tooltip title="Plant verwijderen" aria-label="verwijderen">
                                    <IconButton type="submit" aria-label="search">
                                        <DeleteIcon />
                                    </IconButton>
                                </Tooltip>
                            </TableCell>
                        </TableRow>
                    </TableBody>
                </Table>
            </Paper>
        </React.Fragment>
    )
}

export default TablePage

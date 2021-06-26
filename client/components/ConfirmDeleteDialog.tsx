import React, { useState } from 'react'
import Dialog from '@material-ui/core/Dialog';
import DialogActions from '@material-ui/core/DialogActions';
import DialogContent from '@material-ui/core/DialogContent';
import DialogContentText from '@material-ui/core/DialogContentText';
import DialogTitle from '@material-ui/core/DialogTitle';
import { Button } from '@material-ui/core';

interface DialogContentProps {
    plantTitle: string
    isOpen: boolean
    handleClose: () => void
}

const ConfirmDeleteDialog: React.FC<DialogContentProps> = ({ plantTitle, isOpen, handleClose }) => {

    return (
        <Dialog
        open={isOpen}
        onClose={handleClose}
        aria-labelledby="alert-dialog-title"
        aria-describedby="alert-dialog-description"
      >
        <DialogTitle id="alert-dialog-title">Plant Verwijderen</DialogTitle>
        <DialogContent>
          <DialogContentText id="alert-dialog-description">Weet je zeker dat je plant <strong>"{ plantTitle }"</strong> wilt verwijderen?</DialogContentText>
        </DialogContent>
        <DialogActions>
          <Button onClick={handleClose} color="primary">
            Cancel
          </Button>
          <Button onClick={handleClose} color="primary" autoFocus>
            Verwijder
          </Button>
        </DialogActions>
      </Dialog>
    )
}

export default ConfirmDeleteDialog

const express = require('express');
const noteController = require('../controllers/noteController');
const authMiddleware = require('../middleware/authMiddleware');

const router = express.Router();

router.use(authMiddleware.verifyToken);
router.get('/search', noteController.searchNotes);
router.post('/', noteController.createNote);
router.get('/', noteController.getAllNotes);
router.get('/:id', noteController.getNoteById);
router.put('/:id', noteController.updateNote);
router.delete('/:id', noteController.deleteNote);
router.post('/:id/share', noteController.shareNote);


module.exports = router;

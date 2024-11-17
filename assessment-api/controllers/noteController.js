const Note = require('../models/note');

const noteController = {
  createNote: async (req, res) => {
    const { title, text } = req.body;
    const userId = req.user.id;
    const note = await Note.create(userId, title, text);
    res.status(201).json({ note });
  },
  getNoteById: async (req, res) => {
    const { id } = req.params;
    const userId = req.user.id;
    const note = await Note.findById(id, userId);
    if (!note) {
      return res.status(404).json({ message: 'Note not found' });
    }
    res.json({ note });
  },
  getAllNotes: async (req, res) => {
    const userId = req.user.id;
    const notes = await Note.findAllByUser(userId);
    res.json({ notes });
  },
  updateNote: async (req, res) => {
    const { id } = req.params;
    const { title, text } = req.body;
    const userId = req.user.id;
    const note = await Note.update(id, userId, title, text);
    if (!note) {
      return res.status(404).json({ message: 'Note not found' });
    }
    res.json({ note });
  },
  deleteNote: async (req, res) => {
    const { id } = req.params;
    const userId = req.user.id;
    const note = await Note.delete(id, userId);
    if (!note) {
      return res.status(404).json({ message: 'Note not found' });
    }
    res.json({ message: 'Note deleted successfully' });
  },
  shareNote: async (req, res) => {
    const { id } = req.params;
    const { email } = req.body;
    const userId = req.user.id;
      try { const sharedNote = await Note.share(id, userId, email);
          res.status(201).json({ sharedNote });
      } catch (error) { res.status(500).json({ message: 'Error sharing note', error: error.message }); } 
    },

  searchNotes: async (req, res) => {
     const { query } = req.query;
     const userId = req.user.id;
     try { const notes = await Note.search(userId, query);
     res.status(200).json({ notes }); } 
     catch (error) { res.status(500).json({ message: 'Error searching notes', error: error.message }); }
     },
};

module.exports = noteController;

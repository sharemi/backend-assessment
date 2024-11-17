const pool = require('../config/database');

const Note = {
  create: async (userId, title, text) => {
    const result = await pool.query(
      'INSERT INTO note (user_id, title, text) VALUES ($1, $2, $3) RETURNING *',
      [userId, title, text]
    );
    return result.rows[0];
  },
  findById: async (id, userId) => {
    const result = await pool.query('SELECT * FROM note WHERE id = $1 AND user_id = $2', [id, userId]);
    return result.rows[0];
  },
  findAllByUser: async (userId) => {
    const result = await pool.query('SELECT * FROM note WHERE user_id = $1', [userId]);
    return result.rows;
  },
  update: async (id, userId, title, text) => {
    const result = await pool.query(
      'UPDATE note SET title = $1, text = $2 WHERE id = $3 AND user_id = $4 RETURNING *',
      [title, text, id, userId]
    );
    return result.rows[0];
  },
  delete: async (id, userId) => {
    const result = await pool.query('DELETE FROM note WHERE id = $1 AND user_id = $2 RETURNING *', [id, userId]);
    return result.rows[0];
  },
  share: async (noteId, ownerId, recipientEmail) => { 
    const recipientResult = await pool.query('SELECT id FROM "user" WHERE email = $1', [recipientEmail]); if (recipientResult.rows.length === 0) 
    { throw new Error('Recipient user not found'); }
    const recipientId = recipientResult.rows[0].id;
    const result = await pool.query( 'INSERT INTO shared_note (note_id, owner_id, recipient_id) VALUES ($1, $2, $3) RETURNING *', [noteId, ownerId, recipientId] );
    return result.rows[0];
   },

  search: async (userId, query) => {
     const result = await pool.query( 'SELECT * FROM note WHERE user_id = $1 AND (title ILIKE $2 OR text ILIKE $2)', [userId, `%${query}%`] ); 
     return result.rows; },
};

module.exports = Note;

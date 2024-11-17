const pool = require('../config/database');
const bcrypt = require('bcryptjs');

const User = {
  create: async (email, password) => {
    const hashedPassword = await bcrypt.hash(password, 10);
    const result = await pool.query(
      'INSERT INTO "user" (email, password) VALUES ($1, $2) RETURNING *',
      [email, hashedPassword]
    );
    return result.rows[0];
  },
  findByEmail: async (email) => {
    const result = await pool.query('SELECT * FROM "user" WHERE email = $1', [email]);
    return result.rows[0];
  },
};

module.exports = User;

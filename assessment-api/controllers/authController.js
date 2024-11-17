const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs')
const User = require('../models/User');
require('dotenv').config();

const authController = {
  signup: async (req, res) => {
    const { email, password } = req.body;
    const user = await User.create(email, password);
    res.status(201).json({ user });
  },
  
  login: async (req, res) => {
    const { email, password } = req.body;
    const user = await User.findByEmail(email);
    if (!user || !(await bcrypt.compare(password, user.password))) {
      return res.status(401).json({ message: 'Invalid credentials' });
    }
    const token = jwt.sign({ id: user.id }, process.env.JWT_SECRET, { expiresIn: '1h' });
    res.json({ token });
  },
};

module.exports = authController;

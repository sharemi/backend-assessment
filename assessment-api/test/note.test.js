const request = require('supertest');
const app = require('../app');
const pool = require('../config/database');
const Note = require('../models/note');
const User = require('../models/User');
const jwt = require('jsonwebtoken');
require('dotenv').config();

describe('Note Endpoints', () => {
  let token;

  beforeAll(async () => {
    await pool.query('TRUNCATE TABLE "user", "note" RESTART IDENTITY CASCADE');
    const user = await User.create('romina@gmail.com', '123456');
    token = jwt.sign({ id: user.id }, process.env.JWT_SECRET, { expiresIn: '1h' });
  });

  it('should create a new note', async () => {
    const res = await request(app)
      .post('/api/notes')
      .set('Authorization', `Bearer ${token}`)
      .send({
        title: 'Test Note',
        text: 'This is a test note',
      });
    expect(res.statusCode).toEqual(201);
    expect(res.body).toHaveProperty('note');
  }, 10000); // Increase timeout to 10 seconds

  it('should get all notes for the authenticated user', async () => {
    const res = await request(app)
      .get('/api/notes')
      .set('Authorization', `Bearer ${token}`);
    expect(res.statusCode).toEqual(200);
    expect(res.body).toHaveProperty('notes');
  }, 10000); // Increase timeout to 10 seconds

  it('should get a note by ID for the authenticated user', async () => {
    const note = await Note.create(1, 'Sample Note', 'This is a sample note');
    const res = await request(app)
      .get(`/api/notes/${note.id}`)
      .set('Authorization', `Bearer ${token}`);
    expect(res.statusCode).toEqual(200);
    expect(res.body).toHaveProperty('note');
  }, 10000); // Increase timeout to 10 seconds

  it('should update a note by ID for the authenticated user', async () => {
    const note = await Note.create(1, 'Sample Note', 'This is a sample note');
    const res = await request(app)
      .put(`/api/notes/${note.id}`)
      .set('Authorization', `Bearer ${token}`)
      .send({
        title: 'Updated Note',
        text: 'This is an updated note',
      });
    expect(res.statusCode).toEqual(200);
    expect(res.body).toHaveProperty('note');
  }, 10000); // Increase timeout to 10 seconds

  it('should delete a note by ID for the authenticated user', async () => {
    const note = await Note.create(1, 'Sample Note', 'This is a sample note');
    const res = await request(app)
      .delete(`/api/notes/${note.id}`)
      .set('Authorization', `Bearer ${token}`);
    expect(res.statusCode).toEqual(200);
    expect(res.body).toHaveProperty('message', 'Note deleted successfully'); 
  }, 10000); // Increase timeout to 10 seconds

  it('should share a note with another user', async () => {
    const note = await Note.create(1, 'Sample Note', 'This is a sample note');
    const res = await request(app)
      .post(`/api/notes/${note.id}/share`)
      .set('Authorization', `Bearer ${token}`)
      .send({ email: 'romina@gmail.com' });
    expect(res.statusCode).toEqual(201);
    expect(res.body).toHaveProperty('sharedNote');
  }, 10000); // Increase timeout to 10 seconds
  it('should search notes based on keywords', async () => {
    const res = await request(app)
      .get('/api/notes/search')
      .set('Authorization', `Bearer ${token}`)
      .query({ query: 'sample' });
    expect(res.statusCode).toEqual(200);
    expect(res.body).toHaveProperty('notes');
  }, 10000); // Increase timeout to 10 seconds
  
});

afterAll(async () => {
  await pool.end();
});

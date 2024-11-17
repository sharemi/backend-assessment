const request = require('supertest');
const app = require('../app');

describe('Auth Endpoints', () => {
  it('should create a new user', async () => {
    const res = await request(app)
      .post('/api/auth/signup')
      .send({
        email: 'romina@gmail.com',
        password: '123456',
      });
    expect(res.statusCode).toEqual(201);
    expect(res.body).toHaveProperty('user');
  });

  it('should log in an existing user', async () => {
    const res = await request(app)
      .post('/api/auth/login')
      .send({
        email: 'romina@gmail.com',
        password: '123456',
      });
    expect(res.statusCode).toEqual(200);
    expect(res.body).toHaveProperty('token');
  });
});

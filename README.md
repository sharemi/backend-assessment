# backend-assessment
# My Note API

This project is a secure and scalable RESTful API (using Express.js, Node.js, Postgresql, jets for test) that allows users to signup,login, create notes, read notes, update notes, and delete notes. 
Include a Postman.
 
# dependencies

express, pg , bcryptjs, jsonwebtoken, dotenv, express-rate-limit, nodemon, jest, supertest

## Project Setup

1. Clone the repository: `git clone https://github.com/sharemi/backend-assessment.git`
2. Install dependencies: `npm install`
3. Create a `.env` file with the following variables:
   PORT=3000 DATABASE_URL=your_database_url JWT_SECRET=your_jwt_secret
4. Start the server: `npm start` or `nodemon server.js`
5. Run tests: `npm test`

## API Endpoints

- POST /api/auth/signup: Create a new user account
- POST /api/auth/login: Log in to an existing user account and receive an access token
- GET /api/notes: Get a list of all notes for the authenticated user
- GET /api/notes/:id: Get a note by ID for the authenticated user
- POST /api/notes: Create a new note for the authenticated user
- PUT /api/notes/:id: Update an existing note by ID for the authenticated user
- DELETE /api/notes/:id: Delete a note by ID for the authenticated user
- POST /api/notes/:id/share: Share a note with another user for the authenticated user
- GET /api/search?q=:query: Search for notes based on keywords for the authenticated user


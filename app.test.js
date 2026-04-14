const request = require('supertest');
const { app, server } = require('./app');

afterAll(() => server.close());

test('GET /', async () => {
    const res = await request(app).get('/');
    expect(res.status).toBe(200);
});

test('GET /health', async () => {
    const res = await request(app).get('/health');
    expect(res.status).toBe(200);
});

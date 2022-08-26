import supertest from 'supertest';
import app from '../server';
import 'dotenv/config';

const req = supertest(app);

describe('Hello secret app testing', () => {
  it('should give 200 as response code', async () => {
    const res = await req.get('/');
    expect(res.status).toBe(200);
  });

  it('should have hello and the secret in the response', async () => {
    const res = await req.get('/');
    const secret = process.env.SECRET;
    if (secret != undefined){
        expect(res.text).toEqual('Hello ' + secret);
    } else {
        expect(res.text).toEqual('Hello World');
    }
    
  });
});

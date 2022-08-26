import express, { Request, Response } from 'express';
import 'dotenv/config';

const app = express();
const port = 3000;

const secret = process.env.SECRET;

app.get('/', (req: Request, res: Response) => {
  res.send('Hello ' + secret);
});

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});

export default app;

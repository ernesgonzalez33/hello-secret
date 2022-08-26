import express, { Request, Response } from 'express';
import 'dotenv/config';

const app = express();
const port = 3000;

const secret = process.env.SECRET;

app.get('/', (req: Request, res: Response) => {

  if (secret != undefined) {
    res.send('Hello ' + secret);
  } else {
    res.send('Hello World')
  }
  
});

app.listen(port, () => {
  console.log(`Hello Secret app listening on port ${port}`);
});

export default app;

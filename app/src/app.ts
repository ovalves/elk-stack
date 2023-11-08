import express, { Application, Request, Response } from "express";
import { routerHealth } from './app/routes/router-health'

const app: Application = express();
app.use(express.json());
app.use('/health', routerHealth)
app.get('/', (req: Request, res: Response) => res.send('Olá Mundo!!!'))


export default app

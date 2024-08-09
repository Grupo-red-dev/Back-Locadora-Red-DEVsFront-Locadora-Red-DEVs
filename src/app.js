import express from 'express';
import router from './routes.js';

const app = express();

//express interpreta o formato json
app.use(express.json());

app.use(router)

export default app;


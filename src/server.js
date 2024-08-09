import app from './app.js';

const port = process.env.PORT || 3000;

app.listen(port, (res) => {
    console.log(`Servidor rodando na porta: http://localhost:${port}`)
})
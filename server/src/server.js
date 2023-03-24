import express from 'express';
import usr_router from './routes/users.js';
import cli_router from './routes/clients.js';
import item_router from './routes/items.js';
const app = express();

app.set('port', 8080);

app.use(express.json());
app.use(usr_router);
app.use(cli_router);
app.use(item_router);

app.listen(app.get('port'), () => {
  console.log(`Server is Running at: ${app.get('port')}`);
});

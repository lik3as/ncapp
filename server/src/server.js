import express from 'express';
import usr_router from './routes/users.js';
import cli_router from './routes/clients.js';
import item_router from './routes/items.js';
import nfe_router from './routes/nfes.js';
import cat_router from './routes/cats.js';
import cliType_router from './routes/cliTypes.js';
const app = express();

app.set('port', 8080);

app.use(express.json());

/* ROUTERS */
app.use(usr_router);
app.use(cli_router);
app.use(item_router);
app.use(nfe_router);
app.use(cat_router);
app.use(cliType_router);

app.listen(app.get('port'), () => {
  console.log(`Server is Running at: ${app.get('port')}`);
});

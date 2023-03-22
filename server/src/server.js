import express from 'express';
import usr_router from './routes/users.js';
const app = express();

app.set('port', 8080);

app.use(express.json());
app.use(usr_router)

app.listen(app.get('port'), () => {
  console.log(`Server is Running at: ${app.get('port')}`);

});

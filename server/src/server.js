import express from 'express';
const app = express();

app.set('port', 8080);
app.listen(app.get('port'), () => {
  console.log(`Server is Running at: ${app.get('port')}`);

});

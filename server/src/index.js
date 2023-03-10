import express from 'express';
import user_mdw from './routes/user.js'
import product_mdw from './routes/product.js'
const app = express();

app.set('port', process.env.PORT || 8080);
app.listen(app.get('port'), () => {
  console.log("listening...");
});

app.use(express.json()); //Middleware that parses into json  
app.use(user_mdw); //Route middlewares 
app.use(product_mdw);

export default app;

const express = require('express');
const bodyParser = require('body-parser');
const userRouter = require('./routes/userRouter');
const umkmRouter = require('./routes/umkmRouter');
const productRouter = require('./routes/productRouter');
const serviceRouter = require('./routes/serviceRouter');
const reviewRouter = require('./routes/reviewRouter');
const searchRouter = require('./routes/searchRouter');

const app = express();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

app.use('/api/user', userRouter);
app.use('/api/umkm', umkmRouter);
app.use('/api/product', productRouter);
app.use('/api/service', serviceRouter);
app.use('/api/review', reviewRouter);
app.use('/api/search', searchRouter);

app.listen(3000, () => {
  console.log('Server started on port 3000');
});
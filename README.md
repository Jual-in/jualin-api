<div align="center">

<img src="images/product_logo.png" alt='Jualin logo' width=500/>

# Rest API Jual.In

<div align="left">

The jual.in REST API is developed for the jual.in application, which is used to store and manage user data, small, and medium-sized enterprises (SMEs), products, and services available on the platform. This API is designed with RESTful principles to ensure good interoperability between system components. The main features of this API include user data management, including registration, login, and user profile management. Additionally, the API also supports the management of SME profiles, including business information, business categories, and geographic locations. Catalog management for products and services is also provided, including creation, deletion, and updating of product and service entries. This API also has secure authentication and authorization mechanisms to protect sensitive data and prevent unauthorized access. Application developers for jual.in can leverage all these features to easily build and integrate applications.

## 👨‍🏭 Contributors
- Ari Mulyanto
- Habib Husain Amirullah

## 📋 Endpoint
1. Users
    - GET: `/user/` - Get all users
    - GET: `/user/:id` - Get users by ID
    - POST: `/user/login` - Login users
    - POST: `/user/register` - Register new users
    - POST: `/user/upload-photo/:id_user` - Upload user's photo
    - PUT: `/user/update/:id_user - Update` user's data
2. UMKM
    - GET: `/umkm/` - Get all UMKM
    - GET: `/umkm/:id` - Get UMKM by ID
    - GET: `/umkm/:id/product` - Get UMKM by ID that has product data
    - GET: `/umkm/:id/service` - Get UMKM by ID that has service data
    - GET: `/umkm/umkmproduct/allProduct` - Get all UMKM that have product data
    - GET: `/umkm/umkmproduct/allService` - Get all UMKM that have service data
    - GET: `/umkm/nearby` - Get UMKM by nearest location
    - GET: `/umkm/rekomendasi` - Get UMKM by category
    - POST: `/umkm/create/users/:userid` - Add UMKM data based on user's ID with role sellers
    - PUT: `/umkm/update/users/:id` - Update UMKM data based on user's ID with role sellers
    - DELETE: `/umkm/delete/:id` - Delete UMKM data
3. Product
    - GET: `/product/` - Get all product
    - GET: `/product/:id` - Get product by ID
    - POST: `/product/createProduct` - Add new product data 
    - PUT: `/product/updateProduct/:id` - Update product data 
    - DELETE: `product/deleteProduct/:id` - Delete product data
4. Service
    - GET: `/service/` - Get all service
    - GET: `/service/:id` - Get service by ID
    - POST: `/service/createService` - Add new service data 
    - PUT: `/service/updateService/:id` - Update service data 
    - DELETE: `service/deleteService/:id` - Delete service data
5. Search
    - GET: `/search/product` - To find product data
    - GET: `/search/service` - To find service data

## 📚 Technologies Used

- [JavaScript](https://www.javascript.com/)
- [Node JS](https://nodejs.org/en)
- [Express JS](https://expressjs.com/)
- [Cloud Storage](https://cloud.google.com/)
- [Cloud SQL](https://cloud.google.com/)
- [App Engine](https://cloud.google.com/)

## 💻 Test API
- Testing API on Local Server

1. Clone this repository.
2. Open the project in Visual Studio Code or another editor.
3. Go to the line of code that has a comment "Run the following code to save the image in local" Then open a comment on that line of code. This comment is in the Controllers folder: userController.js and productController.js. And is in the middleware folder : upload.js
4. Import the database and postman files in the file_import folder (Change the url address to "http://localhost:8000")
5. Enter CMD and navigate to the API directory.
6. Run the "npm run start" command

- Note 📌 
<i> Make sure you have installed my SQL and Node JS and make sure to create folder "uploads/users & product" folder to save the images locally </i>

- Testing live API in postman

1. Import the postman file in the file_import folder
2. Use this url address : https://jualin-ml-umkm-service-yx5zrdv2ka-et.a.run.app

# README

# Cart API Technical Challenge

This is an API application challenge. Some highlights about the code:

* There is no interface since the problem doesn't suggest doing one. But it could also be read by a frontend framework. It could be an improvement as a future task.

* It was done in Ruby on Rails, version 7.0.6, Ruby version 3.1.2.

* Rails, by default, uses Minitest. This challenge uses RSpec as the testing framework.

* The DB is Postgresql. And its schema is represented by the image below:

 <img width="757" alt="Screenshot 2023-09-10 at 20 03 29" src="https://github.com/Ju-Arrighi/cart-api/assets/85900332/8fab289d-5f3d-4b5e-b6a5-323518924b94">


INSTALLATION INSTRUCTIONS

1 - It was done with ruby 3.1.2. To install it on your machine, please look at this {tutorial}(https://www.ruby-lang.org/en/documentation/installation/).

2 - Clone the code to your preferred folder for this kind of project.

3 - I used Bundler to load TDD and debugger gems. Run bundle install. After that, you will have Rspec for TDD.

4 - Once the environment is prepared, run *bin/rails db:create db:migrate*. To populate your database, do *bin/rails dev:setup*.

5 - You can see the json data from your browser once you have your server. As it is an API app, having tools to verify the data is good. I use Postman and Curl. I suggest you to do the same.

ENDPOINTS

Endpoints to perform actions are commented in the controllers. Here as some examples:

* http://localhost:3000/products - To see all products.
* http://localhost:3000/carts - To see all carts.
* http://localhost:3000/carts/11 - To see one specific cart. In the #show action, all the information to generate an invoice is available.
* http://localhost:3000/carts/11/orders - To see all orders inside cart 11. You can also create a new order with this endpoint.
* http://localhost:3000/carts/11/orders/28 - At this endpoint, you can update an order. Restrictions are applied to comply with test requirements.

DOCKER

In the branch docker there are configurations do dockerize this app.

SERIALIZER

The gem Active Model Serializer was used with the json_api adapter, which complies with the format specified in jsonapi.org/format. It's done in the branch serializer. It still needs to be merged with the main because it still has work to do and is optional.

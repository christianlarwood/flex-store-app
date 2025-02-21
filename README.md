# README
## Project Setup
### Step 1: clone this repo
```sh

```
### Step 2: install dependencies
```sh
bundle install
```
### Step 3: create & migrate the DB
```sh
rails db:create
rails db:migrate
```
### Step 4: seed provided Brand and Category data
```sh
rails db:seed
```
### Step 5: visit the app in your browser:
`http://localhost:3000`

## Routes
"/" --> Flex Shop home, view & add available items to your cart, view your cart
"/items" --> View and manage inventory
"/promotions --> View and add new promotions

## Project Requirements:
```sh
Problem Statement:
You have been tasked with designing an inventory and promotions engine for an ecommerce software platform. As a business-to-business software platform, customers of your product can use the promotions engine to create promotions for items in their inventory.

Item Requirements:
•    Items can be sold by weight or quantity
•    Items can be grouped into categories
•    Items can have a brand
•    More than one item of each type of item can be added to the cart
•    Items do not have taxes for this problem.

Promotion Requirements:
•    Promotions can have the following types:
o    Flat fee discount (ex: 20 dollars off of an item)
o    Percentage discount (ex: 10% of off an item)
o    Buy X Get Y discount (ex: Buy 1 get one free, buy 3 get 1 50% off)
o    Weight threshold discounts (ex: buy more than 100 grams and get 50% off the item)
•    Promotions can be valid for individual items, or categories (ex: 50% off of all products of X category)
•    Promotions must have a start time
•    Promotions may have an end time
•    Multiple promotions can be applied to a cart if they both have a valid set of items
•    Each item is only valid for one promotion
•    Only one instance of a promotion can be applied at a time

Your solution must contain:
•    The ability to add, remove, and view items in a cart
•    Every time an item is added to the cart the best possible price given the valid promotions must be shown.
```

## My Implementation:
Hey! Thanks for taking a look at my app.

The app does not yet differentiate between users (admin, shoppers, merchants) so anyone can perform the following actions:

### Items
- [x] Users can view all items ("/items" and "/")
- [x] Users can add new items ("/items/new")
- [x] Users can edit existing items ("/items")
### Promotions
- [x] Users can create a new promotion ("/promotions/new")
- [x] Users can view all promotions ("/promotions")
- [x] Promotions can have the following types: "flat_fee", "percentage", "buy_x_get_x", "weight_threshold"
- [x] Promotions can be valid for individual items or categories e.g. "20% off all products of X category"
- [x] Multiple promotions can be applied to a cart as long as there are valid items/categories
- [x] Only one instance of a promotion can be applied at a time
### Cart
- [x] Users can add items to their cart (including multiple of the same)
- [x] Users can edit item quantity in their cart
- [x] Users can remove items from their cart
- [x] Everytime an item is added to the cart, the best possible price given the valid promotions will be shown

With more time, I'd next focus on:

### Frontend:
- Input validation and providing helpful errors to users
- Better UI on all pages
- Easier navigation between pages
- User authentication
- Cart
   - Display discount amounts for each applicable item
- Store:
   - As the store items list gets longer we’ll need a better way to filter and find items
   - Search functionality
   - Ability for a user to checkout and pay for items
- Promotions:
   - Improve the add new promotions form and add JS to ensure that only relevant fields are visible when adding a new promotion and fields are better named

### Backend:
- Refactor controller actions and move repeating code into reusable methods
- Lots of specs to ensure models, controllers, and promotions logic are covered
- Refactor and optimize database queries
- Improved promotions system including promos such as bulk discounts, flash sales, etc and also thinking through possible edge cases
- Checkout process for cart items and payments integration

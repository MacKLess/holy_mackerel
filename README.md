# Holy Mackerel

### _Epicodus Solo Project in Rails, December 1, 2017_

### By L. D. MacKrell

## Description

_This is a site for a seafood company_ Holy Mackerel. _It allows users to create an account and leave reviews on products. An admin will be able to login and access reserved components of the site._

## Set-up/Installation Instructions

* Clone this repository
* From the project root directory, run the following commands:
  * **Note: seeding the database will remove all existing data and replace it.**
  ```
  bundle install
  rake db:create
  rake db:migrate
  rake db:seed
  rake db:test:prepare
  rails s
  ```
* You can then access the app in your web browser at ```localhost:3000```

## Specifications

* Users can view products.
* Users can add, view, edit, and remove their own product reviews.
* Users can only view other users' reviews.
* Users can log in using email and password.
* Admin can add, view, edit, and remove products.
* Administrators can delete user reviews for products.

## Support and contact details

_Please contact [ldmackrell@gmail.com](mailto:ldmackrell@gmail.com) with questions, comments, or issues._

## Technologies Used

* Ruby
* Rails
* Bootstrap

### License

Copyright (c) 2017 **L. D. MacKrell**

*This software is licensed under the MIT license.*

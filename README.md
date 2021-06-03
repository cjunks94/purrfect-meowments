# README

This is an API project to upload cat pictures \
it is currently using [Ruby on Rails 6.1](https://edgeguides.rubyonrails.org/6_1_release_notes.html) \
it is using [Active Storage](https://edgeguides.rubyonrails.org/active_storage_overview.html) provided by Rails to save images


## Ruby version
- ruby-3.0.1


## How to run the test suite
- right now just `rspec` at the root


## Deployment instructions
----------
### **Docker** 
  _note_: may not be working right now
  - `docker-compose build` then `docker-compose up` should work but it might take a bit

----------
### **Local**
  `rake db:create db:migrate db:seed`
  `rails s`
  
  
----------
## The Api

  **#Index**
  - will fetch a list of uploaded cat pictures with
  `GET http://localhost:3000/api/v1/records`

  **#Show**
  - shows the picture for the id of the cat provided
  `GET http://localhost:3000/api/v1/records/:id`

  **#Create**
  - creates a new entry in the database
  `POST http://localhost:3000/api/v1/records`
  with
  ```
  params: {
    name: <name of the photo>,
    description: <some text>,
    file_path: <the path to the local or remote photo>
  }
  ```

  **#Update**
  - updates an existing record
  `PATCH  http://localhost:3000/api/v1/records/:id`
    with
  ```
  params: {
    id: <id to update>
    name: <name of the photo>,
    description: <some text>,
    file_path: <the path to the local or remote photo>
  }
  ```
  _note_: everything is optional right now, would like to change this and add validations in the future

  **#Destroy**
  - deletes and existing record
  `DELETE  http://localhost:3000/api/v1/records/:id`

  **#Download** _WIP - user beware; not tested_
  `GET  http://localhost:3000/api/v1/records/:record_id/download`

- example request in postman

<img width="1413" alt="Screen Shot 2021-06-02 at 11 50 52 PM" src="https://user-images.githubusercontent.com/37341069/120584149-6a26c500-c3fd-11eb-9467-214ae71cfb3e.png">


## TODO:
docker-compose up starts app (this has some issues im looking into)

use rake db:create db:migrate db:seed to start db

todo

- [ ] add more tests
- [ ] setup the rest of auth - partially implimented but buggy right now
- [ ] more robust error handling
- [ ] add a frontend?
- [ ] clean up some warnings
- [ ] add validations for uploads and maybe names
- [ ] work out warnings in docker

# README

## Version
  * Ruby version ~> 3.1.1
  * Rails version ~> 7.0.3

## Gems
  * rails-i18n
  * faker

## Configuration
* clone the project with git and run on terminal <code>bundle install</code>

## Database creation
* run <code>rails db:create</code>
* run <code>rails db:migrate</code>
* run <code>rails dev:setup</code>
* run <code>rails dev:setup_phones</code>

## How to run the test suite
* run <code>rails rspec</code> for all tests
* run <code>rails rspec spec/</code> for specific tests

## Deployment instructions
* [loading...]

## Documentation

## Routes
* /contacts ~> GET: index, POST: create
* /contacts/:id ~> GET: show, PATCH: update, DELETE: destroy

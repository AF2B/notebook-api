# README

## Version
  * Ruby version ~> 3.1.1
  * Rails version ~> 7.0.3

## Gems
  * rails-i18n
	* rack-cors
  * faker
	* foreman

## Configuration
* clone the project with git and run on terminal <code>bundle install</code>

## Setup environment
* run <code>rails dev:setup</code> or you can run <code>foreman start</code>

## How to run the test suite
* run <code>rails rspec</code> for all tests

* run <code>rails rspec spec/</code> for specific tests

## Deployment instructions
* [loading...]

## Documentation

## Routes
* before you can use the API and make some requests, you need to put in your header "Accept" with "application/json". Because this API is RESTful, you can use the following routes:

* /contacts ~> GET: index, POST: create

* /contacts/:id ~> GET: show, PATCH: update, DELETE: destroy

## Data structure to create a new contact using the API with POST HTTP method
* Because this is in construction and i don't have a yet a swagger documentation, I can't put here the dta structure to create a new contact. But this implementation is in progress.

[loading...]
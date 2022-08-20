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

## Data structure to create a new contact using the API with POST HTTP method
{ "contact":
	{
		"name": "name_value",
		"email": "email value",
		"birthdate": "dd/mm/yyyy",
		"kind_id": "1, 2 or 3", ~> 1: Friend, 2: Family, 3: Work
		"phones_attributes": [
			{
				"id": id,
				"number": "phone_number"
			},
			{
				"id": id,
				"number": "phone_number_optional"
			}
		]
	}
}

[loading...]
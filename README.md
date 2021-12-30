# Boris Bikes
This program emulates all the docking stations, bikes, and infrastructure required
to deliver a new bike system. The requirements have been broken down into the  user
stories below which have been implemented using the BDD cycle with a test driven
approach.

Unit tests include test doubles to effectively isolate the single class being tested
and feature tests check correct integration behaviour between the classes.

The Single Responsibility Principle has been adhered to in all classes and methods.

The three classes Docking Station, Garage and Van share similar behaviour - they
all contain bikes, accept and release bikes and have limits on capacity. I have
therefore extracted those similar behaviours to a mixin by creating the Bike Container
module which has then been included into these classes. This Object Composition
was test driven using RSpec's shared example feature.

## User Stories
```
As a person,
So that I can use a bike,
I'd like a docking station to release a bike

As a person,
So that I can use a good bike,
I'd like to see if a bike is working

As a member of the public
So I can return bikes I've hired
I want to dock my bike at the docking station

As a member of the public
So I can decide whether to use the docking station
I want to see a bike that has been docked

As a member of the public,
So that I am not confused and charged unnecessarily,
I'd like docking stations not to release bikes when there are none available

As a maintainer of the system,
So that I can control the distribution of bikes,
I'd like docking stations not to accept more bikes than their capacity

As a system maintainer,
So that I can plan the distribution of bikes,
I want a docking station to have a default capacity of 20 bikes

As a system maintainer,
So that busy areas can be served more effectively,
I want to be able to specify a larger capacity when necessary

As a member of the public,
So that I reduce the chance of getting a broken bike in future,
I'd like to report a bike as broken when I return it

As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like docking stations not to release broken bikes

As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like docking stations to accept returning bikes (broken or not)

As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like vans to take broken bikes from docking stations and deliver them to garages to be fixed
```

## How to set up
Clone the repo to your local machine, change into the directory and install the needed gems:
```
$ bundle install
```
To run the test suite:
```
$ rspec
```

## Technologies used
- Ruby
- RSpec

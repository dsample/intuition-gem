[![Build Status](https://travis-ci.org/dsample/intuition-gem.png?branch=master)](https://travis-ci.org/dsample/intuition-gem) [![Coverage Status](https://coveralls.io/repos/dsample/intuition-gem/badge.png?branch=master)](https://coveralls.io/r/dsample/intuition-gem?branch=master) [![Code Climate](https://codeclimate.com/github/dsample/intuition-gem.png)](https://codeclimate.com/github/dsample/intuition-gem) [![Dependency Status](https://gemnasium.com/dsample/intuition-gem.png)](https://gemnasium.com/dsample/intuition-gem)

At the moment there are the following collector modules (which will eventually be split out into their own gems)

* MongoDB Collector - Inserts using Cube data schema
* WebSocket Relay - Sends all data instantly to all connected websocket clients

## Installation

	gem install intuition
	intuition

This will start the fully-fledged listener with both MongoDB and WebSockets collectors. See the bin/intuition script if you want to change how this works (eg. port numbers/Mongo server address).
## Changelog
---------

- 1.0.0
  -----
  - [isuftin@usgs.gov] - Working with latest RabbitMQ cookbook
  - [isuftin@usgs.gov] - Changed default recipe to do nothing
  - [isuftin@usgs.gov] - Removed iptables recipe
  - [isuftin@usgs.gov] - Create users now wraps the upstream cookbook recipe

- 0.1.5
  -----
  - [isuftin@usgs.gov] - Fixed a kitchen.yml issue that broke testing
  - [isuftin@usgs.gov] - Added doi_ssl_filtering cookbook into Berksfile for testing on DOI network. Optional to use.
  - [isuftin@usgs.gov] - Fixed a breaking spelling error in the default recipe
  - [isuftin@usgs.gov] - Updated dependency of RabbitMQ cookbook to 4.9.0

- 0.1.4
  -----
  - [isuftin@usgs.gov] - Refactored .kitchen.yml to include more images, generalize ports and attributes, etc
  - [isuftin@usgs.gov] - Added integration testing
  - [isuftin@usgs.gov] - Broke up default recipe
  - [isuftin@usgs.gov] - Updated default attributes and removed the need to specify an encryption key location
  - [isuftin@usgs.gov] - Removed 3rd party RabbitMQ cookbook attributes and recipe calls out of cookbook and into
  						.kitchen.yml

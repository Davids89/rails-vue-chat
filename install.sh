#!/bin/sh

bundle install
yarn install
rake db:create
rake db:seed
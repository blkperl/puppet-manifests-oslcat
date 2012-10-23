#!/bin/bash

echo "Bootstrapping puppet environment..."

echo "Installing bundler"
gem install bundler

echo "Installing required rubygems"
bundle install

echo "Installing required puppet modules"
librarian-puppet install

echo "Finished....."

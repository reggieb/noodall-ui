require 'dynamic_form'
require 'will_paginate'
require 'noodall/site'

module Noodall
  class Engine < Rails::Engine

    initializer "static assets" do |app|
      app.middleware.use ::ActionDispatch::Static, "#{root}/public"
    end

    initializer "load site map" do |app|
      begin
        Noodall::Site.map = YAML::load(File.open(File.join(Rails.root, 'config', 'sitemap.yml')))
      rescue Exception => e
        puts "Failed to load noodall site map: #{e}"
      end
    end

  end
end


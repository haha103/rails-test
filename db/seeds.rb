# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# seed administrative regions
def seed_admin_divs
	data = ActiveSupport::JSON.decode(File.read('db/seeds/admindivs.json'))
	data.each do |d|
		if d["type"] == 0
			seed_admin_divs_city(d)
		else
			seed_admin_divs_province(d)
		end
	end	
end

def seed_admin_divs_province(pdata)
	p = Province.new
	p.name = pdata['name']
	pdata["sub"].each do |cdata|
		c = p.cities.new
		c.name = cdata['name']
		cdata['sub'].each do |ddata|
			d = c.districts.new
			d.name = ddata['name']
			d.save
		end if cdata["sub"]
		c.save
	end if pdata["sub"]
	p.save
end

def seed_admin_divs_city(cdata)
	c = City.new
	c.name = cdata['name']
	cdata['sub'].each do |ddata|
		d = c.districts.new
		d.name = ddata['name']
		d.save
	end if cdata["sub"]
	c.save
end

seed_admin_divs
# end of seeding administrative regions

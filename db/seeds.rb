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

# seeding of banks in China
def seed_banks
	data = ActiveSupport::JSON.decode(File.read('db/seeds/banks.json'))
	data.each do |d|
		Bank.create!(d)
	end
end

seed_banks

# end of seeding of banks in China


# seedings of bank_card_types

def seed_bank_card_types
	data = ActiveSupport::JSON.decode(File.read('db/seeds/bank_card_types.json'))
	data.each do |d|
		BankCardType.create!(d)
	end
end

seed_bank_card_types

# end of seedings of bank_card_types


# seeding roles

def seed_roles
	data = ActiveSupport::JSON.decode(File.read('db/seeds/roles.json'))
	data.each do |d|
		Role.create!(d)
	end
end

seed_roles

# end of seeding roles

# seeding refund_types

def seed_refund_types
	data = ActiveSupport::JSON.decode(File.read('db/seeds/refund_types.json'))
	data.each do |d|
		RefundType.create!(d)
	end
end

seed_refund_types

# end of seeding refund_types

# seeding of product_statuses

ActiveSupport::JSON.decode(File.read('db/seeds/product_statuses.json')).each do |d|
	ProductStatus.create!(d)
end

# end of seeding product_statuses

ActiveSupport::JSON.decode(File.read('db/seeds/guarantee_companies.json')).each do |d|
	GuaranteeCompany.create!(d)
end

ActiveSupport::JSON.decode(File.read('db/seeds/users.json')).each do |d|
	user = User.new
	user.user_name = d["user_name"]
	user.name = d["name"]
	user.id_num = d["id_num"]
	user.login_pass = BCrypt::Password.create(d["login_pass"])
	user.pay_pass = BCrypt::Password.create(d["pay_pass"])
	d["emails"].each do |email|
		user.emails << Email.new(:addr => email)
	end
	d["phones"].each do |phone|
		user.phones << Phone.new(:number => phone)
	end
	d["roles"].each do |role|
		user.roles << Role.find_by(:name_en => role)
	end
	user.save
end

ActiveSupport::JSON.decode(File.read('db/seeds/session_operations.json')).each do |d|
	SessionOperation.create!(d)
end

ActiveSupport::JSON.decode(File.read('db/seeds/session_statuses.json')).each do |d|
	SessionStatus.create!(d)
end

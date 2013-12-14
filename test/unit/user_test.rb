require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
	test "a user should enter a first name" do
		
		user = User.new
		assert !user.save
		assert !user.errors[:first_name].empty?
	end

	test "a user should enter a last name" do
		
		user = User.new
		assert !user.save
		assert !user.errors[:last_name].empty?
	end

	test "a user should enter a profile name" do
		
		user = User.new
		assert !user.save
		assert !user.errors[:profile_name].empty?
	end

	test "the user should have a unique profile name" do

		user = User.new
		user.profile_name = "xbarthrh"
		user.first_name = "Rob"
		user.last_name = "Bartholomew"
		user.email = "rob@racm.ca"
		user.password = "falconxx"
		user.password_confirmation = "falconxx"

		assert !user.save
		# puts user.errors.inspect

		user = User.new
		user.profile_name = users(:barthrh).profile_name
		user.first_name = users(:barthrh).first_name
		user.last_name = users(:barthrh).last_name
		user.email = users(:barthrh).email
		user.password = "falconxx"
		user.password_confirmation = "falconxx"

		refute user.save
		# puts "********"
		# puts user.errors.inspect

	end

	test "a user should have a profile name without spaces" do

		user = User.new
		user.profile_name = "With spaces"

		user.profile_name = users(:barthrh).profile_name
		user.first_name = users(:barthrh).first_name
		user.last_name = users(:barthrh).last_name
		user.email = users(:barthrh).email

		assert !user.save
		puts user.errors.inspect
		assert !user.errors[:profile_name].empty?
		assert user.errors[:profile_name].include?("Must be formatted correctly")

	end

end

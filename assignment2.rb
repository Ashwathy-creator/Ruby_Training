require 'yaml'
require 'byebug'

user_hash_file = YAML.load(File.read("users_data.yaml"))
product_hash_file = YAML.load(File.read("products_data.yaml"))

class User

    attr_reader :first_name, :last_name, :date_of_birth, :address, :role

    def initialize(user_hash)
        first_name = user_hash[:first_name]
        last_name = user_hash[:last_name]
        date_of_birth = user_hash[:date_of_birth]
        address = user_hash[:address]
        role = user_hash[:role]
    end


    def self.list_user_objects(user_hash_file)
        #byebug
        user_object = []
        user_hash_file.each do |user_hash|
            user_object << create_user(user_hash)
        end
        user_object
    end
        
    def self.list_buyers(user_hash_array)
        buyers = []
        user_hash_array.each do |user_hash|
            if user_hash[:role] == 'buyer'
                buyers << create_user(user_hash)
            end
        end
        buyers
    end

    def self.list_sellers(user_hash_array)
        sellers = []
        user_hash_array.each do |user_hash|
            if user_hash[:role] == 'seller'
                sellers << create_user(user_hash)
            end
        end
        sellers
    end

    def self.find_user_by_first_name(user_hash_array, first_name)
        @users = []
        user_hash_array.each do |user_hash|
            if user_hash[:first_name] == first_name.to_s
            @users << create_user(user_hash)
            end
        end
    end

    def self.full_name(user_hash)
        "#{user_hash[:first_name]} #{user_hash[:last_name]}"
    end

    def self.get_age(user_hash)
      require 'date'
      dob = Date.parse user_hash[:date_of_birth]
      age = Date.today.year - dob.to_date.year
    end

    private

    def self.create_user(user_hash)
        User.new(user_hash)
    end

end

  
p User.list_user_objects(user_hash_file) # returns User object correspond to the given list/hash
p User.list_buyers(user_hash_file) # returns only buyers
p User.list_sellers(user_hash_file) # returns only sellers
p User.find_user_by_first_name(user_hash_file, 'alex') # returns users with first name 'alex'
p User.full_name(user_hash_file.first) # returns full name
p User.get_age(user_hash_file.first) # returns age


class Product 
  attr_reader :product_name, :seller, :price, :category

  def initialize(product_hash)
    product_name = product_hash[:product_name]
    seller_name = product_hash[:seller]
    price = product_hash[:price]
    category = product_hash[:category]
  end

  def self.list_product_objects(product_hash_array)
    @product_object = []
    product_hash_array.each do |product_hash|
      @product_object << create_product(product_hash)
    end
    @product_object
  end

  private

  def self.create_product(product_hash)
    Product.new(product_hash)
  end

end

p Product.list_product_objects(product_hash_file) # returns Product object correspond to the given list/hash

    
    
  

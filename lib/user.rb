require 'bcrypt'
require_relative './database_connection'

# User class
class User
  attr_reader :id, :name, :email
  def initialize(id:, name:, email:)
    @id = id
    @name = name
    @email = email
  end

  def self.create(name:, email:, password:)
    encrypted_password = BCrypt::Password.create(password)
    result = DatabaseConnection.query("INSERT INTO users (name, email, password) VALUES('#{name}', '#{email}', '#{encrypted_password}') RETURNING id, name, email, password;").first
    User.new(
      id: result['id'],
      name: result['name'],
      email: result['email']
    )
  end

  def self.find(id:)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = #{id}").first
    User.new(
      id: result['id'],
      name: result['name'],
      email: result['email']
    )
  end

  def self.authenticate(email:, password:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}'").first
    return if result.nil?
    User.new(id: result['id'], name: result['name'], email: result['email'])
  end
end

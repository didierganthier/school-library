#!/usr/bin/env ruby
require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './rental'
require 'json'

ACTIONS = {
  1 => :list_books,
  2 => :list_people,
  3 => :create_person,
  4 => :create_book,
  5 => :create_rental,
  6 => :list_rentals,
  7 => :break
}.freeze

class App
  def save_data
    File.write('books.json', JSON.dump(@books))

    File.open('people.json', 'a') do |f|
      people_hashes = @person.map(&:to_json)
      f.write(JSON.dump(people_hashes))
    end

    File.write('rentals.json', JSON.dump(@rentals))
  end

  def print_question
    puts 'Welcome to School library App! 🏫📚'
    puts "Please choose an option by entering a number:
      1- List all books.
      2- List all people.
      3- Create a person.
      4- Create a book.
      5- Create a rental.
      6- List all rentals for a given person id.
      7- Exit."
  end

  def initialize
    @books = []
    @person = []
    @rentals = []
  end

  def select_option
    loop do
      print_question
      option = gets.chomp.to_i
      action = ACTIONS[option]

      if action == :break
        break
      elsif action
        send(action)
      else
        puts 'Invalid number, please try again!'
      end
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [input the number]'
    num = gets.chomp.to_i

    print 'age:'
    age = gets.chomp.to_i

    print 'Name:'
    name = gets.chomp

    case num
    when 1
      print 'Has parent permission? [y/n]:'
      parent_permission = gets.chomp
      parent_permission = parent_permission == 'y'
      @person.push(Student.new(age, name, parent_permission: parent_permission))
    when 2
      print 'Specialization:'
      specialization = gets.chomp
      @person.push(Teacher.new(age, specialization, name))
    else
      puts 'Invalid number, please enter number again!'
    end
    puts 'Person created successfully 👤'
  end

  def list_people
    @person.each { |per| puts "[#{per.class}] Name: #{per.name}, ID: #{per.id}, Age: #{per.age}" }
  end

  def list_books
    @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
  end

  def create_book
    print 'Title:'
    title = gets.chomp

    print 'author:'
    author = gets.chomp

    @books.push(Book.new(title, author))

    puts 'Book created successfully 📚'
  end

  def create_rental
    puts 'Select a book from the following list by number '
    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
    book_num = gets.chomp
    book_num = book_num.to_i

    puts 'Select a person from the following list by number (not id)'
    @person.each_with_index do |per, index|
      puts "No: #{index}, [#{per.class}] Name: #{per.name}, ID: #{per.id},
    Age: #{per.age}"
    end
    person_num = gets.chomp
    person_num = person_num.to_i

    print 'Date:'
    date = gets.chomp

    @rentals.push(Rental.new(date, @person[person_num], @books[book_num]))
    puts 'Rental Created successfully 📝 '
  end

  # List all rentals for a given person id
  def list_rentals
    print 'Id of person:'
    person_id = gets.chomp.to_i

    puts 'Rentals:'
    @rentals.find_all { |rental| rental.person.id == person_id }.each do |rental|
      puts "Date: #{rental.date} Book: #{rental.book.title} Person: #{rental.person.name}"
    end
  end
end

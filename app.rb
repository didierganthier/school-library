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
  def write_json
    persons = @person.each_with_index.map do |person, index|
      { class: person.class, age: person.age, name: person.name,
        specialization: (person.specialization if person.instance_of?(Teacher)),
        parent_permission: person.parent_permission, index: index, id: person.id }
    end

    json_person = JSON.generate(persons)
    File.write('person.json', json_person)

    books = @books.each_with_index.map do |book, index|
      {
        title: book.title, author: book.author, index: index
      }
    end
    json_books = JSON.generate(books)
    File.write('books.json', json_books)

    rentals = @rentals.each_with_index.map do |rental, _index|
      {
        date: rental.date, book_index: @books.index(rental.book),
        person_index: @person.index(rental.person)
      }
    end

    json_rentals = JSON.generate(rentals)
    File.write('rentals.json', json_rentals)
  end

  def load_persons
    return [] unless File.exist?('person.json')

    file = File.open('person.json')
    persons_read = File.read(file)
    persons_json = JSON.parse(persons_read)
    loaded_persons = []
    persons_json.each do |person|
      case person['class']
      when 'Teacher'
        loaded_persons << Teacher.new(person['age'], person['specialization'], person['name'])
      when 'Student'
        loaded_persons << Student.new(person['age'], person['name'], parent_permission: person['parent_permission'])
      end
    end
    file.close
    loaded_persons
  end

  def load_books
    return [] unless File.exist?('books.json')

    file = File.open('books.json')
    books_read = File.read(file)
    books_json = JSON.parse(books_read)
    loaded_books = []

    books_json.each do |book|
      loaded_books << Book.new(book['title'], book['author'])
    end
    file.close
    loaded_books
  end

  def load_rentals
    return [] unless File.exist?('rentals.json')

    file = File.open('rentals.json')
    rentals_read = File.read(file)
    rentals_json = JSON.parse(rentals_read)
    loaded_rentals = []

    rentals_json.each do |rental|
      loaded_rentals << Rental.new(rental['date'], @person[rental['person_index']], @books[rental['book_index']])
    end
    file.close
    loaded_rentals
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
    @books = load_books
    @person = load_persons
    @rentals = load_rentals
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

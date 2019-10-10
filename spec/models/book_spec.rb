require 'rails_helper'

RSpec.describe Book, type: :model do
  context 'validation tests' do
    it 'ensures presence of isbn'do
      book=Book.new(author:"Agatha",title:"Alice",language:"English",published:"10-12-2017", edition:"2", subject:"Mystery", summary:"some summary", copies:"5", library_id:"1").save
      expect(book).to eq(false)
    end
    it 'ensures presence of title'do
      book=Book.new(isbn:"123",author:"Agatha",language:"English",published:"10-12-2017", edition:"2", subject:"Mystery", summary:"some summary", copies:"5", library_id:"1").save
      expect(book).to eq(false)
    end
    it 'ensures presence of author'do
      book=Book.new(isbn:"123",language:"English",title:"Alice",published:"10-12-2017", edition:"2", subject:"Mystery", summary:"some summary", copies:"5", library_id:"1").save
      expect(book).to eq(false)
    end
    it 'ensures presence of language'do
      book=Book.new(isbn:"123",author:"Agatha",title:"Alice",published:"10-12-2017", edition:"2", subject:"Mystery", summary:"some summary", copies:"5", library_id:"1").save
      expect(book).to eq(false)
    end
    it 'ensures presence of published'do
      book=Book.new(isbn:"123",author:"Agatha",title:"Alice", edition:"2", subject:"Mystery", summary:"some summary", copies:"5", library_id:"1",language:"English").save
      expect(book).to eq(false)
    end
    it 'ensures presence of edition'do
      book=Book.new(isbn:"123",author:"Agatha",title:"Alice",published:"10-12-2017",  subject:"Mystery", summary:"some summary", copies:"5", library_id:"1",language:"English").save
      expect(book).to eq(false)
    end
    it 'ensures presence of subject'do
      book=Book.new(isbn:"123",author:"Agatha",title:"Alice",published:"10-12-2017", edition:"2", summary:"some summary", copies:"5", library_id:"1",language:"English").save
      expect(book).to eq(false)
    end
    it 'ensures presence of summary'do
      book=Book.new(isbn:"123",author:"Agatha",title:"Alice",published:"10-12-2017", edition:"2", subject:"Mystery", copies:"5", library_id:"1",language:"English").save
      expect(book).to eq(false)
    end
    it 'ensures presence of copies'do
      book=Book.new(isbn:"123",author:"Agatha",title:"Alice",published:"10-12-2017", edition:"2", subject:"Mystery", summary:"some summary", library_id:"1",language:"English").save
      expect(book).to eq(false)
    end
    it 'ensures presence of library_id'do
      book=Book.new(isbn:"123",author:"Agatha",title:"Alice",published:"10-12-2017", edition:"2", subject:"Mystery", summary:"some summary", copies:"5",language:"English").save
      expect(book).to eq(false)
    end
    it 'ensures presence of all of the parameters'do
      book1=Book.new(isbn:"123",author:"Agatha",title:"Alice",published:"10-12-2017", edition:"2", subject:"Mystery", summary:"some summary", copies:"5",language:"English",library_id:"1")
      expect(book1).to eq(true)
    end

  end
end

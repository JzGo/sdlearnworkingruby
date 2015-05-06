class BookDatabase
  def set_books books
    @books = books
  end

  def get_books author
    @books[author]
  end

  def count_books author
    books = @books[author]
    if books == nil
      "No such author"
    else
      books.length
    end
  end

  def find book
    result = nil
    @books.each do |author, books|
      if books.include? book
        result = author
      end
    end
    if result
      result
    else
      "No such book"
    end
  end

  def add_book author, title
    books = @books[author]
    if books
      if books.include? title
        "That book is already in the system"
      else
        books << title
      end
    else
      "No such author"
    end
  end

  def delete_book author, title
    books = @books[author]
    if books
      if books.include? title
        books.delete title
      else
        "No such title"
      end
    else
      "No such author"
    end
  end
end

class BookDatabase
  def set_books books
    @books = books
  end

  def find_author books
    @books = books
    @authors = authors_from_books @books

  def authors_from_books books
    books.each do |author, books|
      x += 
    end
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
        return result
      else
        return "No such book"
      end
    end
  end

  def add_book author, title
    books = @books[author]
    if books
      if books.include? title
        error_m = "That book is already in the system"
        return error_m
      else
        books << title
      end
    else
       error_m = "No such author"
       return error_m
    end
  end

  def delete_book author, title
    books = @books[author]
    if books
      if books.include? title
        books.delete title
      else
        error_m = "No such title"
        return error_m
      end
    else
      error_m = "No such author"
      return error_m
    end
  end
end

require_relative 'spec_helper'
require_relative '../book_database'

RSpec.describe BookDatabase do
  bd = BookDatabase.new
  bd.set_books({ #Need parenthesis here so Ruby doesn't think this is a block
    'Frank Herbert'   => ['Dune', 'Dune Messiah', 'Children of Dune', 'God Emperor of Dune'],
    'Isaac Asimov'    => ['Foundation', 'Foundation and Empire', 'Second Foundation'],
    'Mervyn Peake'    => ['Titus Groan', 'Gormenghast'],
    'William Goldman' => ['The Princess Bride']
  })

  describe "count" do
    it "returns 4 for the count for Frank Herbert" do
      expect(bd.count_books 'Frank Herbert').to eq 4
    end

    it "returns 1 for the count for William Goldman" do
      expect(bd.count_books 'William Goldman').to eq 1
    end
  end

  describe "get" do
    it "returns Dune and Dune Messiah for Frank Herbert" do
      books = bd.get_books "Frank Herbert"
      expect(books).to include 'Dune'
      expect(books).to include 'Dune Messiah'
    end

    it "returns Titus Groan and Gormeghast for the count for Frank Mervyn Peake" do
      books = bd.get_books "Mervyn Peake"
      expect(books).to include "Titus Groan"
      expect(books).to include "Gormenghast"
    end
  end

  describe "find" do
    it "returns Frank Herbert for Dune" do
      expect(bd.find "Dune").to eq "Frank Herbert"
    end
  end

  describe "delete" do
    it "removes Foundation from Isaac Asimov" do
      bd.delete_book "Isaac Asimov", "Foundation"
      expect(bd.find "Foundation").to eq "No such book"
    end

    it "removes Gormenghast from Mervyn Peake" do
      bd.delete_book 'Mervyn Peake', 'Gormenghast'
      expect(bd.count_books 'Mervyn Peake').to eq 1
    end
  end
end

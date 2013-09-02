module BookTracksHelper

  def book_tracks_list(books)
    list = books.map {|book| \
    link_to(book.user.full_name, book_user) + \
    link_to(book.quoted_title, book) \
    }
    inner = list.map {|line| content_tag(:li, line)}.join("\r\n")
    content_tag(:ul, inner.html_safe, class: "listos-list")
  end

end

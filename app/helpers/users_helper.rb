module UsersHelper

  def profile_partial
    current_user.author ? "author_profile" : 'user_profile'
  end

  def user_avatar(user)
    user.avatar? ? image_tag(user.avatar_url(:thumb)) : image_tag("user/noavatar.png")
  end

  def show_panel
    true
  end

  def child_profile_info(user)
    out = ""
    ["city","age","gender","school","school_class", "favourite_class","library"].each do |field|
      unless user.profile.hide_fields.include?(field) || user.profile.try(field).blank?
        div = content_tag(:span, t("helpers.label.profile.#{field}")+": ", :class => "field_name")
        div << case field
                 when "age"
                   user.age
                 when "gender"
                   t("gender.#{user.profile.gender}")
                 else user.profile.send(field)
               end
        out << content_tag(:div,div.html_safe,:class => "profile_line")
      end
    end
    content_tag(:div,out.html_safe,class:"profile_info")
  end

  def favourite_books_list(profile)
    if profile.favourite_books.any? && !profile.hide_fields.include?("favourite_books")
      out = content_tag(:div, t("helpers.label.profile.favourite_books"), class: "field_name")
      inner = profile.favourite_books.map {|book| content_tag(:div, book, class: "book_line")}.join("\r\n")
      out << content_tag(:div, inner, class: "profile_line_text")
      content_tag(:div,out.html_safe,class:"profile_info")
    end
  end

  def why_jury(profile)
    if profile.why_jury.present? &&  !profile.hide_fields.include?("why_jury")
      out = content_tag(:div, t("helpers.label.profile.why_jury"), class: "field_name")
      out << content_tag(:div, profile.why_jury, class: "profile_line_text")
      content_tag(:div,out.html_safe,class:"profile_info")
    end
  end

  def adult_profile_info(user)
    out = "";
    ["city","age","gender","education","interest","profession"].each do |field|
      div = content_tag(:span, t("helpers.label.profile.#{field}")+": ", :class => "field_name")
      div << case field
               when "age"
                 user.age
               when "gender"
                 t("gender.#{user.profile.gender}")
               else user.profile.send(field)
             end
      out << content_tag(:div,div.html_safe,:class => "profile_line")
    end
    out
  end


end

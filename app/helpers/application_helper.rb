module ApplicationHelper

  def login_links
    if current_user
      link_to(current_user.full_name, current_user, class: "profile_link") +
          link_to("","user_messages_path(current_user)",:class=>"login-icons-message login_icon") +
          content_tag(:sup, "2") +
          link_to("",current_user,:class=>"login-icons-smile login_icon") +
          link_to("",edit_user_path(current_user),:class=>"login-icons-gear login_icon") +
          link_to(t("links.logout"),logout_path)
    else
      link_to("Войти", login_path, :class => "fancybox_ajax") +
          content_tag(:span, "", :class=>"sep") +
          link_to("Зарегистрироваться", new_user_path, :class => "")
    end
  end


end

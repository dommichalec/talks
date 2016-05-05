module TalksHelper
  def display_registration_for(talk)
    if talk.sold_out?
      content_tag(:p, "Registration is full!", class: 'label label-pill label-danger')
    else
      link_to "Register now!", new_talk_registration_path(talk), class: 'label label-pill label-success'
    end
  end
end

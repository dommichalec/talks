module TalksHelper
  def display_registration_for(talk)
    if talk.sold_out?
      content_tag(:p, "Talk is sold out!", class: 'label label-pill label-danger')
    else
      link_to "Registration is now open!", new_talk_registration_path(talk), class: 'label label-pill label-success'
    end
  end
end

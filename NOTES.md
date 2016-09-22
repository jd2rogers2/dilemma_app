when updating factor from options#edit no error message for invalid entries


notes from refactoring video
-content_tag_for
-can remove partial: and locals: from render


before_action :redirect_if_not_signed_in

def redirect_if_not_signed_in
  redirect_to root_path unless user_signed_in?
end
class ContentDiscussionFormsController < ApplicationController

  def create
    content_discussion_form = ContentDiscussionForm.new(form_params)
    discussion = content_discussion_form.persist!
    redirect_to discussion
  end

  private

  def form_params
    params.require(:content_discussion_form).
      permit(
        :name,
        :type,
        :subject
        ).
      merge(user: current_user)
  end



end
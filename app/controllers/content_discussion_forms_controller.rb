class ContentDiscussionFormsController < ApplicationController
  def create
    @content_discussion_form = ContentDiscussionForm.new(form_params)
    @content = @content_discussion_form.persist
    if @content.errors.any?
      render "discussions/new"
    else
      redirect_to @content.discussion
    end
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

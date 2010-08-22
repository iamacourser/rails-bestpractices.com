module NotificationsHelper
  def notification_message(notification)
    notifierable = notification.notifierable
    if notifierable.is_a? Comment
      comment = notifierable
      "#{comment_user_link(comment)} commented on your rails best practice #{link_to comment.parent_name, comment_parent_link(comment)}"
    elsif notifierable.is_a? Answer
      answer = notifierable
      "#{link_to answer.user.login, user_path(answer.user)} answered your question #{link_to answer.question.title, question_path(answer.question)}"
    end
  end
end

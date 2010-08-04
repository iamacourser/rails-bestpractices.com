module CommentsHelper
  def comment_user_link(comment)
    if comment.user
      link_to comment.user.login, user_path(comment.user), :target => '_blank'
    else
      comment.username
    end
  end

  def comment_parent_link(comment)
    commentable = comment.commentable
    if commentable.is_a? Post
      post_url(commentable)
    elsif commentable.is_a? Question
      question_url(commentable)
    elsif commentable.is_a? Answer
      question_url(commentable.question)
    elsif commentable.is_a? Implementation
      post_implementation_url(commentable.post)
    end
  end
end

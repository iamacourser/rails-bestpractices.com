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
    case commentable
    when Post
      post_url(commentable)
    when Question
      question_url(commentable)
    when Answer
      question_url(commentable.question)
    when Implementation
      post_implementation_url(commentable.post)
    end
  end
end

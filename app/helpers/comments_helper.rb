module CommentsHelper
  def comment_user_link(comment)
    if comment.user
      link_to comment.user.login, user_path(comment.user), :target => '_blank'
    else
      comment.username
    end
  end

  def comment_parent_link(comment)
    if comment.commentable.is_a? Post
      post_url(comment.commentable)
    elsif comment.commentable.is_a? Implementation
      post_implementation_url(comment.commentable.post)
    end
  end
end

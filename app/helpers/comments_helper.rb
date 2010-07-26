module CommentsHelper
  def comment_user_link(comment)
    if comment.user and comment.user.url
      link_to comment.user.login, comment.user.url, :target => '_blank'
    elsif comment.user
      comment.user.login
    else
      comment.username
    end
  end

  def comment_parent_link(comment)
    if comment.commentable.is_a? Post
      post_url(comment.commentable)
    elsif comment.commentable.is_a? Implementation
      post_implmentation_url(comment.commentable.implementation)
    end
  end
end

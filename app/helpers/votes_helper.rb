module VotesHelper
  def vote_like_link(post)
    unless current_user
      return link_to_function('Like', "javascript:alert('You should log in before vote!');", :class => 'like-icon')
    end
    vote = post.vote current_user
    if vote
      if vote.like?
        link_to 'Like', "javascript:alert('You have voted like this best practices!');", :class => 'like-icon active'
      else
        button_to 'Like', post_vote_path(post, vote), :method => :delete, :class => 'like-icon'
      end
    else
      button_to 'Like', post_votes_path(@post, :like => true), :class => 'like-icon'
    end
  end
  
  def vote_dislike_link(post)
    unless current_user
      return link_to_function('Dislike', "javascript:alert('You should log in before vote!');", :class => 'dislike-icon')
    end
    vote = post.vote current_user
    if vote
      if vote.like?
        button_to 'Dislike', post_vote_path(post, vote), :method => :delete, :class => 'dislike-icon'
      else
        link_to 'Dislike', "javascript:alert('You have voted dislike this best practices!');", :class => 'dislike-icon active'
      end
    else
      button_to 'Dislike', post_votes_path(@post, :like => false), :class => 'dislike-icon'
    end
  end
end

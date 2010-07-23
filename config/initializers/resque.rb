unless ENV['RAILS_ENV'] == 'production'
  module Resque
    class << self
      alias_method :orig_enqueue, :enqueue
      def Resque.enqueue(*args) ; end
    end
  end
end

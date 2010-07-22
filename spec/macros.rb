# NOTE: The followings are quick hacks for now, probably need some refinements later on !!
module RailsBestPractices
  module Macros

    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods

      def context_klass
        # NOTE: This part is abit brittle, assumes the the context description to be a
        # stringified class name or the class itself.
        self.description.split('::').inject(Object) {|klass, const| klass.const_get(const) }
      end

      def should_be_gravastic
        # NOTE: We don't test the internals of Gravtastic, we just make sure that the side
        # effects of declaring :is_gravtastic!, :is_gravtastic or :has_gravatar are present.
        basic_included_modules = Class.new(ActiveRecord::Base).included_modules
        klass_included_modules = context_klass.included_modules
        it 'should be declared as gravtastic' do
          (klass_included_modules - basic_included_modules).map(&:to_s).should \
            include('Gravtastic::InstanceMethods')
        end
      end

      def should_act_as_authentic
        # NOTE: We don't test the internals of Authlogic, we just make sure that the side
        # effects of declaring :acts_as_authentic is present.
        basic_included_modules = Class.new(ActiveRecord::Base).included_modules
        klass_included_modules = context_klass.included_modules
        it 'should be declared as acting as authentic' do
          (klass_included_modules - basic_included_modules).
            any?{|mod| mod.to_s =~ /Authlogic::ActsAsAuthentic::/ }.should be_true
        end
      end

      def should_be_tweetable

      end

      def should_be_markdownable

      end

    end

  end
end

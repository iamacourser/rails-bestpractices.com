# NOTE: The followings are quick hacks for now, probably need some refinements later on !!
module RailsBestPractices
  module Macros

    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods

      def should_be_gravastic
        # NOTE: Just like we don't test the internals of ActiveRecord, we don't test Gravtastic
        # as well ... We just wanna make sure the side effect is present, namely, the appropriate
        # module is included.
        should_include_module 'should be gravtastic', 'Gravtastic::InstanceMethods'
      end

      def should_act_as_authentic
        # NOTE: Just like we don't test the internals of ActiveRecord, we don't test Authlogic
        # as well ... We just wanna make sure the side effect is present, namely, the appropriate
        # module is included.
        should_include_module 'should be acting as authentic', /Authlogic::ActsAsAuthentic::/
      end

      def should_act_as_taggable
        # NOTE: Just like we don't test the internals of ActiveRecord, we don't test ActsAsTaggableOn
        # as well ... We just wanna make sure the side effect is present, namely, the appropriate
        # module is included.
        should_include_module 'should be acting as taggable', /ActsAsTaggableOn::Taggable::/
      end

      def should_have_entries_per_page(count)
        klass = context_klass
        it 'should have 10 posts per page' do
          klass.per_page.should equal(count)
        end
      end

      def should_have_user_ownership(klass=nil)
        klass ||= context_klass
        it 'should belong to someone if he is the owner of it' do
          someone = Factory(:user)
          Factory(klass.to_s.tableize.singularize.to_sym, :user => someone).
            belongs_to?(someone).should be_true
        end
        it 'should not belong to someone if he is not the owner of it' do
          someone = Factory(:user)
          Factory(klass.to_s.tableize.singularize.to_sym).belongs_to?(someone).should be_false
        end
      end

      def should_be_tweetable

      end

      def should_be_markdownable

      end

      private

        def context_klass
          # NOTE: This part is abit brittle, assumes the the context description to be a
          # stringified class name or the class itself.
          self.description.split('::').inject(Object) {|klass, const| klass.const_get(const) }
        end

        def should_include_module(description, module_name_or_regexp)
          basic_included_modules = Class.new(ActiveRecord::Base).included_modules
          klass_included_modules = context_klass.included_modules
          extra_modules = (klass_included_modules - basic_included_modules).map(&:to_s)

          it(description)do
            case module_name_or_regexp
            when Regexp
              extra_modules.any?{|mod| mod =~ module_name_or_regexp }.should be_true
            else
              extra_modules.should include(module_name_or_regexp.to_s)
            end
          end
        end

    end

  end
end

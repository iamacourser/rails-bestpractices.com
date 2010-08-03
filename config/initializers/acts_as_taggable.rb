module ActsAsTaggableOn
  class Tag
    def posts
      Post.tagged_with(self.name)
    end

    def questions
      Question.tagged_with(self.name)
    end
  end
end

require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database
    include Singleton

    def initialize
        super(questions.db)
        self.type_translation = true
        self.results_as_hash = true
    end

end

class Users

    def initialize(options)
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']
    end

end

class Questions

end

class QuestionFollows

end

class Replies

end

class QuestionLikes

end

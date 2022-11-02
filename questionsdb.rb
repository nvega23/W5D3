require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database
    include Singleton

    def initialize
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true
    end

end

class Users
    attr_accessor :id, :fname, :lname
    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM users")
        data.map{|datum| Users.new(datum)}
    end

    def self.find_by_id(id)
        Users.all.select{|ele| ele.id == id}
    end

    def self.find_by_name(fname, lname)
        Users.all.select{|ele| ele.fname == fname && ele.lname == lname}
    end

    def self.authored_questions(id)
        authored_questions = []
        Users.find_by_id(id).each do |ele|
            authored_questions << Question.find_by_user_id(1)
        end
        authored_questions
    end

    def initialize(options)
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']
    end

end

class Question
    attr_accessor :id, :title, :body, :user_id
    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM questions")
        data.map{|datum| Question.new(datum)}
    end

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @user_id = options['user_id']
    end


    def self.find_by_id(id)
        Question.all.select{|ele| ele.id == id}
    end

    def self.find_by_title(title)
        Question.all.select{|ele| ele.title == title}
    end

    def self.find_by_user_id(id)
        Question.all.select{|ele| ele.user_id == id}
    end

end

class QuestionFollows

    attr_accessor :id, :question_id, :users_id

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM question_follows")
        data.map{|datum| QuestionFollows.new(datum)}
    end

    def initialize(options)
        id = options['id']
        question_id = options['question_id']
        users_id = options['users_id']
    end

    def self.find_by_id(id)
        QuestionFollows.all.select{|ele| ele.id == id}
    end



end

class Replies
    attr_accessor :id, :question_id, :parent_reply_id, :parent_reply_id, :user_id, :reply_body, :top_level, :subject_question
    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM replies")
        data.map{|datum| Replies.new(datum)}
    end

    def initialize(options)
        id = options['id']
        question_id = options['question_id']
        parent_reply_id = options['parent_reply_id']
        user_id = options['user_id']
        reply_body = options['reply_body']
        top_level = options['top_level']
        subject_question = options['subject_question']
    end

    def self.find_by_id(id)
        Replies.all.select{|ele| ele.id == id}
    end

    def self.find_by_subject_question(subject)
        Replies.all.select{|ele| ele.subject == subject}
    end


end

class QuestionLikes

    attr_accessor :id, :question_likes, :user_id, :question_id

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM question_likes")
        data.map{|datum| QuestionLikes.new(datum)}
    end

    def initialize(options)
        id = options['id']
        question_likes = options['question_likes']
        user_id = user_id['user_id']
        question_id = options['question_id']
    end

    def self.find_by_id(id)
        QuestionLikes.all.select{|ele| ele.id == id}
    end

end

module Issues
  class Creator
    def self.create!(project:, title:, url:, body:, github_issue_id:)
      Issues::Creator.new(
        project: project,
        title: title,
        url: url,
        body: body,
        github_issue_id: github_issue_id
      ).create!
    end

    def initialize(project:, title:, url:, body:, github_issue_id:)
      @project = project
      @title = title
      @url = url
      @body = body
      @github_issue_id = github_issue_id
    end

    def create!
      issue = Issue.new(
        project: @project,
        title: @title,
        url: @url,
        github_issue_id: @github_issue_id
      )
      build_issue_languages(issue, @body)
      issue.save!
      issue
    end

   private

    def build_issue_languages(issue, issue_data_body)
      return if issue_data_body.blank?

      language_names = parse_language_names(issue_data_body)

      language_names.each do |language_name|
        issue.languages << Language.find_by(name: language_name)
      end
    end

    def parse_language_names(issue_data_body)
      known_language_names = Language.all.pluck(:name)

      # split by newline to get the first line of the Github issue body
      first_line = issue_data_body.split(/\n/, 2).first
      # split by spaces and select the words where the first letter is a #
      language_names = first_line.split(' ').select { |word| word[0] == '#'}

      language_names.each do |language_name|
        # remove the # and make the word lowercase
        language_name.slice!(0).downcase!
        # remove the word from the array if it is not a known language
        unless known_language_names.include?(language_name)
          language_names.delete(language_name)
        end
      end
      language_names
    end
  end
end

require 'open-uri'
class RequestMailer < ActionMailer::Base
  default from: "from@example.com"

  def check_request
    User.all.each do |user|
      user.requests.each do |request|
          file_contents = open(request.website) {|f| f.read}
          if file_contents.lines.select { |l| l.downcase.include?(request.stringmatch) }.count > 0
            mail(
              to: request.user.email,
              subject: "Your requested Woot!",
              from: "b@example.com"
            )
          end
      end
    end
  end
end
